module JavascriptsHelper

	def stylesheet(*args)
		content_for(:head) { stylesheet_link_tag(*args) }
	end

	def javascript(*args)
		content_for(:head) { javascript_include_tag(*args) }
	end

	def field_id_for_js(f, attribute)
		"#{f.object_name}[#{attribute.to_s.sub(/\?$/,"")}]".gsub(/\]\[|[^-a-zA-Z0-9:.]/, "_").sub(/_$/, "")
	end

	def field_name_for_js(f, attribute)
		"#{f.object_name}[#{attribute.to_s.sub(/\?$/,"")}]"
	end

end