varying vec4 v_color;//�i���́j�F

//�i���́j�}�`�̒��S���W
uniform vec2 center;
//�i���́j�}�`�̕��A�����̔���
uniform vec2 size_div2;
//�i���́j�o�ߎ���
uniform float time;

float u(float x) { return (x > 0.0) ? 1.0:0.0;}

void main()
{
	// �`��s�N�Z���̍��W�Ɛ}�`�̒��S���W�̍����v�Z
	// {-250�`+250}
	vec2 p = gl_FragCoord.xy - center;
	// {-1.0�`+1.0}
	p /= size_div2;

	// ���S����̊p�x{-3.14�`+3.14}
	float a = atan(p.x, p.y);

	// ���S����̋��� {0.0�`1.0}
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

	// �O������w�肳�ꂽ�F����Z
	gl_FragColor *= v_color;
}