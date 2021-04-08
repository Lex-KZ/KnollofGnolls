require_relative './dice_roll.rb'

def has_person?
    if dice_roll(2,6) >= 6
        true
    else
        false 
    end
end

def create_room
    has_person = has_person? 
    {message: "You are in a cave. There is a tunnel on the other side of the cave.", person: has_person}
end

def body_part
    ["heart", "eye", "stomach", "neck", "leg", "shoulder", "chest"].sample
end
    
