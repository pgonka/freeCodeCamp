#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

FORMAT_OUTPUT() {
  if [[ -z $1 || -z $2 ]]
  then
    echo I could not find that element in the database.
  else
    IFS="|" read TYPE_ID ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE <<< $1
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, \
with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling \
point of $BOILING_POINT celsius."
  fi
}

if [[ -z $1 ]] 
then
  echo Please provide an element as an argument.
elif [[ $1 =~ ^[0-9]+$ ]]
then
  ATOMIC_NUMBER=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1;")
  FORMAT_OUTPUT $ATOMIC_NUMBER $1
elif [[ $1 =~ ^[a-zA-Z]{1,2}$ ]]
then
  SYMBOL=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$1';")
  FORMAT_OUTPUT $SYMBOL $1
elif [[ $1 =~ ^[a-zA-Z]+$ ]]
then
  NAME=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name='$1';")
  FORMAT_OUTPUT $NAME $1
else
  echo Please provide a valid element as an argument.
fi
