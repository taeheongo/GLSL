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
    vec3 rgb = clamp(abs(mod(c.x*6.0+vec3(0.0,4.0,2.0),6.0)-3.0)-1.0,0.0,1.0 );
    rgb = rgb*rgb*(3.0-2.0*rgb);
    return c.z * mix( vec3(1.0), rgb, c.y);
}

void main(){
    vec2 coord = gl_FragCoord.xy/u_resolution;
    coord = coord*2.-1.; // 원점이 화면중앙으로 이동.
    
    float angle =atan(coord.y, coord.x);
    angle += PI;
    angle /= 2.*PI;
 	
    float dist = length(coord);
    
    vec3 color = hsb2rgb(vec3(angle, dist, 1.));
    
    gl_FragColor = vec4(color, 1.);
}