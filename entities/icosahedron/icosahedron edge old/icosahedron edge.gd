class_name IcosahedronEdgeOld extends Node3D


@export var icosahedron: Icosahedron:
	set(icosahedron_):
		icosahedron = icosahedron_
		
		init_mesh()
		icosahedron.faces.add_child(self)
@export var radius = 0.1
@export var resoultion = 180

var vertices: Array[IcosahedronVertex]


func init_mesh() -> void:
	var circle = PackedVector2Array()
	
	for degree in resoultion:
		var x = radius * sin(PI * 2 * degree / resoultion)
		var y = radius * sin(PI * 2 * degree / resoultion)
		var vector = Vector2(x, y)
		circle.append(vector)
	
	%CSGPolygon3D.polygon = circle
