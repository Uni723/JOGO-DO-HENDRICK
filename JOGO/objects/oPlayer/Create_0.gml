
velh = 0;
velv = 0;
max_vel = 6;
vel = 0;
move_dir = 0;
dano = false;
patrick = 0;


arma = instance_create_layer(x, y, "Instances", oMao);

usa_arma = function() {
	
    if (arma) {
        var _fire = mouse_check_button(mb_left);
        arma.atirar = _fire;

        // Calcula a direção do jogador para o mouse
        var _dir = point_direction(x, y, mouse_x, mouse_y);
        
        // Ajusta a distância da arma para ficar colada ao jogador
        var distance = sprite_width / 20; // Ajuste conforme necessário
        
        // Calcula a nova posição da arma
        var _x = x + lengthdir_x(distance * image_xscale, _dir);
        var _y = y + lengthdir_y(distance * image_xscale, _dir);
        
        // Atualiza a posição da arma
        arma.x = _x;
        arma.y = _y;
        
        // Atualiza o ângulo da arma para o mesmo ângulo que o jogador
        if (image_xscale < 0) {
            arma.image_angle = _dir + 180; // Adiciona 180 graus para virar a arma para a esquerda
        } else {
            arma.image_angle = _dir; // Mantém o ângulo normal
        }
        
        // Ajusta a escala da arma com base na escala do jogador
        arma.image_xscale = 1.2 * image_xscale; // Inverte a escala horizontal da arma
        arma.image_yscale = 2; // Ajusta a escala vertical da arma (ajuste conforme necessário)
    }
}
