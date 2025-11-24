Shader "Custom/BumpedDiffuse"
{
    Properties
    {
        _myTex ("Example Texture", 2D) = "white" {}
        _myBump ("Bump Texture", 2D) = "bump" {}
        _bumpScale ("Bump Scale", Range(1,10)) = 1
        _texScale ("Tex Scale", Range(1,10)) = 1
    }
    SubShader
    {

        CGPROGRAM
        
        #pragma surface surf  Lambert

        sampler2D _myTex;
        sampler2D _myBump;
        float _bumpScale;
        float _texScale;

        struct Input
        {
            float2 uv_myTex;
            float2 uv_myBump;
        };

    

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_myTex, IN.uv_myTex * _texScale).rgb;
            o.Normal = UnpackNormal(tex2D(_myBump, IN.uv_myBump * _texScale));
            o.Normal.xy *= _bumpScale;            
        }
        ENDCG
    }
    FallBack "Diffuse"
}
