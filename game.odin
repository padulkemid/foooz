package main

import rl "vendor:raylib"

spawn_drawing :: proc(state: ^Game_State) {
	MOVT_INFO :: "WASD to move"
  PROJ_INFO :: "SPACE to shoot"
	MAKER :: "foooz by padulkemid"

	rl.BeginDrawing()

	rl.ClearBackground(rl.SKYBLUE)

	// draw player
	rl.DrawRectangle(state.player.x, state.player.y, RECT_WIDTH, RECT_HEIGHT, rl.RED)

	// draw projectiles
	for p in state.projectiles {
		rl.DrawRectangle(p.pos.x, p.pos.y, PROJECTILE_WIDTH, PROJECTILE_HEIGHT, rl.YELLOW)
	}


	rl.DrawText(MOVT_INFO, 10, 10, 17, rl.BLACK)
	rl.DrawText(PROJ_INFO, 10, 30, 17, rl.BLACK)
	rl.DrawText(MAKER, 10, 50, 17, rl.BLACK)

	rl.EndDrawing()
}

game :: proc(state: ^Game_State) {
	register_input(state)
	spawn_drawing(state)
	projectile_system(state)
}

