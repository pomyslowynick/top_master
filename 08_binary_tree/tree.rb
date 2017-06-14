class Node
    attr_accessor(:value, :parent, :left_child, :right_child)
    def initialize(value)
        @value = value
        @parent = nil
        @left_child = nil
        @right_child = nil
    end
end

def recursinator(info, node)
    if info.value < node.value
      if node.left_child == nil
        node.left_child = info
        info.parent = node
      else
        recursinator(info, node.left_child)
      end
    else
      if node.right_child == nil
        node.right_child = info
        info.parent = node
      else
        recursinator(info,node.right_child)
      end
    end
end

def build_tree(arr, sort) 
    i = 1
    arr_sorted = arr.sort
    arr_len = arr_sorted.length/2
    parent_node = Node.new(arr_sorted[arr_len])
    arr_sorted.delete_at(arr_len)
    if sort
        while arr_sorted.length > i
            place_holder = Node.new(arr_sorted[-i])
            recursinator(place_holder, parent_node)
            i += 1
        end
    else
        while arr.length + 1 > i
            place_holder = Node.new(arr[-i])
            recursinator(place_holder, parent_node)
            i += 1
        end
    end
    p parent_node.left_child.left_child.left_child.left_child.value
end

build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324], false)