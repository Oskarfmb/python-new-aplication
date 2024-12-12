# Usa una imagen base de Python 3.11
FROM python:3.11-slim

# Instala las dependencias del sistema necesarias
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential libatlas-base-dev \
    && rm -rf /var/lib/apt/lists/*

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia los archivos del proyecto al contenedor
COPY . /app

# Instala las dependencias de Python
RUN pip install --no-cache-dir --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Exponer el puerto 10000
EXPOSE 10000

# Comando para ejecutar la aplicación
CMD ["streamlit", "run", "app.py", "--server.port=10000", "--server.address=0.0.0.0"]