package main

import rl "vendor:raylib"

spawn_drawing :: proc(pos: ^Position) {
	INFO :: "WASD to move"
	MAKER :: "foooz by padulkemid"

	rl.BeginDrawing()

	rl.ClearBackground(rl.SKYBLUE)
	rl.DrawRectangle(pos.x, pos.y, RECT_WIDTH, RECT_HEIGHT, rl.RED)
	rl.DrawText(INFO, 10, 10, 17, rl.BLACK)
	rl.DrawText(MAKER, 10, 30, 17, rl.BLACK)

	rl.EndDrawing()

}

game :: proc(pos: ^Position) {
	controls(pos)
	spawn_drawing(pos)
}

