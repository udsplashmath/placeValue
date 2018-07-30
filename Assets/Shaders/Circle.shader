Shader "Custom/Circle" {
    Properties {
        _Color ("Color", Color) = (1, 1, 1, 1)
        _MainTex ("Texture", 2D) = "white" {}
    }

    SubShader {
        Tags {"Queue"="Transparent" "IgnoreProjector"="True" "RenderType"="Transparent"}
        ZWrite Off
        Blend SrcAlpha OneMinusSrcAlpha

        Pass {
            CGPROGRAM
            #include "UnityCG.cginc"

            #pragma vertex vert_img
            #pragma fragment frag
            #pragma target 3.0

            float4 _Color;
            sampler2D _MainTex;


            float4 frag(v2f_img i): SV_TARGET {
                return tex2D(_MainTex, i.uv);
            }
            ENDCG
        }
    }
}
