-- Garantir que estamos usando o schema public
SET search_path TO public;

-- Criar tabela se não existir
CREATE TABLE IF NOT EXISTS public.usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Inserir dados de exemplo
INSERT INTO public.usuarios (nome, email) VALUES
    ('João Silva', 'joao@email.com'),
    ('Maria Santos', 'maria@email.com'),
    ('Nillander', 'nillander@email.com'),
    ('Rodrigo Amaro', 'rodrigoamaro@email.com')
ON CONFLICT (email) DO NOTHING;
