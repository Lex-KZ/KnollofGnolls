class Player
    attr_accessor :name, :hp
    

    def initialize(name = "Anon", hp)
        @name = name
        @hp = hp 
    end
end