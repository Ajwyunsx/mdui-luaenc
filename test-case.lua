-- 简单测试用例
local function add(a, b)
    return a + b
end

local function multiply(a, b)
    return a * b
end

local function calculate(x, y)
    local sum = add(x, y)
    local product = multiply(x, y)
    
    if sum > product then
        return "Sum is greater"
    elseif sum < product then
        return "Product is greater"
    else
        return "They are equal"
    end
end

-- 测试
local result = calculate(3, 4)
print(result)