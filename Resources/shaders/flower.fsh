varying vec4 v_color;//�i���́j�F

void main()
{
//                          R           G  B  A
	gl_FragColor = vec4(gl_FragCoord.x, 0, 0, 1);

	// �O������w�肳�ꂽ�F����Z
	gl_FragColor *= v_color;
}