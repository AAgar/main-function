MaingoodView = require './maingood-view'
{CompositeDisposable} = require 'atom'

module.exports = Maingood =
  maingoodView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @maingoodView = new MaingoodView(state.maingoodViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @maingoodView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'maingood:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @maingoodView.destroy()

  serialize: ->
    maingoodViewState: @maingoodView.serialize()

  toggle: ->
    console.log 'Maingood was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
