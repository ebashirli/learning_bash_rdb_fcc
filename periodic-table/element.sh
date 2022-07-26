#!/bin/bash
FIRST_ARG=$1

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

MAIN_MENU(){
  
  if [[ -z $FIRST_ARG ]]
  then
    echo Please provide an element as an argument.
  else
    WHERE_COND=""
    if [[ "$FIRST_ARG" =~ ^[0-9]+$ ]]
    then
      WHERE_COND="atomic_number=$FIRST_ARG"
    elif [[ ${#FIRST_ARG} > 2 ]]
    then
      WHERE_COND="name='$FIRST_ARG'"
    else
      WHERE_COND="symbol='$FIRST_ARG'"
    fi
    
    ELEMENT="$($PSQL "SELECT * FROM elements FULL JOIN properties USING(atomic_number) LEFT JOIN types USING (type_id) WHERE $WHERE_COND;")"
    # echo $ELEMENT
    read TYPE_ID _ ATOMIC_NUMBER _ SYMBOL _ NAME _ ATOMIC_MASS _ MELTING_POINT _ BOILING_POINT _ TYPE <<< "$ELEMENT"

    if [[ -z $TYPE_ID ]]
    then
      echo I could not find that element in the database.
    else
      echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    fi


  fi
}
MAIN_MENU