shader_type canvas_item;


void fragment() {
	// Pixelate the texture
	vec2 uv = UV;
	vec2 pixel = vec2(1.0 / UV.x, 1.0 / UV.y);
	uv = floor(uv / pixel) * pixel;
	COLOR = texture(TEXTURE, uv);
	
}