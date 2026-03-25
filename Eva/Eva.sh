procesar_texto() {
  texto=$(echo "$1" | tr 'A-Z' 'a-z')

  if [[ "$texto" == *"crear"* && "$texto" == *"archivo"* ]]; then
    nombre=$(echo "$texto" | awk '{print $NF}')
    touch "$nombre"
    echo "🧠 Archivo $nombre creado"
    return 0
  fi

  return 1
}
