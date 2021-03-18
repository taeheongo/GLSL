#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float plot(vec2 st, float pct){
    return smoothstep(pct - 0.02, pct, st.y) - smoothstep(pct, pct+0.02, st.y);
}

// sign() 
// returns -1.0 if x is less than 0.0,
//  0.0 if x is equal to 0.0,
//  and +1.0 if x is greater than 0.0.

void main(){
    vec2 st=gl_FragCoord.xy/u_resolution;
    
    float y = 0.5 * sign(st.x - .5) + .5;
    
    vec3 color = vec3(y);
    
    float pct = plot(st, y);

    color = pct*vec3(0., 1., 0.) + (1. - pct)*color;

    gl_FragColor=vec4(color,1.);
}