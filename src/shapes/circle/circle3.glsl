 #ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

#define PI 3.14159265359

void main(){
    vec2 coord = gl_FragCoord.xy/u_resolution;
    coord = coord*2. -1.;
    coord.x *= u_resolution.x / u_resolution.y;
    
    float a = atan(coord.y, coord.x);
    float d = length(coord);
    
    a+=u_time;
    a*=3.0;
    
    float r = sin(a);
    
    vec3 col = vec3(step(r, d));
    
    gl_FragColor = vec4(col, 1.);
}