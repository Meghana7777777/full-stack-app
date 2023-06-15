#! /bin/bash

# Install Java-17
sudo apt update
sudo apt install -y openjdk-17-jdk

# Install Maven
sudo apt install -y maven

# Install Docker
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Make the script executable by running the following command
chmod +x shell-commands.sh

# Create Container
sudo docker run -d --name postgres1 -e POSTGRES_PASSWORD=postgres -p 5432:5432 postgres

# Connect to Container
sudo docker exec -it postgres1 psql -U postgres -c "CREATE DATABASE themoviedb;"

