#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main(){
    vec2 st=gl_FragCoord.xy/u_resolution;
    vec3 color=vec3(0.,0.,0.);
    
    // color.r = 1.0; // making color red
    /*
    꼭 (r,g,b,a)로 쓸 필요는 없다. (0,1,2,3), (x,y,z,w)로 가능.
    
    vec4 vector;
    vector[0] = vector.r = vector.x = vector.s;
    vector[1] = vector.g = vector.y = vector.t;
    vector[2] = vector.b = vector.z = vector.p;
    vector[3] = vector.a = vector.w = vector.q;
    */
    
    vec3 yellow,magenta,green;
    
    // Making Yellow
    yellow.rg=vec2(1.);// Assigning 1. to red and green channels
    yellow[2]=0.;// Assigning 0. to blue channel
    
    // Making Magenta
    magenta=yellow.rbg;// Assign the channels with green and blue swapped
    
    // Making Green
    // rgb로해도 되고 bgb, bgr, ... 내가 하고싶은 순서대로 하면된다.
    green.rgb=yellow.bgb;// Assign the blue channel of Yellow (0) to red and blue channels
    
    gl_FragColor=vec4(green,1.);
}