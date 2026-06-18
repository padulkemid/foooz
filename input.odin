package main

import rl "vendor:raylib"

projectile_control :: proc(state: ^Game_State) {
	if rl.IsKeyPressed(.SPACE) {
		p := Projectile {
			pos = Position{x = state.player.x + 10, y = state.player.y + 10},
		}

    append(&state.projectiles, p)
	}
}

vertical_control :: proc(pos: ^Position) {
	top_limit := pos.y > 0
	bottom_limit := pos.y < SCREEN_HEIGHT - RECT_HEIGHT

	if rl.IsKeyDown(.W) && top_limit {
		pos.y -= RECT_MOVE_SPEED
	}

	if rl.IsKeyDown(.S) && bottom_limit {
		pos.y += RECT_MOVE_SPEED
	}
}

horizontal_control :: proc(pos: ^Position) {
	left_limit := pos.x > 0
	right_limit := pos.x < SCREEN_WIDTH - RECT_WIDTH

	if rl.IsKeyDown(.A) && left_limit {
		pos.x -= RECT_MOVE_SPEED
	}

	if rl.IsKeyDown(.D) && right_limit {
		pos.x += RECT_MOVE_SPEED
	}
}

register_input :: proc(state: ^Game_State) {
	player_pos := &state.player
	projectile_pos := state.projectiles

	vertical_control(player_pos)
	horizontal_control(player_pos)
	projectile_control(state)
}

