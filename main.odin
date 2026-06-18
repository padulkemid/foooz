package main

import "core:fmt"
import rl "vendor:raylib"

// title
WINDOW_TITLE :: "foooz"

// screen
FPS :: 60
SCREEN_WIDTH :: 800
SCREEN_HEIGHT :: 400

// player
RECT_WIDTH :: 50
RECT_HEIGHT :: 50
RECT_MOVE_SPEED :: 10

// projectile
PROJECTILE_WIDTH :: 5
PROJECTILE_HEIGHT :: 20
PROJECTILE_SPEED :: 40

Position :: struct {
	x: i32,
	y: i32,
}

Projectile :: struct {
	pos: Position,
}

// global state
Game_State :: struct {
	player:      Position,
	projectiles: [dynamic]Projectile,
  // score: int <- absolutely can implement later
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

  projectiles := make([dynamic]Projectile)

	// set start state
	state := Game_State {
		player      = start,
		projectiles = projectiles,
	}

	// start game
	for !rl.WindowShouldClose() {
		game(&state)
	}
}

