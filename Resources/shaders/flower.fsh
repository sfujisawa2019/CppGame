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

	// １．gl_FragCoord.xyとcenterの距離
	// 又はpベクトルの長さでcolの数値を決める
	float len = length(p);
	// ２．最大値(size_div2の長さ)で割る
	// colにいれる
	col = len / size_div2.x;

	// {-1.0～+1.0}
	//col = p.y / size_div2.y;
	// 絶対値を取る{1.0～0.0～1.0}
	//col = abs(col);
	// 白黒反転{0.0～1.0～0.0}
	col = 1.0f - col;
	// 大きさを無視する
	//col = sign(col);
	// ０より大きければ１にする
	col = step(0.00001, col);

	// 色を決定
	gl_FragColor = vec4(col, col, col, 1);

	// 外部から指定された色を乗算
	gl_FragColor *= v_color;
}