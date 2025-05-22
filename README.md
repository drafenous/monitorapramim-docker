# README.md

# Monitora Pra Mim - Orquestração Docker

Este repositório centraliza o deploy da stack de microserviços `Monitora Pra Mim`, com:

- Laravel backend (`monitorapramim-backend`)
- Next.js frontend (`monitorapramim-frontend`)
- Amazon service (`monitorapramim-amazon-service`)
- WhatsApp service (`monitorapramim-whatsapp-service`)

## 🚀 Como usar

1. Clone este repositório:

```bash
git clone git@github.com:seu-user/monitorapramim-docker.git
```

2. Clone os outros repositórios dentro desta pasta:

```bash
cd monitorapramim-docker

git clone git@github.com:seu-user/monitorapramim-frontend.git frontend
git clone git@github.com:seu-user/monitorapramim-backend.git backend
git clone git@github.com:seu-user/monitorapramim-amazon-service.git amazon-service
git clone git@github.com:seu-user/monitorapramim-whatsapp-service.git whatsapp-service
```

3. Suba os containers:

```bash
docker compose up -d --build
```

---

## 🔒 GitHub Actions Deploy (branch `production`)

Este projeto já inclui uma action que faz:

- Pull automático no servidor
- Build + restart com `docker compose`

### Secrets obrigatórios:

| Nome              | Valor             |
| ----------------- | ----------------- |
| `DROPLET_SSH_KEY` | sua chave privada |
| `DROPLET_IP`      | IP da VPS         |
| `DROPLET_USER`    | `root`            |
