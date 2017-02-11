welcome_message = "Welcome, I am more than pleased to invite you for a little Tic-Tac-Toe game.\n"\
                  "Choose number from 1 to 9 to indicate what position you want to mark"

puts welcome_message
range_of_map = (1..9)
$MAP = range_of_map.to_a

win = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
win_status = false
ai_move = $MAP.sample
turn = rand(2)


class Tic
    attr_reader :arr

    def initialize
        @arr = []
    end
    
    def mark(pos)
        if $MAP.include? pos
            @arr.push(pos)
            $MAP.delete(pos)
        else
            puts "Position already taken!"
            return 0
        end
        
    end
end
ai_instance = Tic.new
player_instance = Tic.new

while win_status == false
    player_move = gets.chomp.to_i
    unless range_of_map.include?(player_move)
        puts "Choose number from 1 to 9!"
        redo
    end
    redo if player_instance.mark(player_move) == 0
    
    p "You marked #{player_move}.Your current marks #{player_instance.arr}"
    
    win.each do |z|
        if z&player_instance.arr == z
            puts "Grats, you won!"
            win_status = true
            break
        end
    end

end
