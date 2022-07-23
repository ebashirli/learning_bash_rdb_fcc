#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  SERVICES=$($PSQL "SELECT * FROM services;")
  echo -e "Please select a service by entering its number."
  echo "$SERVICES" | sed 's/ | /) /g'
  read SERVICE_ID_SELECTED
  # check if entered value is an integer
  if [[ $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    SERVICE_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    if [[ -z $SERVICE_SELECTED ]]
    then
      MAIN_MENU "Please select a valid service."
    else
      echo -e "\nPlease enter your phone number."
      read CUSTOMER_PHONE
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
      if [[ -z $CUSTOMER_ID ]]
      then
        echo -e "\nWe don't have your records please enter your name."
        read CUSTOMER_NAME
        INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers (phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
        if [[ -z $INSERT_CUSTOMER_RESULT ]]
        then
          MAIN_MENU "Error occured. Please try again..."
        else
          CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
        fi
      fi
      echo -e "\nPlease enter appointment time for today."
      read SERVICE_TIME
      INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
      if [[ -z $INSERT_APPOINTMENT_RESULT ]]
      then
          MAIN_MENU "Error occured. Please try again..."
      else
        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id=$CUSTOMER_ID")
        echo "I have put you down for a $SERVICE_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME." | tr -s " "
      fi

    fi
  else
    MAIN_MENU "Please enter an integer."
  fi
}

MAIN_MENU