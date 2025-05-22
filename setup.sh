#!/bin/bash

# Instalar Docker e docker-compose
apt update -y && apt upgrade -y
apt install -y ca-certificates curl gnupg lsb-release ufw git nginx
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

apt update -y
apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Ativar Docker
systemctl enable docker
systemctl start docker

# Instalar certbot
apt install -y certbot python3-certbot-nginx

# Configurar NGINX para usar config personalizada
rm /etc/nginx/sites-enabled/default
ln -s ~/monitorapramim-docker/nginx/default.conf /etc/nginx/sites-enabled/monitorapramim.conf
systemctl restart nginx

# Ativar UFW
ufw allow OpenSSH
ufw allow 'Nginx Full'
ufw --force enable

# Clonar o repositório
cd ~
git clone git@github.com:drafenous/monitorapramim-docker.git
cd monitorapramim-docker

# Clonar dependências internas
git clone git@github.com:drafenous/monitorapramim-frontend.git frontend
git clone git@github.com:drafenous/monitorapramim-backend.git backend
git clone git@github.com:drafenous/monitorapramim-amazon-service.git amazon-service
git clone git@github.com:drafenous/monitorapramim-whatsapp-service.git whatsapp-service

# Criar pastas para SSL (caso vá usar certbot manual)
mkdir -p /var/www/certbot

# Finalizado!
echo "Servidor pronto para docker compose up -d"