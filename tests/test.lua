local bit32 = assert(require 'bit32');

--[[
The bit32 library became part of the standard Lua distribution at Lua 5.2

Allthe functions are in the bit32 table:

--->    band    function
--->    extract function
--->    bor     function
--->    bnot    function
--->    arshift function
--->    rshift  function
--->    rrotate function
--->    replace function
--->    lshift  function
--->    lrotate function
--->    btest   function
--->    bxor    function

]]

-- ------------------------------------------------------------------------

function to_binary(value)

        -- Formats an incoming integer value into a 32 bit binary string

        convert = {["0"] = "0000",["1"] ="0001",["2"] ="0010",["3"] ="0011",
                ["4"] ="0100",["5"] ="0101",["6"] ="0110",["7"] ="0111",
                ["8"] ="1000",["9"] ="1001",["a"] ="1010",["b"] ="1011",
                ["c"] ="1100",["d"] ="1101",["e"] ="1110",["f"] ="1111"}

        -- Convert them to hex, because hex to binary is easy!

        sval = string.format("%08x",value)

        -- Look up binary equivalent of each hex digit

        local out = ""
        for c=1,8 do
                local vx = string.sub(sval,c,c)
                out = out .. convert[vx]
        end

        return out
end

-- ------------------------------------------------------------------------

value = 1234
another = 1764

print (to_binary(value))
print (to_binary(another))

print "Bitwise and operator: ---------------------------"
result = bit32.band(value, another)
print (to_binary(result))

print "Arithmetic right shift --------------------------"
r2 = bit32.arshift(result,3)
print (to_binary(r2))

print "As numbers"
print (value, another, result, r2)

--[[

wizard:j graham$ lua52 bitwise
00000000000000000000010011010010
00000000000000000000011011100100
Bitwise and operator: ---------------------------
00000000000000000000010011000000
Arithmetic right shift --------------------------
00000000000000000000000010011000
As numbers
1234    1764    1216    152
wizard:j graham$

]]