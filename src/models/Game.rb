require_relative '../controllers/staging.rb'

class Game
    attr_accessor :name, :hp, :number_of_rooms_explored, :person_count, :xp, :monster, :current_room

    def initialize(name="Anon", hp=8, number_of_rooms_explored=1, person_count=0, xp=0, monster=false)
        @name = name
        @hp = hp
        @number_of_rooms_explored = number_of_rooms_explored
        @person_count = person_count
        @xp = xp
        @monster = monster
        @current_room = create_room[:message]
    end
end