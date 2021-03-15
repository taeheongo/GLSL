// 나만의 glsl 프로그램의 시작점

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main(){
    vec2 coord = gl_FragCoord.xy/u_resolution;
    coord.x *= u_resolution.x / u_resolution.y; // 좌표에 해상도 너비 / 해상도 높이를 곱해 해상도에 따른 위치를 조정. 

	vec3 col;
  
    gl_FragColor = vec4(col, 1.);
}