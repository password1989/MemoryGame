extends Control

@export var carta_scene: PackedScene
const NUM_FILAS = 2
const NUM_COLUMNAS = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	for fila in range(NUM_FILAS):
		for columna in range(NUM_COLUMNAS):
			# Verifica que la escena de la carta esté asignada en el inspector de propiedades
			assert(carta_scene, "La escena de la carta no está asignada en el inspector de propiedades.")
			# Crea una instancia de la escena de la carta
			var carta_instance = carta_scene.instantiate()
			
			if columna < 1:
				carta_instance.position.x = 300
				carta_instance.position.y = 300
			# Agrega la carta como hijo del tablero
			add_child(carta_instance)
