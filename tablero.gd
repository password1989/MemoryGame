extends Control

@export var carta_scene: PackedScene
const NUM_FILAS = 2
const NUM_COLUMNAS = 5
const SEPARACION = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	_generar_tablero()
	_asignar_imagenes()

func _generar_tablero():
	for fila in range(NUM_FILAS):
		for columna in range(NUM_COLUMNAS):
			# Verifica que la escena de la carta esté asignada en el inspector de propiedades
			assert(carta_scene, "La escena de la carta no está asignada en el inspector de propiedades.")
			# Crea una instancia de la escena de la carta
			var carta_instance = carta_scene.instantiate()
			
			carta_instance.position.x= carta_instance.position.x + (252 * columna) + (SEPARACION * columna)
			carta_instance.position.y= carta_instance.position.y + (252 * fila) + (SEPARACION * fila)
			
			# Agrega la carta como hijo del tablero
			add_child(carta_instance)

func _asignar_imagenes():
	# Lista de rutas
	var rutas_texturas = [
		"res://Images/A-Mayus.png",
		"res://Images/a-Minus.png",
		"res://Images/E-Mayus.png",
		"res://Images/e-Minus.png",
		"res://Images/I-Mayus.png",
		"res://Images/i-Minus.png",
		"res://Images/O-Mayus.png",
		"res://Images/o-Minus.png",
		"res://Images/U-Mayus.png",
		"res://Images/u-Minus.png"
		# Agrega más rutas según sea necesario
		]
	var carta_aleatoria
	var cartas_utilizadas = []
	# Bucle seria: 
	# Paso 1 elige textura
	# Paso 2 elige dos cartas que no se hayan usado aun
	# Paso 3 repite hasta que se hayan usado todas las cartas
	
	if get_child_count() % 2 == 0: # Nota: ¿donde controlar que las cartas sean pares?
		# Genera un índice aleatorio para seleccionar una textura de la lista
		# La función randi_range(min, max) genera un número aleatorio dentro del rango inclusivo entre min y max. 
		
		for i in range(get_child_count()):
			if i == 0:
				carta_aleatoria = randi_range(0,get_child_count()-1)
			else:
				#sigue sacando numeros aleatorios distintos del vector carta utilizada
				while true:
					carta_aleatoria = randi_range(0,get_child_count()-1)
					if carta_aleatoria not in cartas_utilizadas:
						break
			cartas_utilizadas.append(carta_aleatoria) #Es la primera
			
			var nueva_textura = load(rutas_texturas[i])
			var carta_instance
			var sprite_carta
			carta_instance = get_child(carta_aleatoria)
			sprite_carta = carta_instance.get_node("Frontal")
			sprite_carta.texture = nueva_textura
	else: print ("Error, cartas impares")
