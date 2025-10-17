-- 综合测试文件
-- 测试各种语法和注释

-- 单行注释测试
print 'Hello from single quote'
print "Hello from double quote"
print('Hello from parentheses single')
print("Hello from parentheses double")

--[[
多行注释测试
这里有多行内容
]]

local function greet(name)
    return 'Hello, ' .. name .. '!'
end

-- 函数调用测试
local message = greet 'World'
print(message)

-- 表操作测试
local data = {
    name = 'Test',
    value = 42
}

print('Name: ' .. data.name)
print('Value: ' .. tostring(data.value))

-- 条件语句测试
if data.value > 40 then
    print 'Value is greater than 40'
else
    print 'Value is not greater than 40'
end

-- 循环测试
for i = 1, 3 do
    print('Loop iteration: ' .. tostring(i))
end

-- 更多注释
-- 这些注释应该被移除
print 'Final test message'

--[=[
这是另一种多行注释格式
应该也被正确处理
]=]