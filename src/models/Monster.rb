require_relative '../controllers/dice_roll.rb'


#-----Dice Rolls-----
#Is there a monster?
def has_monster?
    if dice_roll(2, 6) >= 8
        true
    else
        false
    end
end

#Does the monster attack?
def monster_attack?
    if dice_roll(2,6) >= 9
        true
    else
        false 
    end
end

#Did you kill the monster?
def defeat_monster?
    if dice_roll(2,6) >= 3
        true
    else
        false 
    end
end
