#Random Number Generator
def dice_roll(number_of_dice, size_of_dice)
    total = 0
    1.upto(number_of_dice) do
        total = total + rand(size_of_dice) + 1
    end
    return total
end