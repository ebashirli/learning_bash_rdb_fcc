#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

SECRET_NUMBER=$((RANDOM % 1000 + 1))
NUMBER_OF_GUESSES=0
GAMES_PLAYED=0

GAME_SCREEN(){
  read GUESS

  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then 
    echo "That is not an integer, guess again:"
    GAME_SCREEN
  else
    if [[ $GUESS = $SECRET_NUMBER ]]
    then
      let NUMBER_OF_GUESSES++
      echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
            USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
      INSERT_GAME_RESULT=$($PSQL "INSERT INTO games (user_id, number_of_guesses) VALUES ($USER_ID, $NUMBER_OF_GUESSES)")

    if [[ $GUESS > $SECRET_NUMBER ]]
    then
      echo -e "It's lower than that, guess again:"
      # NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES+1))
      let NUMBER_OF_GUESSES++
      GAME_SCREEN $SECRET_NUMBER $NUMBER_OF_GUESSES
    elif [[ $GUESS < $SECRET_NUMBER ]]
    then
      echo -e "It's higher than that, guess again:"
      let NUMBER_OF_GUESSES++
      GAME_SCREEN $SECRET_NUMBER $NUMBER_OF_GUESSES
    fi
  fi
}

echo "Enter your username:"
read USERNAME

CHECK_USER=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")

if [[ -z $CHECK_USER ]]
then
  echo Welcome, $USERNAME! It looks like this is your first time here.
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users (username, games_played, best_game) VALUES ('$USERNAME', 1, 0)")
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username = '$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username = '$USERNAME'")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username = '$USERNAME'")
let GAMES_PLAYED++   
UPDATE_GAMES_PLAYED_RESULT=$($PSQL "UPDATE users SET games_played = '$GAMES_PLAYED' WHERE username = '$USERNAME'")

echo "Guess the secret number between 1 and 1000: "

GAME_SCREEN
