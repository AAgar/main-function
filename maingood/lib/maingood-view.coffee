module.exports =
class MaingoodView
  constructor: (serializedState) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('maingood')
    path = atom.workspace.getActiveTextEditor().getPath()
    require path
    # Create message element
    message = document.createElement('div')
    message.textContent = eval main
    message.classList.add('message')
    @element.appendChild(message)

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element
