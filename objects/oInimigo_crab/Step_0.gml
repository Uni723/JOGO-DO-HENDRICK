// Inimigo step

if (knockback_duration > 0) {
    var knockback_direction = direction + 180; // direção oposta ao tiro
    var new_x = x + lengthdir_x(knockback_force, knockback_direction);
    var new_y = y + lengthdir_y(knockback_force, knockback_direction);

    // Verifique se a nova posição colide com uma parede ou Oparede2
    if (!place_meeting(new_x, new_y, Oparede) && !place_meeting(new_x, new_y, Oparede2)) {
        x = new_x; // Atualize a posição somente se não houver colisão
        y = new_y;
    } else {
		
        // Se houver colisão, mova o inimigo na direção do knockback até encontrar um espaço livre
        for (var i = 0; i < knockback_force; i++) {
            if (!place_meeting(x + lengthdir_x(1, knockback_direction), y + lengthdir_y(1, knockback_direction), Oparede) &&
                !place_meeting(x + lengthdir_x(1, knockback_direction), y + lengthdir_y(1, knockback_direction), Oparede2)) {
                
                x += lengthdir_x(1, knockback_direction);
                y += lengthdir_y(1, knockback_direction);
                break; // Pare ao encontrar um espaço livre
            }
        }
    }

    knockback_duration--; // diminui a duração do knockback
} else {
    // Resto do código de movimentação
    if (place_meeting(x + lengthdir_x(speed, direction), y + lengthdir_y(speed, direction), Oparede) ||
        place_meeting(x + lengthdir_x(speed, direction), y + lengthdir_y(speed, direction), Oparede2)) {
        
        direction = random(360);
    } else {
        if (random(2) < stay_still_chance) {
            is_moving = false;
        } else {
            is_moving = true;
        }

        if (is_moving) {
            var distance_to_player = point_distance(x, y, oPlayer.x, oPlayer.y);
            if (distance_to_player < 200) {
                direction = point_direction(x, y, oPlayer.x, oPlayer.y);
            }
            x += lengthdir_x(speed, direction);
            y += lengthdir_y(speed, direction);
        }
    }
}
