@tool
class_name CubeFace extends MeshInstance3D


@export var cube: Cube:
	set(cube_):
		cube = cube_
		
		init_mesh()
		cube.faces.add_child(self)

var vertices: Array[CubeVertex]
var edges: Array[CubeEdge]
var faces: Dictionary


func init_mesh() -> void:
	mesh = PlaneMesh.new()
	mesh.material = StandardMaterial3D.new()
	mesh.size = Vector2.ONE * 2
	
	var index = cube.faces.get_child_count()
	var hue = float(index) / Global.dict.cube.face.size()
	mesh.material.albedo_color = Color.from_hsv(hue,1.0, 1.0)
	
	for vertex in vertices:
		position += vertex.position / vertices.size()
		vertex.faces.append(self)
	
	var axles = [0, 1, 2]
	
	for _i in axles.size():
		if position[axles[_i]] != 0:
			mesh.orientation = axles[_i]
			
			if sign(position[axles[_i]]) != 1:
				mesh.flip_faces = !mesh.flip_faces
