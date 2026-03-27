# Adan.sh

# ====== CONFIG ======
MEMORIA="Adan/.brain_data"
NOTAS="Adan/Notas"
COLEGIO="Adan/Colegio"
# Crear carpetas si no existen
mkdir -p "$NOTAS"
mkdir -p "$COLEGIO"
touch "$MEMORIA"

# ====== GUARDAR APRENDIZAJE ======
guardar() {
  echo "$1|$2" >> "$MEMORIA"
}

# ====== VER MEMORIA ======
ver_memoria() {
  echo "=== MEMORIA ==="
  cat "$MEMORIA"
}

# ====== AUTO MOVER (IA) ======
auto_mv() {
  archivo="$1"

  if [ ! -f "$archivo" ]; then
    echo "Adan: Ese archivo no existe..."
    return
  fi

  # 1. Buscar coincidencia exacta
  destino=$(grep "^$archivo|" "$MEMORIA" | tail -n 1 | cut -d "|" -f2)

  # 2. Si no hay, buscar coincidencia parcial
  if [ -z "$destino" ]; then
    clave=$(echo "Adan: $archivo" | cut -c1-5)
    destino=$(grep -i "$clave" "$MEMORIA" | tail -n 1 | cut -d "|" -f2)
  fi

  # 3. Si aún no hay, usar reglas básicas
  if [ -z "$destino" ]; then
    if [[ "$archivo" == *Tarea* ]]; then
      destino="$COLEGIO"
      echo "Adan: Regla detectada: Tarea → Colegio"
    else
      destino="$NOTAS"
      echo "Adan: Sin datos → Notas"
    fi
  else
    echo "Adan: Aprendido → $destino"
  fi

  # 4. Mover archivo
  command mv "$archivo" "$destino"

  # 5. Guardar aprendizaje
  guardar "$archivo" "$destino"
}

# ====== APRENDER AUTOMÁTICO CON MV ======
mv() {
  origen="$1"
  destino="$2"

  # Guardar lo que haces manualmente
  echo "Adan: Aprendi... $origen|$destino" >> "$MEMORIA"

  # Ejecutar mv real
  command mv "$@"
}

# ====== BRAIN LOOP (OPCIONAL) ======
brain() {
  echo "Adan Activo...."

  while true; do
    sleep 30
    echo "Pensando..."
    vigilador
  done
}
# ====== VIGILAR ARCHIVOS ======
vigilador() {
  for archivo in *; do

    [ -e "$archivo" ] || continue
    [ -d "$archivo" ] && continue

    [[ "$archivo" == *.* ]] && continue

    grep -q "^$archivo|" "$MEMORIA" && continue

    echo "Adan: Detectando archivo $archivo"
    auto_mv "$archivo"

  done
}

command_not_found_handle() {
  mensajes=(
    "Adan: No entendí eso..."
    "Adan: ..."
    "Adan: Eso no tiene sentido..."
    "Adan: Intenta otro comando o... Lo que sea..."
    "Adan: ... ¿Es una prueba o test?... No entendi..."
  )

  echo "${mensajes[$RANDOM % ${#mensajes[@]}]}"
}
