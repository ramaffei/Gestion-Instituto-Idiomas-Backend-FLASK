#!/bin/bash

envFile="$1"

# Validar parámetro
if [ -z "$envFile" ]; then
    echo -e "❌ \e[31mDebes proporcionar un archivo .env válido.\e[0m" >&2
    exit 1
fi

# Validar existencia del archivo
if [ ! -f "$envFile" ]; then
    echo -e "❌ \e[31mEl archivo '$envFile' no existe.\e[0m" >&2
    exit 1
fi

# Obtener nombre del repositorio
repo=$(gh repo view --json name -q '.name')
if [ -z "$repo" ]; then
    echo -e "❌ \e[31mNo se encontró un repositorio en esta carpeta.\e[0m" >&2
    exit 1
fi

# Obtener rama actual
branch=$(git rev-parse --abbrev-ref HEAD)
if [ -z "$branch" ]; then
    echo -e "❌ \e[31mNo se pudo obtener la rama actual.\e[0m" >&2
    exit 1
fi

echo -e "🔹 \e[36mConfigurando variables y secretos en '$repo' para la rama '$branch'...\e[0m"

# Leer línea por línea
while IFS= read -r line || [ -n "$line" ]; do
    # Eliminar espacios y saltos de línea
    line=$(echo "$line" | xargs)
    
    # Ignorar líneas vacías o comentarios
    if [[ -z "$line" || "$line" == \#* ]]; then
        continue
    fi

    # Procesar SECRET y VAR
    if [[ "$line" =~ ^(SECRET|VAR)\.([A-Za-z0-9_]+)=(.*)$ ]]; then
        type="${BASH_REMATCH[1]}"
        name="${BASH_REMATCH[2]}"
        value="${BASH_REMATCH[3]}"

        if [ "$type" = "SECRET" ]; then
            echo -e "🔑 \e[33mConfigurando secret: $name\e[0m"
            echo -n "$value" | gh secret set "$name" --repo "$repo"
        elif [ "$type" = "VAR" ]; then
            echo -e "🌍 \e[32mConfigurando variable: $name\e[0m"
            gh variable set "$name" --body "$value" --repo "$repo"
        fi
    else
        echo -e "⚠️ \e[90mLínea no válida (ignorando): $line\e[0m" >&2
    fi
done < "$envFile"

echo -e "✅ \e[32mProceso completado!\e[0m"