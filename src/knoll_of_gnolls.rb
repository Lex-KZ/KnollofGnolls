# The Knoll of Gnolls
####################################################################
###### 1) check if player is alive
###### 2) let the player leave the room
###### 3) check to see if a monster is in the room
###### 4) allow searching for treasure (money and people)
###### 5) different types of rooms
###### 6) RNG
###### 7) did we find treasure?
###### 8) monsters deal damage - health zero = game over
###################################################################

require_relative './controllers/run_game.rb'
require_relative './models/Player.rb'



# -----Methods-----

#Staging
def create_room
    "You are in a cave. There is a tunnel on the other side of the cave."
end

def body_part
    ["heart", "eye", "stomach", "neck", "leg", "shoulder", "chest"].sample
end

#Random Number Generator
def dice_roll(number_of_dice, size_of_dice)
    total = 0
    1.upto(number_of_dice) do
        total = total + rand(size_of_dice) + 1
    end
    return total
end

#Dice Rolls
def has_monster?
    if dice_roll(2, 6) >= 8
        true
    else
        false
    end
end

def monster_attack?
    if dice_roll(2,6) >= 9
        true
    else
        false 
    end
end

def defeat_monster?
    if dice_roll(2,6) >= 3
        true
    else
        false 
    end
end

def has_person?
    if dice_roll(2,6) >= 6
        true
    else
        false 
    end
end




# -----Introduction-----

puts "The Knoll of Gnolls"
puts " "

# sleep 1

puts "Hello adventurer!"
puts " "

# sleep 1

puts "Welcome to the world of Otira."
puts " "

# sleep 1

# puts "What would you like to do? (new, load, delete, help)"

####################################################################
puts "What is your name, adventurer?"
name = gets.chomp
Player.new(name, 8)

puts " "
puts "Hello, #{name}"


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

# sleep 3

puts "You arrived in town that morning, eager for work"
puts "and gold."
puts " "

# sleep 3

puts "You heard that some nights prior a pack of gnolls,"
puts "hyena-headed humanoids, had raided the town and" 
puts "had taken many citizens."
puts " "

# sleep 4

puts "You've never encountered gnolls before, but you"
puts "know they are very aggressive, especially when"
puts "they're hungry."
puts " "

# sleep 4

puts "The town offered 400 gold pieces to anyone brave"
puts "enough to venture into the Blazing Jungles that"
puts "surround the town and retrieve the missing."
puts " "

# sleep 5

puts "You, being certain of your skills and knowledge of" 
puts "nature, had taken up the contract."
puts " "

# sleep 3

puts "The distant caw of a jungle bird brought you back to"
puts "the here and now."
puts " "

# sleep 3

# puts "Please pick a Class: (Ranger, Sorcerer, what is this?"

puts "You make your way through the jungle, following the trail"
puts "of destruction, until you arrive at a hill, a knoll if you will."
puts " "

# sleep 3

puts "You make your way inside"
puts " "

run_game

if hp > 0 
    puts "You lived."
    puts "You explored #{number_of_rooms_explored} rooms"
    puts "You rescued #{person_count} citizens"
    puts "you gained #{xp}xp"
else 
    puts "Game Over"
    puts "You explored #{number_of_rooms_explored} rooms before you died."
    puts "you gained #{xp}xp"
end 