#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

// HSB란 (Hue(색조), Saturation(채도), Brightness(명도))로 구성된 색 표현법.
// Hue(색조)는 0~360 사이의 숫자.(단위 도. Ex) 빨간색 0도, 녹색 0도, 파란색 240도)
// Saturation(채도)는 0~100 사이의 숫자.(백분율)
// Brightness(명도)는 0~100 사이의 숫자.(백분율)

vec3 rgb2hsb( in vec3 c ){
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz),
                 vec4(c.gb, K.xy),
                 step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r),
                 vec4(c.r, p.yzx),
                 step(p.x, c.r));
    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)),
                d / (q.x + e),
                q.x);
}

//  Function from Iñigo Quiles
//  https://www.shadertoy.com/view/MsS3Wc
vec3 hsb2rgb( in vec3 c ){
    vec3 rgb = clamp(abs(mod(c.x*6.0+vec3(0.0,4.0,2.0),
                             6.0)-3.0)-1.0,
                     0.0,
                     1.0 );
    rgb = rgb*rgb*(3.0-2.0*rgb);
    return c.z * mix(vec3(1.0), rgb, c.y);
}

void main(){
    vec2 st=gl_FragCoord.xy/u_resolution;
    vec3 color=vec3(0.);

    // We map x (0.0 - 1.0) to the hue (0.0 - 1.0)
    // And the y (0.0 - 1.0) to the brightness
    color=hsb2rgb(vec3(st.x, 1., st.y));
    // st.x가 0도일 때 빨간색 에서 360도가 되니 다시 빨간색이 된다.
    // st.y에 따라 밝기 brgihtness가 변한다.

    gl_FragColor=vec4(color,1.);
}