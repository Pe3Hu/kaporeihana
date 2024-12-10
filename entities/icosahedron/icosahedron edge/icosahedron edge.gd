class_name IcosahedronEdge extends MeshInstance3D


@export var icosahedron: Icosahedron:
	set(icosahedron_):
		icosahedron = icosahedron_
		
		init_mesh()
		icosahedron.edges.add_child(self)

var vertices: Array[IcosahedronVertex]


func init_mesh() -> void:
	mesh = TubeTrailMesh.new()
	mesh.material = StandardMaterial3D.new()
	
	var curve = Curve3D.new()
	
	for vertex in vertices:
		curve.add_point(vertex.position)
