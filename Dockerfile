# Usar la imagen oficial de Selenium con Chrome preinstalado
FROM selenium/standalone-chrome:latest

# Cambiar a usuario root para instalar paquetes del sistema
USER root

# Actualizar e instalar python3-pip, herramientas de compilación y librerías de desarrollo necesarias
RUN apt-get update && apt-get install -y \
    python3-pip \
    build-essential \
    python3-dev \
    libffi-dev \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    lsb-release \
    && apt-get clean

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el archivo requirements.txt y el resto del código fuente a la imagen
COPY requirements.txt /app/requirements.txt
COPY . /app

# Instalar las dependencias de Python usando el resolvedor legado (útil en algunos casos)
RUN python3 -m pip install --no-cache-dir --use-deprecated=legacy-resolver -r requirements.txt

# Comando para ejecutar el script principal
CMD ["python3", "renfe_search.py"]
