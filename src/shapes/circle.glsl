#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

vec3 circle(vec2 coord, vec2 loc, float r){
    float d;
    // d = distance(coord, loc); // 중심으로부터 방사형 원
    d = length(coord-loc); // length가 성능이 좀 더 좋다.
    
    // d = step(r, d); // d가 r보다 크면 1, 아니면 0
    
    // step을 쓰면 pixel단위로 d가 r을 비교하는데
    // smoothstep을 쓰면 d가 r에 근접한 부분에서 0에서 1로 바로 바뀌지않고
    // 0에서 1까지 3차곡선의 형태로 바뀌게 된다.
    d = smoothstep(r, r+0.001, d);
    return vec3(d);
}

void main(){
    vec2 coord = gl_FragCoord.xy / u_resolution;
   vec3 color = circle(coord, vec2(0.5), 0.25); 
    
	gl_FragColor = vec4(color, 1.);
}