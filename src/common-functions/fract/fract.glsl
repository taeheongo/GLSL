#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main(){
    vec2 st=gl_FragCoord.xy/u_resolution;
    
    float y=fract(st.x*10.)*.1+.5;
    // fract(x)는 x를 1.0으로 나눈 나머지.
    // fract(x)는 mod(x, 1.0)과 동일하다.
    // 여기서는 x* 10을 해주면 주기가 0.1이 되고 평행이동 + 0.5만큼 평행이동해주면 된다.
    
    // float y = mod(st.x, 0.1) + 0.5; // 이 코드와 같은 결과가 나온다.
    
    vec3 color;
    
    if(y-.01<=st.y&&st.y<=y+.01){
        color=vec3(0.,0.,0.);
    }else{
        color=vec3(1.,1.,1.);
    }
    gl_FragColor=vec4(color,1.);
}