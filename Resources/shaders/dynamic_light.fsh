varying vec4 v_color;//���́i�F�j
varying vec2 v_texCoord;

//(����)�}�`�̒��S���W
uniform vec2 center;
//(����)�}�`�̃T�C�Y�̔���
uniform vec2 size_div2;
//(����)�o�ߎ���
uniform float time;

uniform sampler2D sampler;

float u(float x) { return (x>0.0)?1.0:0.0; }

void main()
{
	// ���H�ׂ̈�UV���W���R�s�[
	vec2 texCoord = v_texCoord;
	

	float col;
	float ax=step(0,sin(12.5f*gl_FragCoord.x))*0.5;
	float ay=step(0,sin(12.5f*gl_FragCoord.y))*0.5;
	float b=fract(ax+ay)*2;
	float c=sin(time*3.14-(ax+ay)*3.14);
	float d=b+(c/2.0+0.5);
	col=d;

	// UV���W�����炷
	texCoord.y += c;
	// ���炵��UV���W�Ńe�N�X�`������F�����o��
	vec4 texcolor = texture2D(sampler, texCoord);
	
	// �ŏI�I�ȐF�̌���
	gl_FragColor = vec4(col, col, col, 1) * texcolor;

	//gl_FragColor = texcolor * v_color;

}