extends Node


var rng = RandomNumberGenerator.new()
var arr = {}
var color = {}
var dict = {}


func _ready() -> void:
	if dict.keys().is_empty():
		init_arr()
		init_color()
		init_dict()
	
	#get_tree().bourse.resource.after_init()
	
func init_arr() -> void:
	arr.value = [1, 2, 3, 4, 5, 6, 7]
	
func init_dict() -> void:
	dict.icosahedron = {}
	
	init_icosahedron_vertex()
	init_icosahedron_face()
	
func init_direction() -> void:
	dict.direction = {}
	dict.direction.linear2 = [
		Vector2i( 0,-1),
		Vector2i( 1, 0),
		Vector2i( 0, 1),
		Vector2i(-1, 0)
	]
	dict.direction.diagonal = [
		Vector2i( 1,-1),
		Vector2i( 1, 1),
		Vector2i(-1, 1),
		Vector2i(-1,-1)
	]
	
	dict.direction.hybrid = []
	
	for _i in dict.direction.linear2.size():
		var direction = dict.direction.linear2[_i]
		dict.direction.hybrid.append(direction)
		direction = dict.direction.diagonal[_i]
		dict.direction.hybrid.append(direction)
	
func init_icosahedron_vertex() -> void:
	dict.icosahedron.vertex = [
		Vector3(1,0.5,0),
		Vector3(1,-0.5,0),
		Vector3(0.5,0,1),
		Vector3(0,1,0.5),
		Vector3(0,1,-0.5),
		Vector3(0.5,0,-1),
		Vector3(-1,-0.5,0),
		Vector3(-1,0.5,0),
		Vector3(-0.5,0,-1),
		Vector3(0,-1,-0.5),
		Vector3(0,-1,0.5),
		Vector3(-0.5,0,1)
	]
	
	var gamma = (1 + sqrt(5)) / 2
	var axles = [0, 1, 2]
	
	for _i in dict.icosahedron.vertex.size():
		var vertex = dict.icosahedron.vertex[_i]
		
		for axle in axles:
			if abs(vertex[axle]) == 0.5:
				vertex[axle] /= 0.5 * gamma
				dict.icosahedron.vertex[_i] = vertex
				break
	
func init_icosahedron_face() -> void:
	dict.icosahedron.face = [
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
func init_color():
	pass
	#var h = 360.0
	
func save(path_: String, data_): #: String
	var file = FileAccess.open(path_, FileAccess.WRITE)
	file.store_string(data_)
	
func load_data(path_: String):
	var file = FileAccess.open(path_, FileAccess.READ)
	var text = file.get_as_text()
	var json_object = JSON.new()
	var _parse_err = json_object.parse(text)
	return json_object.get_data()
	
func get_random_key(dict_: Dictionary):
	if dict_.keys().size() == 0:
		print("!bug! empty array in get_random_key func")
		return null
	
	if true:
		var keys = dict_.keys()
		var weights = PackedFloat32Array()
		
		for key in keys:
			weights.append(float(dict_[key]))
		
		return keys[rng.rand_weighted(weights)]
	
	var total = 0
	
	for key in dict_.keys():
		total += dict_[key]
	
	rng.randomize()
	var index_r = rng.randf_range(0, 1)
	var index = 0
	
	for key in dict_.keys():
		var weight = float(dict_[key])
		index += weight/total
		
		if index > index_r:
			return key
	
	print("!bug! index_r error in get_random_key func")
	return null
