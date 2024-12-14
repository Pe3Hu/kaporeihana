class_name CubeEdge extends MeshInstance3D


@export var cube: Cube:
	set(cube_):
		cube = cube_
		
		init_mesh()
		cube.edges.add_child(self)

var vertices: Array[CubeVertex]
var faces: Array[CubeFace]
#var edges: Dictionary

var radius: float = 0.05


func init_mesh() -> void:
	mesh = CylinderMesh.new()
	mesh.material = StandardMaterial3D.new()
	mesh.top_radius = radius
	mesh.bottom_radius = radius
	#mesh.height = 1
	
	for vertex in vertices:
		position += vertex.position / vertices.size()
		vertex.edges.append(self)
	
	var index = cube.edges.get_child_count()
	var axles = [0, 1, 2]
	var rotations = [2, 1, 0]
	
	for _i in axles.size():
		if vertices.front().position[axles[_i]] != vertices.back().position[axles[_i]]:
			rotation[rotations[_i]] = PI / 2
	
	var hue = float(index) / Global.dict.cube.edge.size()
	mesh.material.albedo_color = Color.from_hsv(hue,1.0, 1.0)
	
func connect_vertices() -> void:
	var a = vertices.front()
	var b = vertices.back()
	a.vertices[b] = self
	b.vertices[a] = self
	
func connect_faces() -> void:
	var pairs = {}
	
	for vertex in vertices:
		for face in vertex.faces:
			if !pairs.has(face):
				pairs[face] = 0
			
			pairs[face] += 1
	
	for face in pairs:
		if pairs[face] == 2:
			faces.append(face)
			face.edges.append(self)
	
	var a = faces.front()
	var b = faces.back()
	a.faces[b] = self
	b.faces[a] = self
