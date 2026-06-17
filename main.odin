package main

import rl "vendor:raylib"

WINDOW_TITLE :: "foooz"
FPS :: 60
SCREEN_WIDTH :: 800
SCREEN_HEIGHT :: 400
RECT_WIDTH :: 50
RECT_HEIGHT :: 50


Position :: struct {
	x: i32,
	y: i32,
}

vertical_control :: proc(pos: ^Position) {
	if rl.IsKeyDown(.W) {
		pos.y -= 5
	}

	if rl.IsKeyDown(.S) {
		pos.y += 5
	}
}

horizontal_control :: proc(pos: ^Position) {
	if rl.IsKeyDown(.A) {
		pos.x -= 5
	}

	if rl.IsKeyDown(.D) {
		pos.x += 5
	}
}

controls :: proc(pos: ^Position) {
	vertical_control(pos)
	horizontal_control(pos)
}

spawn_drawing :: proc(pos: ^Position) {
	INFO :: "WASD to move"

	rl.BeginDrawing()

	rl.ClearBackground(rl.SKYBLUE)
	rl.DrawRectangle(pos.x, pos.y, RECT_WIDTH, RECT_HEIGHT, rl.RED)
	rl.DrawText(INFO, 10, 10, 17, rl.BLACK)

	rl.EndDrawing()

}


game :: proc(pos: ^Position) {
	controls(pos)
	spawn_drawing(pos)
}

main :: proc() {
	// init
	rl.InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, WINDOW_TITLE)
	defer rl.CloseWindow()

	// set target
	rl.SetTargetFPS(FPS)

	// set start pos
	start := Position {
		x = 100,
		y = 100,
	}

	// start game
	for !rl.WindowShouldClose() {
		game(&start)
	}
}

