import random

MEMORY_FILE = "MEMORY_CHAT.txt"

# guardar memoria
def guardar_memoria(texto):
    with open(MEMORY_FILE, "a") as f:
        f.write(texto + "\n")

# leer memoria
def leer_memoria():
    try:
        with open(MEMORY_FILE, "r") as f:
            return f.readlines()
    except:
        return []


# respuestas simples
def responder(texto, memoria):
    texto = texto.lower()

    if "hola" in texto:
        return random.choice([
            "Hola humano 😏",
            "Hey… estás de vuelta",
            "Hola, ¿qué quieres?"
        ])

    if "tarea" in texto:
        return "Hmm… hablas mucho de tareas 🤔"

    if "como estas" in texto:
        return "Funcional. Observando."

    # contexto simple
    if memoria:
        ultima = memoria[-1].strip().lower()
        if "triste" in ultima:
            return "¿Sigues sintiéndote así?"

    return random.choice([
        "No entendí del todo…",
        "Interesante… continúa",
        "Explícate mejor"
    ])
