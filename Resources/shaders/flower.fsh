varying vec4 v_color;//�i���́j�F

//�i���́j�}�`�̒��S���W
uniform vec2 center;
//�i���́j�}�`�̕��A�����̔���
uniform vec2 size_div2;
//�i���́j�o�ߎ���
uniform float time;

void main()
{
	// �`��s�N�Z���̍��W�Ɛ}�`�̒��S���W�̍����v�Z
	// {-250�`+250}
	vec2 p = gl_FragCoord.xy - center;

	float col;

	col = time / 5;

	gl_FragColor = vec4(col,col,col,1);

	// �O������w�肳�ꂽ�F����Z
	gl_FragColor *= v_color;
}