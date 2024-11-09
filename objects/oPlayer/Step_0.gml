if patrick == 3 {
    room_goto_next();
}

// Atualiza a direção do mouse
var mouse_dir = point_direction(x, y, mouse_x, mouse_y);
if (mouse_dir > 90 && mouse_dir < 270) {
    image_xscale = -1.5;
} else {
    image_xscale = 1.5;
}

// Animação do jogador
if (keyboard_check(ord("W")) || keyboard_check(ord("S")) || keyboard_check(ord("A")) || keyboard_check(ord("D"))) {
    if (sprite_index != sCorrendo) {
        sprite_index = sCorrendo;
    }
    move_dir = point_direction(0, 0, (keyboard_check(ord("D")) - keyboard_check(ord("A"))), (keyboard_check(ord("S")) - keyboard_check(ord("W"))));
} else {
    if (sprite_index != sPlayer) {
        sprite_index = sPlayer;
    }
}

// Calcula a velocidade
velh = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) * max_vel;
velv = (keyboard_check(ord("S")) - keyboard_check(ord("W"))) * max_vel;

if (keyboard_check(ord("W")) || keyboard_check(ord("S")) || keyboard_check(ord("A")) || keyboard_check(ord("D"))) {
    vel = max_vel;
} else {
    vel = lerp(vel, 0, 0.1);
}

velh = lengthdir_x(vel, move_dir);
velv = lengthdir_y(vel, move_dir);

// Verifica a colisão com Oparede e Oparede2
if (!place_meeting(x + velh, y, Oparede) && !place_meeting(x + velh, y, Oparede2)) {
    x += velh; // Move na horizontal
}
if (!place_meeting(x, y + velv, Oparede) && !place_meeting(x, y + velv, Oparede2)) {
    y += velv; // Move na vertical
}

// Atualiza a arma e efeito de dano
usa_arma();
