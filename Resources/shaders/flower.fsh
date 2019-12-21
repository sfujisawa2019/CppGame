varying vec4 v_color;//（入力）色

//（入力）図形の中心座標
uniform vec2 center;

void main()
{
	// 描画ピクセルの座標と図形の中心座標の差を計算
	vec2 p = gl_FragCoord.xy - center;

	float col;

	col = p.x / 250;

	gl_FragColor = vec4(col, col, col, 1);

	// 外部から指定された色を乗算
	gl_FragColor *= v_color;
}