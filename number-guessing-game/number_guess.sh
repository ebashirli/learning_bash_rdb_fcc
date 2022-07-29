#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

NUMBER=$((RANDOM % 1000 + 1))
NUMBER_OF_GUESSES=0
GAMES_PLAYED=0

GAME_SCREEN() {
  read GUESS

  if [[ $GUESS =~ ^[0-9]+$ ]]
  then
    if [[ $GUESS = $NUMBER ]]
    then
      let NUMBER_OF_GUESSES++

      echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $NUMBER. Nice job!"

      #Update best game yet
      BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username = '$USERNAME'")
      if [[ $BEST_GAME -eq 0 || $NUMBER_OF_GUESSES -lt $BEST_GAME ]]
      then
        UPDATE_BEST_GAME_RESULT=$($PSQL "UPDATE users SET best_game = '$NUMBER_OF_GUESSES' WHERE username = '$USERNAME'")
      fi
        
    else if [[ $GUESS > $NUMBER ]]
      then
        let NUMBER_OF_GUESSES++
        echo "It's lower than that, guess again:"
        GAME_SCREEN
      else 
        let NUMBER_OF_GUESSES++
        echo "It's higher than that, guess again:"
        GAME_SCREEN
      fi
    fi
  else
    echo "That is not an integer, guess again:"
    GAME_SCREEN
  fi
}

echo "Enter your username:"
read USERNAME

GUESSER=$($PSQL "SELECT * FROM users WHERE username = '$USERNAME'")

if [[ -z $GUESSER ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USERNAME', 0, 0)")
else
  echo "$GUESSER" | while IFS="|" read _ USERNAME BEST_GAME GAMES_PLAYED
  do
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done  
fi

#Update number of games played
GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username = '$USERNAME'")
echo GAMES_PLAYED $GAMES_PLAYED
let GAMES_PLAYED++
UPDATE_GAMES_PLAYED_RESULT=$($PSQL "UPDATE users SET games_played = '$GAMES_PLAYED' WHERE username = '$USERNAME'")

echo "Guess the secret number between 1 and 1000:"

GAME_SCREEN