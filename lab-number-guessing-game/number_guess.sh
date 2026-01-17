#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

MIN=1
MAX=1000
NUMBER=$(( $RANDOM % ( $MAX - $MIN + 1 ) + $MIN ))
GUESS=-1
NUMBER_OF_GUESSES=0

echo Enter your username:
read USERNAME
USER_DATA=$($PSQL "SELECT user_id, COUNT(g) as games_played, COALESCE(MIN(g.attempts), 0) as best_game FROM users FULL JOIN games g USING(user_id) WHERE username='$USERNAME' GROUP BY user_id;")
IFS="|" read USER_ID GAMES_PLAYED BEST_GAME <<< $USER_DATA

if [[ -z $USER_ID ]]
then
  Q=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
else 
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi


CHECK_GUESS() {
  if [[ -z $1 ]]
  then
    echo -e "\nGuess the secret number between $MIN and $MAX:"
  else
    echo -e "\n$1"
  fi

  read GUESS
  if [[ ! $GUESS =~ ^[0-9]+$ ]] 
  then
    CHECK_GUESS "That is not an integer, guess again:"
    return
  fi

  NUMBER_OF_GUESSES=$(( $NUMBER_OF_GUESSES + 1 ))
  if (( $NUMBER < $GUESS ))
  then
    CHECK_GUESS "It's lower than that, guess again:"
    return
  elif (( $NUMBER > $GUESS ))
  then
    CHECK_GUESS "It's higher than that, guess again:"
    return
  else
    echo You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $NUMBER. Nice job!
    Q=$($PSQL "INSERT INTO games(user_id, attempts) VALUES($USER_ID, $NUMBER_OF_GUESSES);")
    return
  fi
}

CHECK_GUESS
