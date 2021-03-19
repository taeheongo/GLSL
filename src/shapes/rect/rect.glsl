#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float rect(vec2 size, vec2 coord){
    vec2 margin = (1.0 - size) / 2.0;

    // overwrited step : vec2 step(float edge, vec2 x)  
    vec2 bl = step(margin, coord);
    vec2 tr = step(margin, 1. - coord);

    return bl.x * bl.y * tr.x * tr.y;
}

// 사각형의 중심을 추가
float rect2(vec2 coord, vec2 center, vec2 size){
     // overwrited step : vec2 step(vec2 edge, vec2 x)  
    vec2 bl = step(center - size/2., coord);
    vec2 tr = step(1.0 - (center + size/2.), 1.-coord);

    return tr.x * tr.y * bl.x * bl.y;
}

float floorrect(vec2 coord, vec2 size, vec2 center){

    vec2 bl = step(0., floor((coord - (center - 0.5 * size)) * 10.));
    vec2 tr = step(0., floor(1.0 - (coord - (center + 0.5*size)) * 10.));

    return tr.x * tr.y * bl.x * bl.y;
}

void main(){
    vec2 coord = gl_FragCoord.xy/u_resolution;

    // overwrited step : vec2 step(vec2 edge, vec2 x)  
    // float pct = rect(vec2(0.4), coord);
	// float pct = rect2(coord, vec2(0.2, 0.3), vec2(0.3));

    float pct = floorrect(coord, vec2(0.2,0.2), vec2(0.3,0.1));

    vec3 color = vec3(pct);

    gl_FragColor = vec4(color, 1.);
}