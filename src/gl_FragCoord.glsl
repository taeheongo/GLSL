// gl_FragCooor
// source : https://thebookofshaders.com/03/

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

/*
In the same way GLSL gives us a default output, vec4 gl_FragColor,
it also gives us a default input, vec4 gl_FragCoord, which holds
the screen coordinates of the pixel or screen fragment that the
active thread is working on.
*/
void main(){
    // 쓰레드마다 이 코드(shader)가 실행되고 쓰레드가 책임지고 있는 pixel 또는 screen fragment에 해당하는 좌표
    // (gl_FragCoord.xy)를 u_resolution으로 나눈값이 st.
    // st값에 따라서 gl_FragColor가 달라지게 된다.
    vec2 st=gl_FragCoord.xy/u_resolution;
    gl_FragColor=vec4(st.x,st.y,0.,1.);
}