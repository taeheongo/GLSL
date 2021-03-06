#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float plot(vec2 st,float pct){
    float span=.05;
    
    return smoothstep(pct-span,pct,st.y)-
    smoothstep(pct,pct+span,st.y);
}

void main(){
    vec2 st=gl_FragCoord.xy/u_resolution;
    
    // Smooth interpolation between 0.1 and 0.9
    float y=st.x;
    
    vec3 color=vec3(y);
    
    float pct=plot(st,y);
    color=(1.-pct)*color+pct*vec3(0.,1.,0.);
    
    gl_FragColor=vec4(color,1.);
}