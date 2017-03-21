require 'pry'

def merge_sort(arr)
    if arr.length < 2
        return arr
    end
    mid = arr.length/2 - 1
    left_side = arr[0..mid]
    right_side = arr[mid + 1..-1]
    merge_sort(left_side)
    merge_sort(right_side)
    if left_side.length == 1 && right_side.length == 1
        p merge_arrays(left_side,right_side)
    end
    
end

def merge_arrays(left, right)
    i = 0
    j = 0
    work_array = []
    while left.length > i && right.length > j
        if left[i] <= right[j]
            work_array << left[i]
            i += 1
        else
            work_array << right[j]
            j += 1
        end
    end
    while i < left.length
        work_array << left[i]
        i += 1
    end
    while j < right.length
        work_array << right[j]
        j += 1
    end
    p left,right
    return work_array
end

merge_sort([1,2,3,2,32,4,2,42,5,65,22,31,23])