from adan_system import guardar_memoria
from adan_system import leer_memoria
from adan_system import responder
import curses
import time

def main(stdscr):
    curses.curs_set(1)

    height, width = stdscr.getmaxyx()

    # ventana de chat (arriba)
    chat_win = curses.newwin(height - 3, width, 0, 0)

    # ventana de input (abajo)
    input_win = curses.newwin(3, width, height - 3, 0)

    chat = []

    while True:
        chat_win.clear()

        # mostrar chat
        for i, line in enumerate(chat[-(height - 4):]):
            chat_win.addstr(i, 0, line)

        chat_win.box()
        chat_win.refresh()

        # input
        input_win.clear()
        input_win.box()
        input_win.addstr(1, 1, "Usuario> ")
        input_win.refresh()

        curses.echo()
        user_input = input_win.getstr(1, 10).decode("utf-8")
        curses.noecho()

        if user_input == "exit":
            break

        # respuesta simple
        guardar_memoria(user_input)
        memoria = leer_memoria()
        respuesta = responder(user_input, memoria)
        chat.append(respuesta)

        # guardar conversación
        chat.append("Usuario: " + user_input)

        # animación letra por letra
        linea = "Adan: "
        chat.append(linea)

        for c in respuesta:
          linea += c
          chat[-1] = linea  # actualiza la última línea

          chat_win.clear()
          for i, line in enumerate(chat[-(height - 4):]):
            chat_win.addstr(i, 0, line)

            chat_win.box()
            chat_win.refresh()

            time.sleep(0)  # velocidad (puedes cambiarla)


curses.wrapper(main)
