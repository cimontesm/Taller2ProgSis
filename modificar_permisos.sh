function verificar_ubicacion {
    while true; do
        if [[ -d "$1" ]]; then
            echo "Ubicación válida: $1"
            break
        else
            echo "La ubicación '$1' no es válida o no existe. Por favor, ingrese una ubicación correcta:"
            read -r nueva_ubicacion
            set -- "$nueva_ubicacion"
        fi
    done
    echo "$1"
}

if [[ $# -lt 1 ]]; then
    echo "Debe proporcionar una ubicación como parámetro."
    exit 1
fi

ubicacion=$(verificar_ubicacion "$1")

original_file="$ubicacion/original.txt"
final_file="$ubicacion/final.txt"

echo "Listado inicial en $original_file..."
ls -lR "$ubicacion" > "$original_file"

echo "Cambiando permisos a 743 para archivos en el directorio base..."
find "$ubicacion" -maxdepth 1 -type f -exec chmod 743 {} \;

echo "Cambiando permisos a 542 para archivos en los subdirectorios..."
find "$ubicacion" -mindepth 2 -type f -exec chmod 542 {} \;

echo "Listado Final en $final_file..."
ls -lR "$ubicacion" > "$final_file"

echo "Completado."
