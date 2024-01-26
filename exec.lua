local data = ...
local kernel = data[1]

kernel:register("ex",function(code)
    local f,err = loadstring(code)
    
    if f then
      f()
    else
      kernel:error(err)
    end
end,"Executes code. (sandboxed btw)")