#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

echo -e "\n~~ Hair Saloon ~~\n"

MAIN_MENU() {
  
  if [[ ! -z $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "\nWelcome, how can I help you?\n"

  $PSQL "SELECT * FROM services;" | while IFS="|" read service_id name
  do
    if [[ $service_id != 'service_id' ]]
    then
      echo -e "$service_id) $name"
    fi
  done

  read SERVICE_ID_SELECTED
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    MAIN_MENU "Please enter a valid number."
  else 
    SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED;")
    if [[ -z $SERVICE_ID ]]
    then
      MAIN_MENU "Please enter a valid number."
    else
      SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID;")
      echo -e "\nPlease enter your Phone Number:"
      read CUSTOMER_PHONE   
      
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
      if [[ -z $CUSTOMER_ID ]]
      then
        echo -e "\nPlease enter your Name:"
        read CUSTOMER_NAME
        Q=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
      fi
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE';")
      
      echo -e "\nPlease enter a time you wish to make your appointment:"
      read SERVICE_TIME
      
      $PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME');"

      echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."   
    fi
  fi
}

MAKE_APPOINTMENT() {
  SERVICE_ID=$1
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID;")
  echo -e "\nPlease enter your Phone Number:"
  read CUSTOMER_PHONE
  
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
  if [[ -z $CUSTOMER_ID ]]
  then
    echo -e "\nPlease enter your Name:"
    read CUSTOMER_NAME
    Q=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
  fi
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE';")
  
  echo -e "\nPlease enter a time you wish to make your appointment:"
  read SERVICE_TIME
  
  Q=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME');")

  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."   
}

MAIN_MENU