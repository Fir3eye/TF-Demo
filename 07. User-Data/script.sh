#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
echo "<h1>Welcome To SenDevOps</h1>" | sudo tee /var/www/html/index.html
sudo systemctl restart nginx