shader_type canvas_item;

uniform float size_x = 64.0; // blocks by x direction
uniform float size_y = 64.0; // blocks by y direction



void fragment() {
	float x_d = (UV.x * 2.2) - 1.1;
	float y_d = (UV.y * 2.2) - 1.1;
	
	float xalpha = 1.0 - (x_d * x_d);
	float yalpha = 1.0 - (y_d * y_d);
	float alpha = min(xalpha, yalpha) + (max(xalpha, yalpha) * 0.25);
	
    float x = floor(UV.x * size_x) / (size_x - 1.0);
    float y = floor(UV.y * size_y) / (size_y - 1.0);
    vec2 color = vec2(x, y);

    COLOR.rgb = texture(TEXTURE, color).rgb;
	COLOR.a = alpha;
}