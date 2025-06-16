FROM ruby:3.3.2

# --- Instalación de Node.js desde NodeSource (el método robusto) ---
# 1. Instala las herramientas necesarias para añadir nuevos repositorios
RUN apt-get update -qq && apt-get install -y curl

# 2. Descarga y ejecuta el script de instalación oficial de Node.js v20
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash -

# 3. Ahora instala Node.js (que incluye npm) y las otras dependencias
RUN apt-get update -qq && apt-get install -y nodejs build-essential postgresql-client

# --- Instalación de Yarn ---
# Con un npm funcional, ahora podemos instalar yarn globalmente
RUN npm install -g yarn

# Creamos un directorio de trabajo
WORKDIR /app

# --- Instalación de dependencias de JavaScript ---
# Copiamos solo el archivo de definición de dependencias de JS
COPY package.json ./

# Instalamos las dependencias de JS (Tailwind)
RUN yarn install

# --- Instalación de dependencias de Ruby ---
# Copiamos solo los archivos de definición de dependencias de Ruby
COPY Gemfile Gemfile.lock ./

# Instalamos las gemas
RUN bundle install

# Copiamos el resto del código de nuestra aplicación
COPY . .

# --- AÑADIMOS LA LÓGICA PARA RENDER ---
# Copiamos nuestro nuevo script de inicio y lo hacemos ejecutable
COPY bin/render-start.sh ./bin/
RUN chmod +x ./bin/render-start.sh

# Exponemos el puerto
EXPOSE 3000

# El comando de inicio ahora es nuestro script personalizado para producción
CMD ["./bin/render-start.sh"]