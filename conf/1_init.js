//Drop index if any
db.getSiblingDB('dbindex').restaurants.dropIndexes();

//Create a new index on the dbindex.restaurants collection
let index_restaurants = db.getSiblingDB('dbindex').restaurants.createIndex({
    "name":1,
    "address.city":1
});
printjson(index_restaurants);

db.getSiblingDB('admmin').shutdownServer();