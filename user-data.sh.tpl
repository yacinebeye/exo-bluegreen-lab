#!/bin/bash

sudo yum update
sudo amazon-linux-extras install nginx1
sudo service mginx start
sudo systemctl enable nginx.service 

# web page 
cat <<<EOF > /usr/share/nginx/html/index.html
<html>
<title> ${version} </title>
<body style="background-color:lightblue;">
<h1> This is the ${version} !!</h1>
<body>
<html>
EOF 