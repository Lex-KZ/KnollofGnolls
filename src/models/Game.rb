require 'yaml'
require 'terminal-table'
require_relative '../controllers/staging.rb'

class Game
    attr_accessor :name, :hp, :number_of_rooms_explored, :person_count, :xp, :monster, :current_room, :inventory, :inventory_row
    attr_reader :class_name

    def initialize(name="Anon", hp=8, number_of_rooms_explored=1, person_count=0, xp=0, monster=false)
        @name = name
        @class_name = class_name
        @hp = hp
        @number_of_rooms_explored = number_of_rooms_explored
        @person_count = person_count
        @xp = xp
        @monster = monster
        @current_room = create_room[:message]
        @inventory = []
        @inventory_row = []
    end

    def view_inventory
        table = Terminal::Table.new :headings => ['Item', 'Quantity'], :rows => @inventory_row
        puts table
    end

    def pick_up_treasure(treasure)
        @inventory_row << [item[treasure], item[1]]
    end

end