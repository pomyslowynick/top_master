require 'pry'
class LinkedList 
    
    def initialize
        @head = nil
        @tail = nil
        @nodes = 0
    end
    
    def append(node)
        if @head == nil
            @head = node
        elsif @tail == nil
            @head.next_node = node
            @tail = node
            node.next_node = nil
        else
            @tail.next_node = node
            @tail = node
            node.next_node = nil
        end
        @nodes += 1
    end
    
    def prepend(node)
        if @head == nil
            @head = node
            @tail = node
        else
            node.next_node = @head
            @head = node
        end
        @nodes += 1
    end
    
    def size
        amount = 1
        node_01 = @head
        until node_01.next_node == nil
            node_01 = node_01.next_node
            amount += 1
        end
        return amount
    end
    
    def head
        return "#{@head.value}, next node is - #{@head.next_node.value}"
    end
    
    def tail 
        return @tail.value
    end
    
    def at(index)
        i = 0
        noder = @head
        if index == 0
            return @head
        else
            while index > i 
                if noder.next_node == nil
                    break
                else
                    noder = noder.next_node
                end
                i += 1
            end
        end
        return noder
    end
    
    def pop
        size = self.size
        node = self.at(size - 2)
        @tail = node
        node.next_node = nil
        @nodes -= 1
        return node
    end
   
    def to_s
        string = ""
        i = 0
        until i == self.size
             string += "( #{self.at(i).value} ) -> "
             i += 1
        end
        string += " nil"
    end
    
    def contains?(value)
        i = 0
        node_contain = @head
        while i < self.size
            if value == node_contain.value
                return true
            elsif node_contain.next_node == nil
                return false
            else
                node_contain = node_contain.next_node
                i += 1
            end
        end
    end
    
    def find(data)
        i = 0
        node_contain_01 = @head
        while i < self.size
            if data == node_contain_01.value
                return i
            elsif node_contain_01.next_node == nil
                return false
            else
                node_contain_01 = node_contain_01.next_node
                i += 1
            end
        end
    end
    
    def insert_at(insertee, index)
        node_before = self.at(index - 1)
        node_after = self.at(index)
        node_before.next_node = insertee
        insertee.next_node = node_after
        
    end
    
    def remove_at(index)
        node_before = self.at(index - 1)
        node_after = self.at(index + 1)
        node_before.next_node = node_after
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
romek = Node.new("Roman")
tomek = Node.new("Mirek")
janek = Node.new("Janek")
alejandro = Node.new("62Ale")
newNode = Node.new("suckerhehe")
list_one = LinkedList.new
list_one.append(janek)
list_one.append(wow)
list_one.append(row)
list_one.append(gow)
list_one.append(romek)
list_one.prepend(alejandro)
list_one.append(tomek)
list_one.pop
list_one.pop

p list_one.at(2)
p list_one.to_s
p list_one.insert_at(newNode, 2)
p list_one.to_s
p list_one.remove_at(4)
p list_one.to_s



