#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main(){
    vec2 st=gl_FragCoord.xy/u_resolution;
    
    float y=.1*ceil(10.*st.x);
    
    vec3 color;
    
    if(y-.01<=st.y&&st.y<=y+.01){
        color=vec3(0.,0.,0.);
    }else{
        color=vec3(1.,1.,1.);
    }
    gl_FragColor=vec4(color,1.);
}