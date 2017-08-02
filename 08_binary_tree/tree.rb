require 'pry'

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
    arr_len = arr.length/2
    parent_node = Node.new(arr[arr_len])
    arr.delete_at(arr_len) 
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
    return parent_node
end

def breadth_first_search(target,tree_node,breadth_que)
    binding.pry
    if breadth_que.empty?
        return nil
    elsif tree_node.value == target
        return tree_node.value
    else
        if tree_node.left_child != nil
            breadth_que.push(tree_node.left_child)
        end
        if tree_node.right_child != nil
            breadth_que.push(tree_node.right_child)
        end
        breadth_que.delete_at(0)
        breadth_first_search(target,breadth_que[0],breadth_que)
    end
end

def depth_first_search(target,tree_node,stack)
    if stack.empty?
        return nil
    elsif tree_node.value == target
        return tree_node.value
    else
        stack.delete_at(0)
        if tree_node.right_child != nil
            stack.unshift(tree_node.right_child)
        end
        if tree_node.left_child != nil
            stack.unshift(tree_node.left_child)
        end
    end
    depth_first_search(target,stack[0],stack)
end

my_1st_tree = build_tree([4, 1, 7, 4, 23, 8, 9, 3, 5, 7, 9, 67, 6345, 324], false)

p depth_first_search(6345,my_1st_tree,[my_1st_tree.value])