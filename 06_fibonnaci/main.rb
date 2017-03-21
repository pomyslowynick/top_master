def fibs(num)
    result = [0,1]
    while num > 0
        result << result[-1] + result[-2]
        num -= 1
    end
    return result
end

def fibs_rec(num, result = [0,1])
    if num == 0
        return result
    else
        result << result[-1] + result[-2]
        fibs_rec(num - 1, result)
    end
end
p fibs_rec(6)