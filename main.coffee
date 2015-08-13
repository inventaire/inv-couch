cot = require 'cot'
_ = require 'lodash'

viewMethods = require './lib/viewMethods'

module.exports = (params)->
  { hostname, port, auth } = params
  unless hostname? then throw new Error 'params missing: hostname'
  unless port? then throw new Error 'params missing: port'
  unless auth? then throw new Error 'params missing: auth'

  return couchWrapper = (dbName, designDocName)->
    db = new cot(params).db(dbName)
    return _.extend db, viewMethods(designDocName)
