#ifdef GL_ES
precision mediump float;
#endif

// uniform에 대하여
// source : https://thebookofshaders.com/03/

// GPU는 많은 병렬 스레드를 관리하고 각각은 전체 이미지의 대한 한 파편을 책임지고 있다.
// 그런데 전체 이미지에 대한 데이터를 GPU는 계산할 능력이 없다.
// 그래서 CPU로부터 그 데이터를 받아와야하고 그 받아온 데이터를 GPU의 많은 병렬 스레드에
// 넘겨주어야 한다.

// 그래픽 카드의 아키텍처때문에 모든 스레드가 동일(uniform)하도록 설정이 되고 읽기전용으로 설정된다.
// 각각의 스레드는 읽을 수는 있지만 수정할 수는 데이터를 받는다.

// These inputs are called uniform and come in most of the supported types:
// float, vec2, vec3, vec4, mat2, mat3, mat4, sampler2D and samplerCube.

uniform float u_time;
uniform vec2 u_resolution;// canvas size (width, height). 높이, 너비라 vec2
uniform vec2 u_mouse;// mouse position in screen pixels. x좌표, y좌표라서 vec2

void main(){
    gl_FragColor=vec4(abs(sin(u_time)),0.,0.,1.);
    
    // 다른 내장함수를 알고 싶다면 https://thebookofshaders.com/glossary/
}