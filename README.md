# Busca Cep
Aplicação que realiza consultas usando a [API de Ceps da AwesomeAPI](https://cep.awesomeapi.com.br/)

## Tela da aplicação em funcionamento
![BuscaCep](https://github.com/user-attachments/assets/6593439d-ead8-467d-ba6c-7421bb19cb01)
*aguarde carregar*

## Features
O que a aplicação faz:
- Consulta ceps e apresenta as informações relacionadas.
- Conta os Ceps mais buscados.
- Conta os Ceps mais buscados por estado.

## Tecnologias
- Ruby on Rails 8.0.1
- Ruby 3.4.1
- Tailwind
- DaisyUI
- Postgres 16
- Docker

## Como executar este projeto usando Docker
### 1. Clone o repositório e dentro do diretório execute o comando:
```bash
docker compose build
```

### 2. Renomeie o .env.example para .env
```bash
mv .env.example .env
```

### 3. Inicie o projeto
```bash
make up
```

A aplicação estará disponível no endereço http://localhost:3000/ .

### 4. Execute os testes
Em outro terminal digite:
```bash
make test
```

### 5. Acessar o bash dentro do container
```
make bash
```

## Cobertura de testes
![image](https://github.com/user-attachments/assets/5e07b167-849f-47df-bb45-c2ca4be653af)
