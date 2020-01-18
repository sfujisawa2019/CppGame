varying vec4 v_color;//（入力）色

//（入力）図形の中心座標
uniform vec2 center;
//（入力）図形の幅、高さの半分
uniform vec2 size_div2;

void main()
{
	// 描画ピクセルの座標と図形の中心座標の差を計算
	// {-250～+250}
	vec2 p = gl_FragCoord.xy - center;

	

	float col;

	// 角度を求める{-3.14～+3.14}
	float angle = atan(p.y, p.x);
	// 度数法に変換{-180～+180}
	float deg = degrees(angle);

	deg = abs(deg);
	// 30度をしきい値として塗り分け
	col = step(30, deg);

	// 長さ
	float len = length(p);
	// {0～1}
	float col2 = len/size_div2.x;
	// 色反転
	col2 = 1 - col2;
	// くっきり塗り分け
	col2 = sign(col2);

	gl_FragColor = vec4(1,1,0,col*col2);

	// 外部から指定された色を乗算
	gl_FragColor *= v_color;
}