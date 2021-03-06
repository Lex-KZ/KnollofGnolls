require_relative "../../models/Game.rb"
require 'rspec'

RSpec.describe "Simple testing" do
    it "should respond to name" do
        expect(subject).to respond_to :name  
    end
    
    describe "name" do
        subject { (Player.new "Sally").name }

        it "should not be nil" do
            expect(subject).not_to be_nil
        end

        it "should be assigned to initialization when provided" do
            expect(subject).to eq "Sally"
        end
    end

end