#ifdef GL_ES
precision mediump float;
#endif

// glsl프로그램의 기본 구조
// source : https://thebookofshaders.com/02/

vec3 red(){
    return vec3(1.,0.,0.);
}

vec3 green(){
    return vec3(0.,1.,0.);
}

// glsl은 main()를 가지고 있다.
void main(){
    // vec2, vce3, vec4는 데이터 타입임. vec2(float, float)
    
    // float f =1; 형변환 안됨.
    float f=1.;
    // gl_FragColor = vec4(red(),0.7); // 가능
    gl_FragColor=vec4(vec3(1.,1.,1.),1.);// 미리 내장된 전역변수
}
