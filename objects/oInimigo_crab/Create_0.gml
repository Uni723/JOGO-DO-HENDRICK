event_inherited();
vida_max = 3;
vida_atual = vida_max;
speed = 1.5; // velocidade do inimigo
stay_still_chance = 1; // chance de ficar parado (50%)
is_moving = true; // flag para indicar se o inimigo está se movendo
direction = random(360); // direção inicial aleatória
knockback_duration = 0; // duração do knockback
knockback_force = 5; // força do knockback
morto = false;