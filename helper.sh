reload() {
  source ~/.bashrc
}

alias sd='skycd'

SKYSYSTEM() {
  source system.sh
}

skycd() {
  if [ -z "$1" ]; then
    echo -e "\e[31mDigita una ubicacion lol\e[0m"
    return
  fi

  cd "$1" || {
    echo -e "\e[31mNo se pudo entrar a la carpeta\e[0m"
    return
  }

  echo -e "\e[32mEstas en $(pwd)\e[0m"
  echo -e "\e[34mArchivos:\e[0m"
  ls -a
}

blue() {
  echo "Es para pc lol"
}

sky() {
  cd /storage/emulated/0/SKYCARPETA || return
  save
  echo ""
  echo "Revisando la biblioteca..."
  ls
  echo "Listo :D"
}



back() {
  echo "Saliendo..."
  cd ..
  echo "Ya saliste, pero ve a salir pasto pinshe loco :V"
}

at() {
  echo "Atajo fuaaa"
  cd -
  echo "Atajo finalizado... y si, hablando de momos, se acabaron los momos"
}

save() {
  cd /storage/emulated/0/SKYCARPETA || {
    echo "Lugar equivocado niño, o chico sin genero, pero decirte 'chico sin genero' ya asumo que tienes genero entonces... lugar equivocado, ?";
    return;
    }
  echo "Sincronizando lol"
  git pull --rebase > /dev/null &&
  echo "Listo, ahora guardando"
  git add . > /dev/null &&
  echo "Generando un commit todo zzz"
  git commit -m "Auto update" > /dev/null || echo "Ey ey, estoy haciendo aogo aqui; No es cierto, no estas haciendo nada!"
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
