-- 示例Lua代码
local function calculateFactorial(n)
    if n <= 1 then
        return 1
    else
        return n * calculateFactorial(n - 1)
    end
end

local function main()
    local numbers = {5, 10, 15}
    local results = {}
    for i, num in ipairs(numbers) do
        results[i] = calculateFactorial(num)
        print(string.format("Factorial of %d is %d", num, results[i]))
    end
    return results
end

-- 执行主函数
local result = main()
if result then
    print("Calculation completed successfully")
else
    print("Calculation failed")
end