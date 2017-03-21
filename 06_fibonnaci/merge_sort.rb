def fucking_sorter(arr1, arr2, n)
     
end

def merge_sort(arr)
    mid = arr.length / 2
    right_arr = arr[0..mid - 1]
    left_arr = arr[mid .. -1]
    if arr.length == 1
        
        return arr
    end
    
    merge_sort(right_arr)
    merge_sort(left_arr)
    sorter(left_arr, right_arr)
    return right_arr
end

def sorter(left_arr, right_arr)
    j = 0
    i = 0
    work_array = []
    while i < left_arr.length && j < right_arr.length
        if(left_arr[i] <= right_arr[j])
            work_array << left_arr[i]
            i =+ 1
        else
            work_array << right_arr[j]
            j += 1
        end
    end
    while i < left_arr.length
        work_array << left_arr[i]
        i += 1
    end
    while j < right_arr.length
        work_array << right_arr[j]
        j += 1
    end
end
merge_sort([40,8,25,16,23,42,50,108,108,42,50,12,15,16,8,3,23])
  
