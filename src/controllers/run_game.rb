require_relative '../models/Player.rb'


def run_game
# --------Variables--------
    number_of_rooms_explored = 1
    person_count = 0
    # hp = 8
    xp = 0
    escaped = false
    monster = false
    current_room = create_room
    

# --------Game Loop--------
    # while player.instance_variable_get(@hp) > 0 && person_count < 7
    while @player.hp > 0 && person_count < 7
    # Game Code
        actions = ["m - move, s - search"]
        puts "Room #{number_of_rooms_explored}"
        puts current_room

    # Monster encounter
        if monster
            puts "You see a gnoll, he doesn't see you."
            actions << "f - fight"
        end

        print "What do you do? (#{actions.join(',')}) : "
        player_action = gets.chomp.downcase

    # Monster attack
        if monster and monster_attack?
            @player.hp = @player.hp - 1
            puts "The gnoll swings at you with its claws, scratching you deep across the chest. You take 1 point of damage."
        end
    # Player commands
        if player_action == "m"
            current_room = create_room
            number_of_rooms_explored += 1
            monster = has_monster?
        elsif player_action == "s"
            if has_person?
                puts "You found a missing person! You gain 2xp!" 
                person_count += 1
                xp += 2
            else
                puts "You search the room. There are no missing people here."
            end
    # Condition => Searching triggers Monsters
            if not monster
                monster = has_monster?
            end
        elsif player_action == "f"
            if defeat_monster?
                monster = false
                puts "You charge the beast, piercing its #{body_part}. It falls prone. you gain 3xp!"
                xp += 3
            else 
                puts "You charge the beast, but it dodges to the side. You missed."  
            end
        else 
            puts "Invalid input. Please pick again."
        end
        puts ""
    end
end