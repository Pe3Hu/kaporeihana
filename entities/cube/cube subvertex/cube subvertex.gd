class_name CubeSubVertex extends MeshInstance3D


@export var cube: Cube:
	set(cube_):
		cube = cube_
		
		init_mesh()
		#cube.subvertex_positions[position] = self
		cube.subvertices.add_child(self)

var subfaces: Array[CubeSubFace]
var subedges: Array[CubeSubEdge]
var subvertices: Dictionary

var vertices: Array[CubeVertex]
var edges: Array[CubeEdge]
var faces: Array[CubeFace]

var index: int
var k = 0.2


func init_mesh() -> void:
	mesh = SphereMesh.new()
	mesh.material = StandardMaterial3D.new()
	mesh.radius *= k
	mesh.height *= k
