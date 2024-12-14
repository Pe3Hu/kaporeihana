class_name CubeVertex extends MeshInstance3D


@export var index: int:
	set(index_):
		index = index_
		
		init_mesh()
		position = Global.dict.cube.vertex[index]
		
		var hue = float(index) / Global.dict.cube.vertex.size()
		mesh.material.albedo_color = Color.from_hsv(hue,1.0, 1.0)
@export var cube: Cube:
	set(cube_):
		cube = cube_
		cube.vertices.add_child(self)

var faces: Array[CubeFace]
var edges: Array[CubeEdge]
var vertices: Dictionary

var k = 0.2


func init_mesh() -> void:
	mesh = SphereMesh.new()
	mesh.material = StandardMaterial3D.new()
	mesh.radius *= k
	mesh.height *= k
