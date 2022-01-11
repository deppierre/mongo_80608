FROM mongo

ENV datadir=/mongo/data/db
EXPOSE 27017

VOLUME [${datadir}]

WORKDIR ${datadir}

COPY conf/* ./

RUN sed -i "s|dbPath_to_replace|${datadir}|" mongod.conf


# Execute the init script and shutdown
RUN mongod -f mongod.conf &&\
    /usr/bin/mongoimport -d dbindex -c restaurants --port 27017 restaurants.json &&\
    /usr/bin/mongoimport -d dbnoindex -c restaurants --port 27017 restaurants.json &&\
    mongo --quiet --port 27017 1_init.js

#This is command issued when the container is created
CMD mongod -f mongod.conf &&\
    tail -f mongod.log