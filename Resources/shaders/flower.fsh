varying vec4 v_color;//�i���́j�F

//�i���́j�}�`�̒��S���W
uniform vec2 center;
//�i���́j�}�`�̕��A�����̔���
uniform vec2 size_div2;

void main()
{
	// �`��s�N�Z���̍��W�Ɛ}�`�̒��S���W�̍����v�Z
	// {-250�`+250}
	vec2 p = gl_FragCoord.xy - center;

	

	float col;

	// �p�x�����߂�{-3.14�`+3.14}
	float angle = atan(p.y, p.x);
	// �x���@�ɕϊ�{-180�`+180}
	float deg = degrees(angle);

	deg = abs(deg);
	// 30�x���������l�Ƃ��ēh�蕪��
	col = step(30, deg);

	// ����
	float len = length(p);
	// {0�`1}
	float col2 = len/size_div2.x;
	// �F���]
	col2 = 1 - col2;
	// ��������h�蕪��
	col2 = sign(col2);

	gl_FragColor = vec4(1,1,0,col*col2);

	// �O������w�肳�ꂽ�F����Z
	gl_FragColor *= v_color;
}