# 🐳 Projeto Docker com Nginx e PostgreSQL

Este projeto configura um ambiente de desenvolvimento com Nginx como servidor web e PostgreSQL como banco de dados, utilizando Docker Compose.

## 📁 Estrutura do Projeto

```
.
├── docker-compose.yml
├── source/
│   ├── index.html
│   └── estilo.css
├── postgres_data/     (criado automaticamente)
└── postgres_init/
    └── 01-init.sql
```

## 📋 Requisitos

- 🐳 Docker
- 🐙 Docker Compose

## ⚙️ Configuração

### 🚀 Serviços

1. **🌐 Nginx**
   - Porta: 80
   - Diretório de arquivos: `./source`
   - Container: `curso_nginx`

2. **🐘 PostgreSQL**
   - Porta: 5432
   - Banco de dados: `curso_db`
   - Usuário: `curso_user`
   - Senha: `curso_password`
   - Container: `curso_postgres`

## 🚀 Como Usar

1. **▶️ Iniciar os containers**:
   ```bash
   docker compose up -d
   ```

2. **⏹️ Parar os containers**:
   ```bash
   docker compose down
   ```

3. **🔄 Reiniciar os containers**:
   ```bash
   docker compose restart
   ```

4. **📝 Ver logs**:
   ```bash
   docker compose logs
   ```

## 💾 Banco de Dados

### 📊 Estrutura

O banco de dados é inicializado com uma tabela `usuarios` no schema `public`:

```sql
CREATE TABLE IF NOT EXISTS public.usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### 👥 Dados Iniciais

O script de inicialização (`01-init.sql`) insere os seguintes usuários:
- 👤 João Silva (joao@email.com)
- 👤 Maria Santos (maria@email.com)
- 👤 Nillander (nillander@email.com)
- 👤 Rodrigo Amaro (rodrigoamaro@email.com)

### 🛠️ Comandos Úteis

1. **🔌 Conectar ao banco de dados**:
   ```bash
   docker exec -it curso_postgres psql -U curso_user -d curso_db
   ```

2. **📋 Verificar tabelas**:
   ```bash
   docker exec -it curso_postgres psql -U curso_user -d curso_db -c "\dt public.*"
   ```

3. **📥 Importar script SQL manualmente**:
   ```bash
   docker exec curso_postgres cat /docker-entrypoint-initdb.d/01-init.sql
   ```

4. **💾 Fazer backup do banco**:
   ```bash
   docker exec curso_postgres pg_dump -U curso_user curso_db > backup.sql
   ```

5. **📤 Restaurar backup**:
   ```bash
   cat backup.sql | docker exec -i curso_postgres psql -U curso_user -d curso_db
   ```

## 📦 Volumes

- 📂 `./source`: Arquivos do site servidos pelo Nginx
- 💾 `./postgres_data`: Dados do PostgreSQL
- 📝 `./postgres_init`: Scripts de inicialização do PostgreSQL

## ⚠️ Observações

1. **💾 Persistência de Dados**:
   - Os dados do PostgreSQL são persistidos no diretório `postgres_data`
   - Para resetar o banco, remova o diretório `postgres_data` e reinicie os containers

2. **🔒 Segurança**:
   - Em ambiente de produção, altere as senhas padrão
   - Considere usar variáveis de ambiente para credenciais
   - Restrinja o acesso à porta 5432 se necessário

3. **👨‍💻 Desenvolvimento**:
   - Os arquivos em `source` são servidos automaticamente pelo Nginx
   - Alterações nos arquivos são refletidas imediatamente

## 🔧 Troubleshooting

1. **❌ Container não inicia**:
   ```bash
   docker compose logs
   ```

2. **💾 Banco de dados não inicializa**:
   ```bash
   docker compose down -v
   docker compose up -d
   ```

3. **🔑 Problemas de permissão**:
   ```bash
   sudo chown -R 999:999 postgres_data
   ```

## 🤝 Contribuição

1. 🍴 Faça um fork do projeto
2. 🌿 Crie uma branch para sua feature (`git checkout -b feature/nova-feature`)
3. 💾 Commit suas mudanças (`git commit -am 'Adiciona nova feature'`)
4. 📤 Push para a branch (`git push origin feature/nova-feature`)
5. 📬 Crie um Pull Request