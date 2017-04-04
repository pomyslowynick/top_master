class LinkedList 
    def initialize
        @head = nil
        @tail = nil
    end
    def append(node)
        if @head == nil
            @head = node
            @tail = node
        else
            @tail.next_node = node
            @tail = node
        end
    end
    
    def prepend(node)
        if @head == nil
            @head = node
            @tail = node
        else
            node.next_node = node
            @tail = node
        end
    end
end

class Node
    attr_accessor(:value, :next_node)
    def initialize(value)
        @value = value
        @next_node = nil
    end
end

wow = Node.new(256)
row = Node.new(128)
gow = Node.new(512)

list_one = LinkedList.new
list_one.append(wow)
list_one.append(row)
list_one.append(gow)
list_one.prepend(row)
list_one.prepend(gow)
p list_one


