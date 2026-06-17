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

// this procedure will act as logging info between oses
desktop_info :: proc() {
	fmt.printf("runs in %v\n", ODIN_OS)
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

