#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

// a = 0.5*((x<0.5)?x:1.0-x))^k
// (x<0.5)?a:1.0-a

float gain(float x,float k)
{
    float a=.5*pow(2.*((x<.5)?x:1.-x),k);
    return(x<.5)?a:1.-a;
}

void main(){
    vec2 st=gl_FragCoord.xy/u_resolution;
    
    float y=gain(st.x,.1);// k<1 produces the classic gain() shape,
    // float y=gain(st.x, 0.5); // The curves are symmetric (and inverse) for k=a and k=1/a.
    // 예를 들어, k=2일때와 k=1/2일때는 커브가 대칭+역이다.
    // float y=gain(st.x, 1.); // k=1 is the identity curve
    // float y=gain(st.x, 2.0); // k>1 produces "s" shaped curces
    
    vec3 color;
    
    if(y-.01<=st.y&&st.y<=y+.01){
        color=vec3(0.,0.,0.);
    }else{
        color=vec3(1.,1.,1.);
    }
    gl_FragColor=vec4(color,1.);
}

