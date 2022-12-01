#!/bin/bash
sudo apt install git wget vim upzip && curl -L https://github.com/do-community/travellist-laravel-demo/archive/tutorial-1.0.1.zip -o travellist.zip
unzip travelliist.zip && mv travellist-laravel-demo-tutorial-1.0.1 travellist
cd travellist  && cp .env.example .env
