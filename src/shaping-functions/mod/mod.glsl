#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main(){
    vec2 st=gl_FragCoord.xy/u_resolution;
    
    float y=mod(st.x,.1)+.5;
    // 나머지 연산자 mod는 x값을 두번째 인자로 나눈 나머지를 return
    // st.x는 0~1이므로 0.1로 나눈 나머지를 표현하게 되고,
    // 0.1단위의 단위 mod함수가 10개 만들어지게 된다.
    
    vec3 color;
    
    if(y-.01<=st.y&&st.y<=y+.01){
        color=vec3(0.,0.,0.);
    }else{
        color=vec3(1.,1.,1.);
    }
    gl_FragColor=vec4(color,1.);
}