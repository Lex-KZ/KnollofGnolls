require 'rspec'

require_relative '../../controllers/dice_roll.rb'

RSpec.describe "Simple testing" do

    it "should not be nil" do
        expect(subject).not_to be_nil
    end

    it "should not be 0" do
        expect(subject).to > 0
    end
end

RSpec.describe "Dice roll" do
    subject {dice_roll(2, 8)}

    it "should not be nil" do
        expect(subject).not_to be_nil
    end

    it "should not be 0" do
        expect(subject).to > 0
    end

end