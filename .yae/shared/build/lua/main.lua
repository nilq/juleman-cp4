stager = require("lib/scenes")
stager:switch("scenes/game")
do
  local _with_0 = yae
  _with_0.update = function(dt)
    return stager:update(dt)
  end
  _with_0.draw = function()
    return stager:draw()
  end
  return _with_0
end
