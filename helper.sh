# -- IMPORTANTE --

# RAIZ DEL PROYECTO
ROOT_VISUAL="Proyecto-G-nesis-ASISTENTE-"

SKYsystemFSC() {
  PS1='\[\e[32m\][Genesis]\[\e[0m\]$(relative_path) > ' # Es la terminal lol
  # QUITAR SUGERENCIAS
  unset command_not_found_handle # No funciono
  save
  echo "SKYBOT: Terminal lista"
}

relative_path() {
  local current="$(pwd)"
  echo "${current#$ROOT_VISUAL}"
}

reload() {
  source ~/.bashrc
}

# ++ IMPORTANTE ++

# ALIAS

alias sd='skycd'

# ACCESO RAPIDO

blue() {
  echo "Es para pc lol"
  skycd REPOSITORIOS/Proyecto-G-nesis-ASISTENTE-
}

sky() {
  skycd /storage/emulated/0/REPOSITORIOS/Proyecto-G-nesis-ASISTENTE- || return
  save
  echo "USUARIO: SkyMovil ENTRANDO A: PROYECTO-G-NESIS-ASISTENTE-"
  echo "Listo :D"
}

# COMANDOS RAPIDOS

skycd() {
  if [ -z "$1" ]; then
    echo -e "\e[31mDigita una ubicacion lol\e[0m"
    return
  fi

  cd "$1" || {
    echo -e "\e[31mNo se pudo entrar a la carpeta\e[0m"
    return
  }

  if [[ $- == *i* ]]; then
    echo -e "\e[32mEstas en $(pwd)\e[0m"
    echo -e "\e[34mArchivos:\e[0m"
    ls -a
  fi
}

back() {
  echo "Saliendo..."
  skycd ..
  echo "Ya saliste, pero ve a salir pasto pinshe loco :V"
}

atajo() {
  echo "Atajo fuaaa"
  skycd -
  echo "Atajo finalizado... y si, hablando de momos, se acabaron los momos"
}

# COMANDOS GITHUB (CARGAR Y GUARDAR)

save() {
  cd /storage/emulated/0/SKYCARPETA || {
    echo "Lugar equivocado niño, o chico sin gene>
    return;
    }
  echo "Sincronizando lol"
  git pull --rebase > /dev/null &&
  echo "Listo, ahora guardando"
  git add . > /dev/null &&
  echo "Generando un commit todo zzz"
  git commit -m "Auto update" > /dev/null || echo>
  echo "Subiendo la wea"
  git push > /dev/null  &&
  echo "Listo xD"
}

saveAndExit() {
  echo "Guardando y saliendo, ten cuidado!"
  save
  echo "Bye lol"
  exit
}
