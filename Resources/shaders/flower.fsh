varying vec4 v_color;//入力（色）

//(入力)図形の中心座標
uniform vec2 center;
//(入力)図形のサイズの半分
uniform vec2 size_div2;
//(入力)経過時間
uniform float time;

float u(float x) { return (x>0.0)?1.0:0.0; }

void main()
{
	float col;
	float ax=step(0,sin(12.5f*gl_FragCoord.x))*0.5;
	float ay=step(0,sin(12.5f*gl_FragCoord.y))*0.5;
	float b=fract(ax+ay)*2;
	float c=sin(time*3.14-(ax+ay)*3.14);
	float d=b+(c/2.0+0.5);
	col=d;
	
	// 最終的な色の決定
	gl_FragColor = vec4(col, col, col, 1);

}