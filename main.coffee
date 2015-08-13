cot = require 'cot'
_ =
  extend: require 'lodash.assign'

viewMethods = require './lib/view_methods'

module.exports = (params)->
  validatingParams params

  return couchWrapper = (dbName, designDocName)->
    db = new cot(params).db(dbName)
    return _.extend db, viewMethods(designDocName)


validatingParams = (params)->
  unless params? then throw new Error 'params object missing'
  unless typeof params is 'object' then throw new Error "params should be an object (got #{typeof params})"
  { hostname, port, auth } = params
  unless hostname? then throw new Error 'params missing: hostname'
  unless port? then throw new Error 'params missing: port'
  unless auth? then throw new Error 'params missing: auth'
