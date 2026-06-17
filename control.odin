package main

import rl "vendor:raylib"

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

	if rl.IsKeyDown(.A) && right_limit {
		pos.x -= RECT_MOVE_SPEED
	}

	if rl.IsKeyDown(.D) && left_limit {
		pos.x += RECT_MOVE_SPEED
	}
}

controls :: proc(pos: ^Position) {
	vertical_control(pos)
	horizontal_control(pos)
}

