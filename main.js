let couch_;
module.exports = (couch_ = {});

couch_.mapResult = (res, type) => res.rows.map(row => row[type]);
couch_.mapDoc = res => couch_.mapResult(res, 'doc');
couch_.mapId = res => res.rows.map(row => row.id);
couch_.mapValue = res => res.rows.map(row => row.value);
couch_.mapValueId = res => res.rows.map(row => row.value._id);

couch_.firstDoc = docs => docs != null ? docs[0] : undefined;

couch_.joinOrderedIds = function(idA, idB){
  if (idA < idB) { return `${idA}:${idB}`;
  } else { return `${idB}:${idA}`; }
};

couch_.ignoreNotFound = function(err){
  if ((err != null ? err.error : undefined) === 'not_found') { return; }
};

couch_.getObjIfSuccess = function(db, body){
  if ((db.get != null) && body.ok) {
    return db.get(body.id);
  } else if (db.get != null) {
    throw new Error(`${body.error}: ${body.reason}`);
  } else {
    throw new Error("bad db object passed to _.getObjIfSuccess");
  }
};
