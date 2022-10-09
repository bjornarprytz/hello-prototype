shader_type canvas_item;

uniform float size_x = 64.0; // blocks by x direction
uniform float size_y = 64.0; // blocks by y direction
uniform float blur_diameter = 2.1; // around 2.2 is usually good
uniform float roundness = 0.1; // [0.0 - 1.0] Lower values make the corners more rounded

void fragment() {
	// Scale the range
	vec2 d = (UV * blur_diameter);
	// Center the range around (0,0)
	d -= blur_diameter / 2.0;

	float ax = 1.0 - (d.x * d.x);
	float ay = 1.0 - (d.y * d.y);
	float alpha = (min(ax, ay) + (max(ax, ay) * roundness));
	
    float x = floor(UV.x * size_x) / (size_x - 1.0);
    float y = floor(UV.y * size_y) / (size_y - 1.0);
    vec2 color = vec2(x, y);

    COLOR.rgb = texture(TEXTURE, color).rgb;
	COLOR.a = alpha;
}