varying vec4 v_color;//（入力）色

void main()
{
//                          R           G  B  A
	gl_FragColor = vec4(gl_FragCoord.x, 0, 0, 1);

	// 外部から指定された色を乗算
	gl_FragColor *= v_color;
}