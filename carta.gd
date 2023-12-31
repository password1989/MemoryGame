extends Node2D

@onready var anim_girar: AnimationPlayer = $Animacion

# Referencia a la imagen de la parte delantera
@onready var frontal: Sprite2D = $Frontal
@onready var dorso: Sprite2D = $DorsoGodot
var boca_abajo : bool = true
var idImagen : int

func _ready():
	frontal.scale.x=0
	frontal.scale.y=0
	
	dorso.scale.x=1
	dorso.scale.y=1

func _process(delta):
	boca_abajo = _comprobar_estado()

func _on_button_girar_pressed():
	# TRAZA print("¡Boton girar presionado!")
	if boca_abajo:
		anim_girar.play("Descubrir")
	else:
		anim_girar.play("Esconder")

func _comprobar_estado() -> bool:
	if frontal.scale.x == 1 and frontal.scale.y == 1:
		# TRAZA print("La carta está boca arriba")
		return false
	else:
		return true
