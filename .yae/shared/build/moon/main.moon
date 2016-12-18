export stager = require "lib/scenes"

stager\switch "scenes/game"

with yae
  .update = (dt) ->
    stager\update dt

  .draw = ->
    stager\draw!
