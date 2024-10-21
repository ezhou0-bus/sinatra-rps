require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
  
# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')


 get("/") do
  erb(:home)
end

get("/app/rock") do
  user_choice = "rock"
  computer_choice = ["rock", "paper", "scissors"].sample

  if user_choice == computer_choice
    @outcome = "We tied!"
  elsif (user_choice == "rock" && computer_choice == "scissors") ||
        (user_choice == "paper" && computer_choice == "rock") ||
        (user_choice == "scissors" && computer_choice == "paper")
    @outcome = "We won!"
  else
    @outcome = "We lost!"
  end

  @user_choice = user_choice
  @computer_choice = computer_choice

  erb(:rock)
end 
