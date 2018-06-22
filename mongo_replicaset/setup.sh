#!/bin/bash

echo "Replicas started..."
mongo --host 172.17.43.109 --port 27027 <<EOF

   var cfg = {
        "_id": "rs",
        "version": 1,
        "members": [
            {
                "_id": 0,
                "host": "172.17.43.109:27027",
                "priority": 2
            },
            {
                "_id": 1,
                "host": "172.17.43.109:27037",
                "priority": 1
            },
            {
                "_id": 2,
                "host": "172.17.43.109:27047",
                "priority": 1,
                "arbiterOnly" : true
            }
        ]
    };
    try{
        var config = rs.config();
        rs.reconfig(cfg, { force: true });
    }catch(err){
        rs.initiate(cfg);
    }
EOF
