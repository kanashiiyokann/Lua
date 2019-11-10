
local base={};

function base:say(a,b,c)
    print(a,b,c)
    print(self)
end

local advance={};

function advance:say2()
    print("advance hello!")
end

return base,advance;
