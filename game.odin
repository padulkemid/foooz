package main

import rl "vendor:raylib"

spawn_drawing :: proc(state: ^Game_State) {
	INFO :: "WASD to move"
	MAKER :: "foooz by padulkemid"

	rl.BeginDrawing()

	rl.ClearBackground(rl.SKYBLUE)

	// draw player
	rl.DrawRectangle(state.player.x, state.player.y, RECT_WIDTH, RECT_HEIGHT, rl.RED)

	// draw projectiles
	for p in state.projectiles {
		rl.DrawRectangle(p.pos.x, p.pos.y, PROJECTILE_WIDTH, PROJECTILE_HEIGHT, rl.YELLOW)
	}


	rl.DrawText(INFO, 10, 10, 17, rl.BLACK)
	rl.DrawText(MAKER, 10, 30, 17, rl.BLACK)

	rl.EndDrawing()
}

game :: proc(state: ^Game_State) {
	controls(state)
	spawn_drawing(state)
	projectile_system(state)
}

