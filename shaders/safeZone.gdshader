shader_type spatial;
//
//void vertex() {
	//// Called for every vertex the material is visible on.
//}
//
//void fragment() {
	//// Called for every pixel the material is visible on.
//}
//
////void light() {
////	// Called for every pixel for every light affecting the material.
////	// Uncomment to replace the default light processing function with this one.
////}

render_mode blend_mix, cull_disabled, unshaded;

uniform vec4 safe_color : source_color = vec4(0.0, 1.0, 0.0, 0.15); // faint green
uniform vec4 border_color : source_color = vec4(0.0, 1.0, 0.0, 1.0); // bright green
uniform float border_thickness : hint_range(0.0, 0.5) = 0.1; // thickness of border
uniform float glow_strength : hint_range(0.0, 2.0) = 1.2; // glow boost
uniform float pulse_speed : hint_range(0.1, 5.0) = 1.0;   // speed of pulsing
uniform float pulse_intensity : hint_range(0.0, 1.0) = 0.2; // how much border expands/contracts

void fragment() {
    // Normalized position inside sphere (local to mesh)
    vec3 pos = normalize(VERTEX);
    float dist = length(VERTEX);

    // Pulsing factor (oscillates 0 → 1)
    float pulse = (sin(TIME * pulse_speed) * 0.5 + 0.5) * pulse_intensity;

    // Distance-based border effect
    float edge = smoothstep(1.0, 1.0 - border_thickness - pulse, dist);

    // Base fill
    vec3 col = safe_color.rgb;
    float alpha = safe_color.a;

    // Blend border on top with pulse
    col = mix(col, border_color.rgb * glow_strength, edge);
    alpha = mix(alpha, border_color.a, edge);

    ALBEDO = col;
    ALPHA = alpha;
}
