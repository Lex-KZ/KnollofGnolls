require_relative '../models/Game.rb'
require_relative './staging.rb'
require_relative '../models/Monster.rb'
require 'colorize'



def run_game
    has_person = create_room[:person]
# --------Game Loop--------
    while @game.hp > 0 && @game.person_count < 7
    # Game Code
        actions = ["m - move, s - search, i - inventory"]
        puts "Room #{@game.number_of_rooms_explored}".colorize(:light_blue)
        puts @game.current_room

    # Monster encounter
        if @game.monster
            puts "You see a gnoll, he doesn't see you.".colorize(:red)
            actions << "f - fight"
        end

        print "What do you do? (#{actions.join(',')}) : "
        player_action = gets.chomp.downcase

    # Monster attack
        if @game.monster and monster_attack?
            @game.hp = @game.hp - 1
            puts "The gnoll swings at you with its claws, scratching you deep across the chest. You take 1 point of damage.".colorize(:red)
        end

    # Player commands
        if player_action == "m"
            @game.current_room = create_room[:message]
            @game.number_of_rooms_explored += 1
            @game.monster = has_monster?
            has_person = create_room[:person]
        elsif player_action == "s"
            current_treasure = treasure
            if has_person && has_treasure? == false
                puts "You found a missing person! You gain 2xp!".colorize(:green)
                @game.person_count += 1
                @game.xp += 2
                has_person = false
            elsif has_person && has_treasure?
                puts "You found a missing person! You gain 2xp!".colorize(:green)
                puts "You found a #{current_treasure}!".colorize(:green)
                @game.person_count += 1
                @game.xp += 2
                has_person = false
                @game.inventory_row << [current_treasure, 1]
            elsif has_person == false && has_treasure?
                puts "There are no missing people here."
                puts "You found a #{treasure}!".colorize(:green)
                @game.inventory_row << [current_treasure, 1]
            else
                puts "You search the room. There are no missing people here."
            end

    # Condition => Searching triggers Monsters
            if not @game.monster
                @game.monster = has_monster?
            end
        elsif player_action == "i"
            @game.view_inventory
        elsif player_action == "f"
            if defeat_monster?
                @game.monster = false
                puts "You charge the beast, piercing its #{body_part}. It falls prone. you gain 3xp!"
                @game.xp += 3
            
            else 
                puts "You charge the beast, but it dodges to the side. You missed."  
            end
        else 
            puts "Invalid input. Please pick again."
        end
        puts ""
    end
end