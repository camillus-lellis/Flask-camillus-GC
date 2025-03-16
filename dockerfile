# imagem base do Python
FROM python:3.9-slim

# Configura o /app como diretório de trabalho
WORKDIR /app

# Copia o arquivo de requerimentos para o diretório de trabalho
COPY requirements.txt .

# Instala as dependências da aplicação
RUN pip install --no-cache-dir -r requirements.txt

# Copia todo o código da aplicação para o diretório de trabalho
COPY . .

# Define a variável de ambiente Flask
ENV FLASK_ENV=production
ENV FLASK_APP=app.py

# abre a porta 5000
EXPOSE 5000

# executa a aplicação
CMD ["flask", "run", "--host=0.0.0.0"]

# PARA EXECUTAR TESTES
RUN ["pytest"]