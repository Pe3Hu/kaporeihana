class_name CubeSubEdge extends MeshInstance3D


@export var cube: Cube:
	set(cube_):
		cube = cube_
		
		cube.subedges.add_child(self)
		init_mesh()
		connect_subvertices()

var subfaces: Array[CubeSubFace]
var subvertices: Array[CubeSubVertex]
#var edges: Dictionary

var radius: float = 0.03


func init_mesh() -> void:
	mesh = CylinderMesh.new()
	mesh.material = StandardMaterial3D.new()
	mesh.top_radius = radius
	mesh.bottom_radius = radius
	mesh.height = 2.0 / cube.edge_parts
	
	for subvertex in subvertices:
		position += subvertex.position / subvertices.size()
		subvertex.subedges.append(self)
	
	#var index = cube.subedges.get_child_count()
	var axles = [0, 1, 2]
	var rotations = [2, 1, 0]
	
	for _i in axles.size():
		if abs(subvertices.front().position[axles[_i]] - subvertices.back().position[axles[_i]]) >= 0.01:
			rotation[rotations[_i]] = PI / 2
	
	#var hue = float(index) / Global.dict.cube.edge.size()
	#mesh.material.albedo_color = Color.from_hsv(hue,1.0, 1.0)
	
func connect_subvertices() -> void:
	var a = subvertices.front()
	var b = subvertices.back()
	a.subvertices[b] = self
	b.subvertices[a] = self
