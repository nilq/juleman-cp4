stager = {
  state: {}
  global: {
    update: {}
    draw:   {}
  }
}

stager.new = =>
  {}

stager.switch = (path, params) =>

  @state.unload! if @state.unload

  package.loaded[path] = false

  @state = require path

  @state.load params if @state.load
  @

stager.update = (dt) =>
  @state.update dt if @state.update
  @

stager.draw = =>
  self.state.draw! if @state.draw
  @

stager
