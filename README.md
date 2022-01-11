## Building the image
```
docker build -t mongodb_80608 .
```

## Command to run the container
```
docker run --name mongodb_80608_run -d --rm -p 27020:27017 -v $(pwd)/mongod/ftdc:/mongo/data/db/diagnostic.data -v $(pwd)/mongod/logs:/mongo/data/db/logs mongodb_80608
```