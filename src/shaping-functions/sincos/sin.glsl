#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main(){
    vec2 st=gl_FragCoord.xy/u_resolution;
    
    // float y=.5*sin((st.x)*PI*2.)+.5; // 그래프 원형
    float y=.5*sin((st.x+u_time)*PI*2.)+.5;
    
    // st.x는 0~1사이의 값이므로 주기가 2pi인 sin그래프의 주기를 1로 만들어야 한다.
    // st.x에 2.0*pi를 해서 주기를 1로 만든다.
    // 0.5로 scale down을하고 y축방향으로 +0.5만큼 평행이동한다.
    // 그래프를 왼쪽을 보내려면 x축 방향으로 -u_time만큼 이동한다.
    
    vec3 color;
    
    if(y-.01<=st.y&&st.y<=y+.01){
        color=vec3(0.,0.,0.);
    }else{
        color=vec3(1.,1.,1.);
    }
    gl_FragColor=vec4(color,1.);
}