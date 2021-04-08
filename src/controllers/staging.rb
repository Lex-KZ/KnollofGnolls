require_relative './dice_roll.rb'

# Is there a person in the room?
def has_person?
    if dice_roll(2,6) >= 6
        true
    else
        false 
    end
end

#Is there treasure in the room
def has_treasure?
    if dice_roll(1,20) >= 1
        true
    else 
        false
    end
end

# "You found a _______!"
def treasure
    ["ring", "necklace", "dagger", "amulet", "ruby", "sapphire", "piece of jade", "human skull", "tarask skull"].sample
end

# Room staging
def create_room
    has_person = has_person? 
    {message: "You are in a cave. There is a tunnel on the other side of the cave.", person: has_person}
end

# Random body part for flavour
def body_part
    ["heart", "eye", "stomach", "neck", "leg", "shoulder", "chest"].sample
end
    
