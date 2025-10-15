-- 简单测试用例
local function calculateSum(a, b)
    return a + b
end

local function calculateProduct(a, b)
    return a * b
end

-- 测试字符串和数字
local message = "Hello World"
local number = 42
local result = calculateSum(10, 20)
print(message .. " " .. result)

local function main()
    local x = 5
    local y = 10
    
    local sum = calculateSum(x, y)
    local product = calculateProduct(x, y)
    
    print("Sum:", sum)
    print("Product:", product)
    
    if sum > product then
        print("Sum is greater")
    else
        print("Product is greater or equal")
    end
    
    -- 测试布尔值和nil
    local flag = true
    local empty = nil
    
    if flag then
        print("Flag is true")
    end
    
    if empty == nil then
        print("Empty is nil")
    end
end

main()