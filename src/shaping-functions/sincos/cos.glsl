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
    
    float y=.5*cos((st.x)*PI*4.)+.5;
    // st.x는 0~1사이의 값이므로 주기가 2pi인 cos그래프의 주기를 1로 만들어야 한다.
    // st.x에 2.0*pi를 해서 주기를 1로 만든다.
    // 0.5로 scale down을하고 +0.5만큼 평행이동한다.
    
    vec3 color=vec3(0.,0.,0.);
    float pct=plot(st,y);
    color=(1.-pct)*color+pct*vec3(0.,1.,0.);
    
    gl_FragColor=vec4(color,1.);
}