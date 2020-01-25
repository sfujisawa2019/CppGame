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
	// {-1.0�`+1.0}
	p /= size_div2.x;

	// ���S����̊p�x{-3.14�`+3.14}
	float angle = atan(p.y, p.x);

	float col;

	// �Q�b�Ŏ��������
	// [-1.0�`+1.0]
	//float w = sin(time * 3.14 - angle);
	// sin�J�[�u�̓���͈̔͂��s�����藈����
	//float w = sin(sin(time*3.14)- angle + 3.14/2.0);
	float w = cos(sin(time*3.14)- angle);
	// �O����͈̔͂Ŕg���J��Ԃ�
	// [0.0�`+1.0]
	//col = w / 2.0 + 0.5;
	// [-0.5�`+0.5]
	col = w / 2.0;
	// [0.0�`+1.0]
	col = col + 0.5;

	gl_FragColor = vec4(col,col,col,1);

	// �O������w�肳�ꂽ�F����Z
	gl_FragColor *= v_color;
}