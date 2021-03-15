#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float rect(vec2 loc, vec2 size, vec2 coord){
    vec2 sw = loc - size/2.;
    vec2 ne = loc + size/2.;
    
    float pad = 0.01;
    vec2 ret = smoothstep(sw-pad, sw, coord) 
        - smoothstep(ne, ne+pad, coord);
    
    return ret.x* ret.y;
}

float cross(vec2 loc, vec2 size, vec2 coord){
    float r1 = rect(loc, size, coord);
    float r2 = rect(loc, size.yx, coord);
    
    return max(r1, r2);
}

mat2 rotate2d(float _angle){
    return mat2(cos(_angle), -sin(_angle),
               sin(_angle), cos(_angle));
}

void main(){
    vec2 coord = gl_FragCoord.xy/u_resolution;
    coord = coord*2. -1.;
    coord.x *= u_resolution.x / u_resolution.y;
    
    coord *= 2.;
    
    coord *= rotate2d(sin(u_time));
    
	vec3 col = vec3(cross(vec2(.0), vec2(.550, .070), coord));
    gl_FragColor = vec4(col, 1.);
}