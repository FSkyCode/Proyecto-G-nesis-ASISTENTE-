# -- IMPORTANTE --
#!/bin/bash

source Adan/Adan.sh
source Eva/Eva.sh

SKYsystemFSC() {
  echo "🌍 Genesis iniciado"
  brain &

  while true; do
    read -p "Genesis$(relative_path)> " cmd

    texto=$(echo "$cmd" | tr 'A-Z' 'a-z')

    # apagar sistema
    if [[ "$texto" == "Apagar" ]]; then
      echo "🧠 Apagando Genesis..."
      pkill -f brain
      break
    fi

    # intentar IA
    procesar_texto "$cmd"
    resultado=$?

    # si no lo entiende → bash o mensaje
    if [ $resultado -ne 0 ]; then
      if command -v ${cmd%% *} >/dev/null 2>&1; then
        eval "$cmd"
      else
        command_not_found_handle
      fi
    fi
  done
}

reload() {
  source helper.sh
}
# ++ IMPORTANTE ++
