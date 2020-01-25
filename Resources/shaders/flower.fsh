varying vec4 v_color;//（入力）色

//（入力）図形の中心座標
uniform vec2 center;
//（入力）図形の幅、高さの半分
uniform vec2 size_div2;
//（入力）経過時間
uniform float time;

float u(float x) { return (x > 0.0) ? 1.0:0.0;}

void main()
{
	// 描画ピクセルの座標と図形の中心座標の差を計算
	// {-250～+250}
	vec2 p = gl_FragCoord.xy - center;
	// {-1.0～+1.0}
	p /= size_div2;

	// 中心からの角度{-3.14～+3.14}
	float a = atan(p.x, p.y);

	// 中心からの距離 {0.0～1.0}
	float r = length(p);

	float w = cos(3.14*time - r*2.0);

	float h = 0.5 + 0.5*cos(12.0*a - w*7.0 + r*8.0);

	float d = 0.25 + 0.75*pow(h, 1.0*r)*(0.7+0.3*w);

	float col = u(d-r) * sqrt(1.0-r/d)*r*2.5;

	col *= 1.25+0.25*cos((12.0*a-w*7.0+r*8.0)/2.0);
	col *= 1.0 - 0.35*(0.5+0.5*sin(r*30.0))*(0.5+0.5*cos(12.0*a-w*7.0+r*8.0));

	gl_FragColor = vec4(
		col,
		col-h*0.5+r*0.2+0.35*h*(1.0-r),
		col-h*r+0.1*h*(1.0-r),
		1);
	//gl_FragColor = vec4(col,col,col,1);

	// 外部から指定された色を乗算
	gl_FragColor *= v_color;
}