#!/usr/bin/env bash
# exit on error
set -o errexit

# Compila los assets (incluyendo el CSS de Tailwind) para producción
bundle exec rails assets:precompile

# Ejecuta las migraciones de la base de datos
bundle exec rails db:migrate

# Inicia el servidor de Rails, asegurándote de que escuche en 0.0.0.0
bundle exec rails server -b 0.0.0.0