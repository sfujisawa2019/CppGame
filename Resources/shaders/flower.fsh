varying vec4 v_color;//�i���́j�F

//�i���́j�}�`�̒��S���W
uniform vec2 center;

void main()
{
	// �`��s�N�Z���̍��W�Ɛ}�`�̒��S���W�̍����v�Z
	vec2 p = gl_FragCoord.xy - center;

	float col;

	col = p.x / 250;

	gl_FragColor = vec4(col, col, col, 1);

	// �O������w�肳�ꂽ�F����Z
	gl_FragColor *= v_color;
}