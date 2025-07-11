uniform float uTime;
uniform sampler2D uPerlinTexture;
varying vec2 vUv;

void main()
{

    //scale and animate
    vec2 smokeUv = vUv;
    smokeUv.x += 0.3;
    smokeUv.y += 0.5;
    smokeUv.y -= uTime * 0.03;

    //smoke
    float smoke = texture(uPerlinTexture, smokeUv).r;
    

    //Remap
    smoke = smoothstep(0.4, 1.0, smoke);
    
    //Edge
   
    smoke *= smoothstep(0.0, 0.2, vUv.x);
    smoke *= 1.0 - smoothstep(0.8, 0.2, vUv.x);
    smoke *= smoothstep(0.0, 0.1, vUv.y);
    smoke *= smoothstep(1.0, 0.4, vUv.y);

   gl_FragColor = vec4( 0.6, 0.3, 0.2, smoke); // solid green
    #include <tonemapping_fragment>
    #include <colorspace_fragment>
}