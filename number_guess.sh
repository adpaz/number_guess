#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only -c"

RANDOM_NUMBER=$((RANDOM % 1000 + 1))
echo "This is the random number $RANDOM_NUMBER"

echo "Enter your username:"
read USERNAME
declare -i COUNT=0

GUESSING_GAME() {
  read GUESS
  COUNT+=1
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    GUESSING_GAME
  elif [[ $GUESS > $RANDOM_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
    GUESSING_GAME
  elif [[ $GUESS < $RANDOM_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
    GUESSING_GAME
  else
    #$($PSQL "INSERT INTO guessers(username) VALUES ('$USERNAME')")
    $($PSQL "UPDATE guessers SET games_played=games_played + 1 WHERE username='$USERNAME'")
    $($PSQL "UPDATE guessers SET best_game='$COUNT' WHERE best_game > $COUNT OR best_game = 0 AND username='$USERNAME'")

    echo "You guessed it in $COUNT tries. The secret number was $RANDOM_NUMBER. Nice job!"
    

    #You guessed it in <number_of_guesses> tries. The secret number was <secret_number>. Nice job!
  fi



}


DOESUSEREXIST=$($PSQL "SELECT username FROM guessers WHERE username='$USERNAME'")
if [[ $DOESUSEREXIST ]]
then
  USERDATA=$($PSQL "SELECT * FROM guessers WHERE username='$USERNAME'")
  echo "$USERDATA" | while read USER_NAME BAR GAMES_PLAYED BAR BEST_GAME BAR USER_ID
  do
    echo "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    echo "Guess the secret number between 1 and 1000:"
  done
else
  $($PSQL "INSERT INTO guessers(username, games_played, best_game) VALUES ('$USERNAME', 0, 0)")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  echo "Guess the secret number between 1 and 1000:"
fi

GUESSING_GAME