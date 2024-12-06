@tool
class_name Icosahedron extends Node3D




func _ready() -> void:
	rotation.z = PI / 3 * 0.97
	
	init_faces()
	
func init_faces() -> void:
	var face_indexs = [
		[0,1,2],
		[0,2,3],
		[0,3,4],
		[0,4,5],
		[0,5,1],
		[6,11,10],
		[6,10,9],
		[6,9,8],
		[6,8,7],
		[6,7,11],
		[1,9,10],
		[2,10,11],
		[3,11,7],
		[4,7,8],
		[5,8,9],
		[7,4,3],
		[8,5,4],
		[9,1,5],
		[10,2,1],
		[11,3,2],
	]
	
	for indexs in face_indexs:
		var vertices = []
		
		for index in indexs:
			vertices.append(Global.dict.icosahedron.vertex[index])
		
		var face = IcosahedronFace.new()
		var hue = float(face_indexs.find(indexs)) / face_indexs.size()
		var color = Color.from_hsv(hue,1.0, 1.0)
		face.set_vertices_and_color(vertices, color)
		%Faces.add_child(face)
	
	var k = 0.2
	
	for vertex in Global.dict.icosahedron.vertex:
		var mesh = MeshInstance3D.new()
		mesh.mesh = SphereMesh.new()
		mesh.position = vertex
		mesh.mesh.material = StandardMaterial3D.new()
		mesh.mesh.radius *= k
		mesh.mesh.height *= k
		
		var hue = float(Global.dict.icosahedron.vertex.find(vertex)) / Global.dict.icosahedron.vertex.size()
		mesh.mesh.material.albedo_color = Color.from_hsv(hue,1.0, 1.0)
		%Faces.add_child(mesh)
	
func _process(delta: float) -> void:
	rotation.y += delta * 0.
