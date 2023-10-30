#Chatbot for ordering pizza

pizza_name <- c('pepperoni','cheese','sausage','mushroom','veggie','hawaiian')
price <- c(8.99,7.99,9.99,9.49,9.99,10.49)
pizza_menu <- data.frame(pizza_name,price)

pizza_order = function(){
  print("Hello! welcome to Homemade Pizza")
  print("Are You ready to order?")
  answer <- tolower(readLines("stdin",n=1))
  if(answer == 'yes'){ 
    print("Please order pizza menu")
    pizza <- c()
    p<- tolower(readLines("stdin", n=1))
    while(TRUE){
      if ( p %in% pizza_menu$pizza_name ){
      ##pizza_price <- pizza_menu[pizza_menu$pizza_name == pizza, 'price']
      pizza <- append(pizza, p)
      print("Would you like to order more pizza? (y/n)")
        more_pizza <- tolower(readLines("stdin", n=1))
      if (more_pizza == 'y'){
          print("Please order pizza menu")
          p <- tolower(readLines("stdin", n=1))
        } else if (more_pizza == 'n'){
          break
        }
        else {print("This menu is not in the restaurant, pleas try again.")
             p <- tolower(readLines("stdin", n=1))}
    } else {
        print("This menu is not in the restaurant, pleas try again.")
        print("Would you like to order a different pizza? (y/n)")
        different_pizza <- tolower(readLines("stdin", n=1))
        if (different_pizza == 'y'){
          print("Please order pizza menu")
          p <- tolower(readLines("stdin", n=1))
        } else if (different_pizza == 'n'){
          break
        }
      }
    }
print("Your total is:")
    total_price <- 0
    for (i in 1:length(pizza)){
      total_price <- total_price +pizza_menu[pizza_menu$pizza_name == pizza[i], 'price']
    }
    print(total_price)
}
  else {
    print("That's alright, you can come to order again")
  }
}

pizza_order()
