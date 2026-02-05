FROM apache/superset:latest

USER root

# Cài đặt dependencies
RUN apt-get update && \
    apt-get install -y build-essential libpq-dev python3-dev curl && \
    rm -rf /var/lib/apt/lists/*

# Cài pip vào venv và cài psycopg2
RUN /app/.venv/bin/python -m ensurepip --upgrade && \
    /app/.venv/bin/python -m pip install --no-cache-dir psycopg2-binary

USER superset