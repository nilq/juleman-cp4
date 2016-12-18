local stager = {
  state = { },
  global = {
    update = { },
    draw = { }
  }
}
stager.new = function(self)
  return { }
end
stager.switch = function(self, path, params)
  if self.state.unload then
    self.state.unload()
  end
  package.loaded[path] = false
  self.state = require(path)
  if self.state.load then
    self.state.load(params)
  end
  return self
end
stager.update = function(self, dt)
  if self.state.update then
    self.state.update(dt)
  end
  return self
end
stager.draw = function(self)
  if self.state.draw then
    self.state.draw()
  end
  return self
end
return stager
