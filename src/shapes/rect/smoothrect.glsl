// 나만의 glsl 프로그램의 시작점

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float smoothrect(vec2 size, vec2 coord){
    float span = 0.02;

    vec2 gap = (1.0 - size) / 2.0;

    // overwrited smoothstep : 
    //      vec2 smoothstep(vec2 edge0, vec2 edge1, vec2 x)  
    vec2 bl = smoothstep(vec2(gap), vec2(gap + span), coord);
    vec2 tr = smoothstep(vec2(gap), vec2(gap + span), 1.0 - coord);

    return bl.x * bl.y * tr.x * tr.y;
}

void main(){
    vec2 coord = gl_FragCoord.xy/u_resolution;

    float pct = smoothrect(vec2(0.5), coord);

    vec3 color = vec3(pct);
  
    gl_FragColor = vec4(color, 1.);
}