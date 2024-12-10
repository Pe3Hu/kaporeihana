@tool
class_name IcosahedronFace extends MeshInstance3D


@export var icosahedron: Icosahedron:
	set(icosahedron_):
		icosahedron = icosahedron_
		
		init_mesh()
		icosahedron.faces.add_child(self)

var indexs: Array
var vertices: Array[IcosahedronVertex]


func init_mesh() -> void:
	var hue = float(Global.dict.icosahedron.face.find(indexs)) / Global.dict.icosahedron.face.size()
	var color = Color.from_hsv(hue, 1.0, 1.0)
	
	var st = SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	st.set_color(color)
	st.set_uv(Vector2(0, 0))
	
	var material = StandardMaterial3D.new()
	material.vertex_color_use_as_albedo = true
	st.set_material(material)
	
	for index in indexs:
		var vertex = icosahedron.vertices.get_child(index)
		vertices.append(vertex)
		st.add_vertex(vertex.position)
	
	mesh = st.commit()
