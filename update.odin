package main

projectile_system :: proc(state: ^Game_State) {
	#reverse for &proj, i in state.projectiles {
		proj.pos.y -= PROJECTILE_SPEED

		if proj.pos.y < -PROJECTILE_HEIGHT {
			ordered_remove(&state.projectiles, i)
		}
	}
}

