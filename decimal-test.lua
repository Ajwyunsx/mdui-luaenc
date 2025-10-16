-- 小数点与整数混合测试
local a = 0.5
local b = 1.25
local c = 2
local d = 3.14

print("a=", a, "b=", b, "c=", c, "d=", d)
print("sum(a,b)=", a + b)
print("mul(a,b)=", a * b)
print("c + a=", c + a)
print("d - b=", d - b)

if a < b then
  print("a<b")
else
  print("a>=b")
end