#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float bar(vec2 loc, vec2 size, vec2 coord){
    vec2 sw = loc -size/2.;
    vec2 ne = loc + size/2.;
    
    vec2 rect = step(sw, coord) - step(ne, coord);
    
    return rect.x * rect.y;
}

float cross(vec2 loc, vec2 size, vec2 coord){
 	float b1 = bar(loc, size, coord);
    float b2 = bar(loc, size.yx, coord);
    
    return max(b1, b2);
}

void main(){
    vec2 coord = gl_FragCoord.xy/u_resolution;
    coord.x *= u_resolution.x / u_resolution.y;
    
    // coord -= .5;
    coord = coord *2. -1.;
    float rad = 0.5;
    
    // 원의 중심을 바꿔주는 방법
	// vec2 loc = vec2(0);
	// coord += vec2(sin(u_time)*rad, cos(u_time)*rad); 
    

    // 실제 원의 중심을 바꿔주는 방법
    vec2 loc = vec2(0.) + vec2(sin(u_time)*rad, cos(u_time)*rad); 
    vec3 col = vec3(cross(loc, vec2(0.30, 0.020), coord));
    
    gl_FragColor = vec4(col, 1.);
}