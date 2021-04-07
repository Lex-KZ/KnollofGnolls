require_relative '../models/Player.rb'
require_relative '../models/Game.rb'
require_relative './staging.rb'



def run_game
    has_person = create_room[:person]
# --------Game Loop--------
    while @player.hp > 0 && @game.person_count < 7
    # Game Code
        actions = ["m - move, s - search"]
        puts "Room #{@game.number_of_rooms_explored}"
        puts @game.current_room

    # Monster encounter
        puts @game.monster
        if @game.monster
            puts "You see a gnoll, he doesn't see you."
            actions << "f - fight"
        end

        print "What do you do? (#{actions.join(',')}) : "
        player_action = gets.chomp.downcase

    # Monster attack
        if @game.monster and monster_attack?
            @player.hp = @player.hp - 1
            puts "The gnoll swings at you with its claws, scratching you deep across the chest. You take 1 point of damage."
        end
    # Player commands
        # has_person = create_room[:person]
        if player_action == "m"
            @game.current_room = create_room[:message]
            @game.number_of_rooms_explored += 1
            @game.monster = has_monster?
            has_person = create_room[:person]
        elsif player_action == "s"
            # has_person = create_room[:person]
            if has_person
                puts "You found a missing person! You gain 2xp!" 
                @game.person_count += 1
                @game.xp += 2
                has_person = false
            else
                puts "You search the room. There are no missing people here."
            end

    # Condition => Searching triggers Monsters
            # puts "********#{@game.monster}**********"
            if not @game.monster
                @game.monster = has_monster?
                # puts "jghcijedvhievhirfvbfr"
                # puts @game.monster
            end
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