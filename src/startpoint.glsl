// 나만의 glsl 프로그램의 시작점

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main(){
    vec2 coord = gl_FragCoord.xy/u_resolution;
	vec3 col;
  
    gl_FragColor = vec4(col, 1.);
}