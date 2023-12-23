extends Control

@export var carta_scene: PackedScene
const NUM_FILAS = 2
const NUM_COLUMNAS = 2
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
		"res://Images/2.png", 				# 0
		"res://Images/interrogacion.png", 	# 1
		"res://Images/+.png", 				# 2
		"res://Images/pelota.png", 			# 3
		"res://Images/x.png" 				# 4
		# Agrega más rutas según sea necesario
		]
		
	var dibujos_utilizados = []
	var cartas_utilizadas = []
	# Bucle seria: 
	# Paso 1 elige textura
	# Paso 2 elige dos cartas que no se hayan usado aun
	# Paso 3 repite hasta que se hayan usado todas las cartas
	
	if get_child_count() % 2 == 0: # Nota: ¿donde controlar que las cartas sean pares?
		# Genera un índice aleatorio para seleccionar una textura de la lista
		# La función randi_range(min, max) genera un número aleatorio dentro del rango inclusivo entre min y max. 
		
		var textura_aleatorio = randi_range(0,rutas_texturas.size()-1)
		print (textura_aleatorio) # TRAZA
		dibujos_utilizados.append(0) #Es la primera
		
		for i in range(get_child_count()):
			var carta_aleatoria = randi_range(0,get_child_count()-1)
			print (carta_aleatoria) # TRAZA
			
			if i % 2 == 0:
				textura_aleatorio = randi_range(0,rutas_texturas.size()-1)
				print (textura_aleatorio) # TRAZA
			
			var nueva_textura = load(rutas_texturas[textura_aleatorio])
			
			var carta_instance
			var sprite_carta
			if i == 0:
				cartas_utilizadas.append(i) #Es la primera
				carta_instance = get_child(i)
				sprite_carta = carta_instance.get_node("Frontal")
				sprite_carta.texture = nueva_textura
			else:
				for j in cartas_utilizadas.size():
					if cartas_utilizadas[j] == carta_aleatoria:
						print ("Carta duplicada")
					else:
						print ("Carta vacia")
						carta_instance = get_child(i)
						sprite_carta = carta_instance.get_node("Frontal")
						sprite_carta.texture = nueva_textura
		
	else: print ("Error, cartas impares")
