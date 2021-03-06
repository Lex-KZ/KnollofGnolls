##!/usr/bin/env ruby 


#-----Gems-----
require "tty-prompt"

#-----Files-----
require_relative './controllers/run_game.rb'
require_relative './models/Game.rb'
require_relative './controllers/dice_roll.rb'
require_relative './models/Monster.rb'


while true
    # -----Introduction-----

    puts "The Knoll of Gnolls"
    puts " "

    sleep 1

    puts "Hello adventurer!"
    puts " "

    sleep 1

    puts "Welcome to the world of Otira."
    puts " "

    sleep 1

    ####################################################################
    while true
        puts "What is your name, adventurer?"
        name = gets.chomp
        name.empty? ? (puts "You must enter a name before continuing") : break
    end

    @game = Game.new(name)

    puts " "
    puts "Hello, #{@game.name}"


    while true 
        puts "Do you know how to play? (y/n)"
        answer = gets.chomp.downcase
        if (answer != "y") && (answer != "n")
            puts "Please enter 'y' or 'n'"
        else   
        if answer == "y"
            break
        elsif answer == "n"
            puts "To play, type one of the given commands."
            sleep 2
        end
        break
        end
    end 
    puts " "



    puts "On the 23rd day of Phiots, in the year 1238 the"
    puts "sun was beating down on the small town of Ruesin."
    puts " "

    sleep 3

    puts "You arrived in town that morning, eager for work"
    puts "and gold."
    puts " "

    sleep 3

    puts "You heard that some nights prior a pack of gnolls,"
    puts "hyena-headed humanoids, had raided the town and" 
    puts "had taken many citizens."
    puts " "

    sleep 4

    puts "You've never encountered gnolls before, but you"
    puts "know they are very aggressive, especially when"
    puts "they're hungry."
    puts " "

    sleep 4

    puts "The town offered 400 gold pieces to anyone brave"
    puts "enough to venture into the Blazing Jungles that"
    puts "surround the town and retrieve the missing."
    puts " "

    sleep 5

    puts "You, being certain of your skills and knowledge of" 
    puts "nature, had taken up the contract."
    puts " "

    sleep 3

    puts "The distant caw of a jungle bird brought you back to"
    puts "the here and now."
    puts " "

    sleep 3

    puts "You make your way through the jungle, following the trail"
    puts "of destruction, until you arrive at a hill, a knoll if you will."
    puts " "

    sleep 3

    puts "You make your way inside"
    puts " "

    run_game

   #Check win condition 
    if @game.hp > 0
        puts "You lived!"
        puts "You explored #{@game.number_of_rooms_explored} rooms"
        puts "You rescued #{@game.person_count} citizens"
        puts "you gained #{@game.xp}xp"
        @game.view_inventory
    else 
        puts "Game Over"
        puts "You explored #{@game.number_of_rooms_explored} rooms before you died."
        puts "You gained #{@game.xp}xp"
    end 


    #Play again? 
    prompt = TTY::Prompt.new
    choices = [
        {name: "Yes", value: true},
        {name: "No", value: false}
    ]
    selection = prompt.select("Would you like to play again?", choice )
    if selection == false
        puts " "
        puts "Thank you for playing!"
        break
    end
end 