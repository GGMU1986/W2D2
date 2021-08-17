require_relative "room"

class Hotel
    attr_reader :rooms

    def initialize(name, rooms)
        @name = name
        @rooms = {}
        
        rooms.each do |k, v|
            @rooms[k] = Room.new(v)
        end
    end

    def name 
        @name.split.map(&:capitalize).join(" ")
    end

    def room_exists?(room_name)
        @rooms.has_key?(room_name)
    end

    def check_in(person, room_name)
        if room_exists?(room_name)
            if @rooms[room_name].add_occupant(person)
                puts "check in successful"
            else
                puts "sorry, room is full"
            end
        else
            puts "sorry, room does not exist"
        end
    end

    def has_vacancy?
        @rooms.values.any? { |room| !room.full? }
    end

    def list_rooms
      @rooms.each do |k, v|
        puts "#{k} : #{v.available_space}"
      end
    end
end
