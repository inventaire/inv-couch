couch_ = require './couch'

module.exports = (designDocName)->
  viewCustom: (viewName, query)->
    @view(designDocName, viewName, query)
    .then couch_.mapDoc

  viewByKey: (viewName, key)->
    @viewCustom viewName,
      key: key
      include_docs: true