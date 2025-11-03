#debes completar este archivo con los comandos necesarios para provisionar la base de datos

#!/usr/bin/env bash

# Actualizar paquetes
sudo apt-get update -y

# Instalar PostgreSQL
sudo apt-get install -y postgresql postgresql-contrib

# Habilitar PostgreSQL al inicio
sudo systemctl enable postgresql
sudo systemctl start postgresql

# Crear base de datos, usuario y tabla con datos de ejemplo
sudo -u postgres psql -c "CREATE USER vagrant WITH PASSWORD 'vagrant';" || true
sudo -u postgres psql -c "ALTER USER vagrant WITH SUPERUSER;" || true
sudo -u postgres psql -c "CREATE DATABASE juegosDB OWNER vagrant;" || true

# Crear la tabla para el ejemplo
sudo -u postgres psql -d juegosDB -c "
CREATE TABLE IF NOT EXISTS juegos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    precio INT
);
INSERT INTO juegos (nombre, precio) VALUES
('Black Myth: Wukong', 60),
('Metal Gear Rising', 30),
('Sekiro: Shadows Die Twice', 60);
"