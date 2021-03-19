#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

// 사각형의 중심을 추가
float floorrect(vec2 coord, vec2 size, vec2 center){
    vec2 bl = floor((coord-size/2.) * 10.);
    vec2 tr = floor(*10.);

    // return tr.x * tr.y * bl.x * bl.y;
    return bl.x * bl.y;
    return tr.x * tr.y;
}

void main(){
    vec2 coord = gl_FragCoord.xy/u_resolution;

    float pct = floorrect(coord, vec2(0.3));

	vec3 col = vec3(pct);
  
    gl_FragColor = vec4(col, 1.);
}