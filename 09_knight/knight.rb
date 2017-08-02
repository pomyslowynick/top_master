require 'pry'

class Moves
    attr_accessor(:position, :children)
    def initialize(position)
        @position = position
        @children = []
    end
    
end
def board_maker
    i = 1
    y = 1
    matrix = {}
    
    while i <= 8 && y <= 8
        matrix[[i,y]] = Moves.new([i,y])
        if i === 8
            i = 1
            y += 1
        else
            i += 1
        end
    end
    return matrix
end

p board_maker

def moves_tree(position_node, list)
    matrix = board_maker
    
    i = position_node.position[0]
    y = position_node.position[1]
    if i + 2 <= 8 && y + 1 <= 8
        position_node.children += matrix.fetch([i + 2, y + 1])
    end
    if i + 1 <= 8 && y + 2 <= 8
        position_node.children += matrix.fetch([i + 1, y + 2])
    end   
    if i - 2 >= 1 && y - 1 >= 1
        position_node.children += matrix.fetch([i - 2, y - 1])
    end   
    if i - 1 >= 1 && y - 2 >= 1
        position_node.children += matrix.fetch([i - 1, y - 2])
    end   
    if i + 2 <= 8 && y - 1 >= 1
        position_node.children += matrix.fetch([i + 2, y - 1])
    end   
    if i - 2 >= 1 && y + 1 <= 8
        position_node.children += matrix.fetch([i - 2, y + 1])
    end   
    if i + 1 <= 8 && y - 2 >= 1
        position_node.children += matrix.fetch([i + 1, y - 2])
    end   
    if i - 1 >= 1 && y + 2 <= 8
        position_node.children += matrix.fetch([i - 1, y + 2])
    end
end

