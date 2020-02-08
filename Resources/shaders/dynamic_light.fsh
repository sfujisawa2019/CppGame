varying vec4 v_color;//入力（色）
varying vec2 v_texCoord;

//(入力)図形の中心座標
uniform vec2 center;
//(入力)図形のサイズの半分
uniform vec2 size_div2;
//(入力)経過時間
uniform float time;

uniform sampler2D sampler;

float u(float x) { return (x>0.0)?1.0:0.0; }

void main()
{
	// 加工の為にUV座標をコピー
	vec2 texCoord = v_texCoord;
	

	float col;
	float ax=step(0,sin(12.5f*gl_FragCoord.x))*0.5;
	float ay=step(0,sin(12.5f*gl_FragCoord.y))*0.5;
	float b=fract(ax+ay)*2;
	float c=sin(time*3.14-(ax+ay)*3.14);
	float d=b+(c/2.0+0.5);
	col=d;

	// UV座標をずらす
	texCoord.y += c;
	// ずらしたUV座標でテクスチャから色を取り出す
	vec4 texcolor = texture2D(sampler, texCoord);
	
	// 最終的な色の決定
	gl_FragColor = vec4(col, col, col, 1) * texcolor;

	//gl_FragColor = texcolor * v_color;

}