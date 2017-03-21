require 'pry'

def merge_sort(arr)
    if arr.length == 1
        return arr
    end
    mid = arr.length/2 - 1
    left_side = arr[0..mid]
    right_side = arr[mid + 1..-1]

    merge_arrays(merge_sort(left_side), merge_sort(right_side))
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
    return work_array
end

p merge_sort([1,2,3,2,32,4,5,535,34,32,421,43,24,235,235,342,54,345,235,2,42,5,65,22,31,23])
