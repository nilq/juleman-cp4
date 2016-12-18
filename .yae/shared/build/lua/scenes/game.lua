local game = stager:new()
game.draw = function() end
game.update = function(dt)
  return yae.console.write(dt)
end
return game
