extends Node2D


var distance2Hero = enemy.get_global_pos().distance_to(hero.get_global_pos()); 
	if(distance2Hero<100): enemy.throwBulletAt(hero);
