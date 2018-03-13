/// @description Insert description here
// You can write your code in this editor
shader_set(shd_main);
u_intensity = shader_get_uniform(shd_main,"intensity");
shader_set_uniform_f(u_intensity,0.0);
draw_surface(application_surface,0,0)
shader_reset();