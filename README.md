# mongo_80608

## Build image
```
docker build -t mongodb_80608 .
```

## Run container
```
docker run --name mongodb_80608_run -d --rm -p 27020:27017 -v $(pwd)/mongod/ftdc:/mongo/data/db/diagnostic.data mongodb_80608
```