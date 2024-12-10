@tool
class_name Icosahedron extends Node3D


@export var faces: Node3D
@export var vertices: Node3D
@export var edges: Node3D

var vertex_edges: Dictionary


func _ready() -> void:
	rotation.z = PI / 3 * 0.97
	
	init_vertices()
	init_faces()
	init_egdes()
	
func init_vertices() -> void:
	for index in Global.dict.icosahedron.vertex.size():
		var vertex = IcosahedronVertex.new()
		vertex.index = index
		vertex.icosahedron = self
	
func init_faces() -> void:
	for indexs in Global.dict.icosahedron.face:
		var face = IcosahedronFace.new()
		face.indexs = indexs
		face.icosahedron = self
	
func init_egdes() -> void:
	for face in faces.get_children():
		for _i in face.vertices.size():
			var a = face.vertices[_i]
			var _j = (_i + 1) % face.vertices.size()
			var b = face.vertices[_j]
			var vertices = [a, b]
			vertices.sort_custom(func(a, b): return vertices.find(a) > vertices.find(b))
			
			var flag = true
			if vertex_edges.has(a):
				if vertex_edges[a].has(b):
					flag = false
			
			if flag:
				var edge = IcosahedronEdge.new()
				edge.vertices.append_array(vertices)
				edge.icosahedron = self
	
func _process(delta: float) -> void:
	rotation.y += delta * 0.
