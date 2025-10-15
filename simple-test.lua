-- 简单测试用例
local function calculateSum(a, b)
    return a + b
end

local function calculateProduct(a, b)
    return a * b
end

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
end

main()