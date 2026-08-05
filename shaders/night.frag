#pragma header

void main()
{
    vec4 baseColor = flixel_texture2D(bitmap, openfl_TextureCoordv);

    vec3 nightTint = vec3(0.55, 0.60, 0.85);

    vec4 finalColor = vec4(baseColor.rgb * nightTint, baseColor.a);

    gl_FragColor = finalColor;
}