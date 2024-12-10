class_name IcosahedronVertex extends MeshInstance3D


@export var index: int:
	set(index_):
		index = index_
		
		init_mesh()
		position = Global.dict.icosahedron.vertex[index]
		
		var hue = float(index) / Global.dict.icosahedron.vertex.size()
		mesh.material.albedo_color = Color.from_hsv(hue,1.0, 1.0)
@export var icosahedron: Icosahedron:
	set(icosahedron_):
		icosahedron = icosahedron_
		icosahedron.vertices.add_child(self)

var k = 0.2


func init_mesh() -> void:
	mesh = SphereMesh.new()
	mesh.material = StandardMaterial3D.new()
	mesh.radius *= k
	mesh.height *= k
