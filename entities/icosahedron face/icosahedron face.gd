@tool
class_name IcosahedronFace extends MeshInstance3D



func set_vertices_and_color(vertices_: Array, color_: Color) -> void:
	var st = SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	st.set_color(color_)
	st.set_uv(Vector2(0, 0))
	
	var material = StandardMaterial3D.new()
	material.vertex_color_use_as_albedo = true
	st.set_material(material)
	
	for vertex in vertices_:
		st.add_vertex(vertex)
	
	mesh = st.commit()
