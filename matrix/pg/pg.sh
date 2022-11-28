#!/bin/bash
mkdir -p postgres/data
touch postgres/create_db.sh
touch docker-compose.yml
chmod +x postgres/create_db.sh
./postgres/create_db.sh
