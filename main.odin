package main

import "core:fmt"
import rl "vendor:raylib"

WINDOW_TITLE :: "foooz"

FPS :: 60

SCREEN_WIDTH :: 800
SCREEN_HEIGHT :: 400
RECT_WIDTH :: 50
RECT_HEIGHT :: 50

RECT_MOVE_SPEED :: 10


Position :: struct {
	x: i32,
	y: i32,
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
	right_limit := pos.x > 0
	left_limit := pos.x < SCREEN_WIDTH - RECT_WIDTH

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

// this procedure will act as logging info between oses
desktop_info :: proc() {
	fmt.printf("runs in %v\n", ODIN_OS)
}


game :: proc(pos: ^Position) {
	controls(pos)
	spawn_drawing(pos)
}

main :: proc() {
	// init
	rl.InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, WINDOW_TITLE)
	defer rl.CloseWindow()

	desktop_info()

	// set target
	rl.SetTargetFPS(FPS)

	// set start pos
	start := Position {
		x = (SCREEN_WIDTH / 2) - RECT_WIDTH,
		y = (SCREEN_HEIGHT / 2) - RECT_HEIGHT,
	}

	// start game
	for !rl.WindowShouldClose() {
		game(&start)
	}
}

