#version 300 es
precision mediump float;

in vec2 v_texcoord;
uniform sampler2D tex;
out vec4 fragColor;

void main() {
    vec4 this_colour = texture(tex, v_texcoord);
    float new_colour = (this_colour.r + this_colour.g + this_colour.b) / 3.0;
    fragColor = vec4(new_colour, new_colour, new_colour, this_colour.a);
}
