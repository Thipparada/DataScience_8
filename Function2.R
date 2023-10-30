# Pao-Ying-Chup game

com <- c("rock","paper","scissors")
  
game <- function(){
  print("Let's play rock-paper-scissors game!")
  print("Please select : rock, paper or, scissors")
  input <- tolower(readLines("stdin",n=1))
  score <- 0 
  while(TRUE){
    if(input %in% com){
      computer_move <- sample(com, 1)
      if (input == computer_move) {
        print("It's a tie!")
        score <- score + 0
      } else if ((input == "rock" && computer_move == "scissors") ||
                 (input == "scissors" && computer_move == "paper") ||
                 (input == "paper" && computer_move == "rock")) {
        print("You win!")
        score <- score + 1
      } else {
        print("Computer wins!")
        score <- score - 1
      }
      print("Do you want to play more? (y/n)")
      answer <- tolower(readLines("stdin",n=1))
      if (answer == "yes" ){
       print("Let's play agin!")
       input <- tolower(readLines("stdin",n=1))
      } else 
       {print("Okay! See you later")
       break}
      }
      else {
        print("That input is not in this game, please try again")
        print("Do you want to play more? (y/n)")
        answer <- tolower(readLines("stdin",n=1))
      if (answer == "y" ){
       print("Let's play agin!")
       input <- readLines("stdin",n=1)
      } else 
       {print("Okay! See you later")
       break}
    }
  }
  print("Your total score is: ")
  print(score)
}

game()
