@tool
class_name Cube extends Node3D


@export var faces: Node3D
@export var vertices: Node3D
@export var edges: Node3D

var vertex_edges: Dictionary


func _ready() -> void:
	#rotation.z = PI / 3 * 0.97
	
	init_vertices()
	init_egdes()
	init_faces()
	init_connects()
	
func init_vertices() -> void:
	for index in Global.dict.cube.vertex.size():
		var vertex = CubeVertex.new()
		vertex.index = index
		vertex.cube = self
	
func init_egdes() -> void:
	for indexs in Global.dict.cube.edge:
		var edge = CubeEdge.new()
		var _vertices = []
		
		for index in indexs:
			var vertex = vertices.get_child(index)
			_vertices.append(vertex)
		
		edge.vertices.append_array(_vertices)
		edge.cube = self
	
func init_faces() -> void:
	for indexs in Global.dict.cube.face:
		var face = CubeFace.new()
		var _vertices = []
		
		for index in indexs:
			var vertex = vertices.get_child(index)
			_vertices.append(vertex)
		
		face.vertices.append_array(_vertices)
		face.cube = self
	
func init_connects() -> void:
	for edge in edges.get_children():
		edge.connect_vertices()
		edge.connect_faces()
	
func _process(delta: float) -> void:
	rotation.y += delta * 0.
