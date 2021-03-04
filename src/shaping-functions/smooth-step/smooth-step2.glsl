#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

// smooth-step에서 edge0가 edge1보다 크다면?
// source : https://thebookofshaders.com/glossary/?search=smoothstep

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float plot(vec2 st,float pct){
    return smoothstep(pct-.02,pct,st.y)-
    smoothstep(pct,pct+.02,st.y);
}

void main(){
    vec2 st=gl_FragCoord.xy/u_resolution;
    
    // smoothstep 함수는 3차함수이고, edge1 > edge0 일때,
    // st.x가 edge0 ~ edge1구간에서 중점 ((edge1 - edge0)/2, (edge1 - edge0)/2)에 대하여 대칭이다.
    // edge1과 edge0을 바꾸면 여기서는 smoothstep(0.0, 1.0, st.x)가 아니라
    // smoothstep(1.0, 0.0, st.x)이면 (0.5, 0.5)에 대하여 대칭이 된다.
    float y=smoothstep(1.,0.,st.x);
    
    vec3 color=vec3(y);
    
    float pct=plot(st,y);
    color=(1.-pct)*color+pct*vec3(0.,1.,0.);
    
    gl_FragColor=vec4(color,1.);
}