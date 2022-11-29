#!/bin/bash
sudo apt update && sudo apt upgrade
sudo wget -O /usr/share/keyrings/matrix-org-archive-keyring.gpg https://packages.matrix.org/debian/matrix-org-archive-keyring.gpg $ echo "deb [signed-by=/usr/share/keyrings/matrix-org-archive-keyring.gpg] https://packages.matrix.org/debian/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/matrix-org.list
sudo apt update $ sudo apt install matrix-synapse-py3
sudo apt install postgresql && sudo -su postgres
createuser --pwprompt synapse $ createdb --encoding=UTF8 --locale=C --template=template0 --owner=synapse synapse && exit
sudo apt install nginx certbot python3-certbot-nginx && sudo ufw allow http $ sudo ufw allow https $ sudo ufw allow 8448
sudo certbot certonly --nginx -d x.com--x.com -d v.com--x.com -d com--x.com  &&  sudo vim /etc/nginx/sites-available/synapse
