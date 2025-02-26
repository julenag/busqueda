# Usar la imagen oficial de Selenium con Chrome preinstalado
FROM selenium/standalone-chrome:latest

# Instalar dependencias de Python y otros paquetes del sistema
USER root
RUN apt-get update && apt-get install -y python3-pip \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev

# Crear el directorio de trabajo en la imagen
WORKDIR /app

# Copiar el archivo requirements.txt y el código fuente a la imagen
COPY requirements.txt /app/requirements.txt
COPY . /app

# Instalar las dependencias de Python desde requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Ejecutar el script principal con Python
CMD ["python", "renfe_search.py"]
