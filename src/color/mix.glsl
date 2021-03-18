#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

vec3 colorA=vec3(.149,.141,.912);
vec3 colorB=vec3(1.,.833,.224);

void main(){
    vec3 color=vec3(0.);
    
    float pct= abs(sin(u_time));
    
    // 두 가지 색의 t에 대한 interpolation.
    // color = pct * colorB + (1. - pct) * colorA;
    
    // Mix uses pct(a value fom 0-1) to mix the two colors
    // 그게 mix임.
    color = mix(colorA, colorB, pct);
    
    vec2 st = gl_FragCoord.xy / u_resolution.xy;
    vec3 pct2 = vec3(st.x);
    // pct2는 vec3타입이다. colorA와 colorB의 r,g,b값이 각각 pct에 따라서
    // interpolation된다.
    vec3 color2 = mix(colorA, colorB, pct2);
    
    gl_FragColor=vec4(color2, 1.);
}