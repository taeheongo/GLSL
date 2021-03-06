#ifdef GL_ES
precision mediump float;
#endif

#define TWO_PI 6.28318530718
#define PI 3.14159265359

uniform vec2 u_resolution;
uniform float u_time;

//  Function from Iñigo Quiles
//  https://www.shadertoy.com/view/MsS3Wc
vec3 hsb2rgb( in vec3 c ){
    vec3 rgb = clamp(abs(mod(c.x*6.0+vec3(0.0,4.0,2.0),
                             6.0)-3.0)-1.0,
                     0.0,
                     1.0 );
    rgb = rgb*rgb*(3.0-2.0*rgb);
    return c.z * mix( vec3(1.0), rgb, c.y);
}

// 매개변수 앞에 in은 qualifier라 한다.
// in을 쓰면 main함수에서 col을 가리키게 되는 것이 아니라
// main함수의 col을 깊은복사한다.
void plus(in vec3 col){ 
    col = col + .5;
}

// inout을 쓰면 main의 col을 가리키는 얕은복사를 한다.
// 따라서 main의 col의 값이 바뀐다.
void plus2(inout vec3 col){
	col = col + .5;	 	   
}

// out을 쓰면 main에서 정의 되어 있던 col을 가리키되, 할당된 값을 무시하고
// default값  vec3(.0)으로 초기화한 후 계산한 값을 main의 col에 할당한다.
void plus3(out vec3 col){
	col = col + .5;	 	   
}

void main(){
	vec3 col = vec3(.5);
    // plus(col);
    // plus2(col);
    plus3(col);
    gl_FragColor = vec4(col, 1.);
}