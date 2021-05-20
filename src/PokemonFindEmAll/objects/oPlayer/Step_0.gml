/// @desscription Player movement

// Check keys for movement
if (global.playerControl == true){
	moveRight = keyboard_check(ord("D"));
	moveLeft = keyboard_check(ord("A"));
	moveUp = keyboard_check(ord("W"));
	moveDown = keyboard_check(ord("S"));
}
if (global.playerControl == false){
	moveRight = 0;
	moveLeft = 0;
	moveUp = 0;
	moveDown = 0;
}

//Calculate movement
vx = ((moveRight - moveLeft) * walkSpeed * (1-carryLimit));
vy = ((moveDown - moveUp) * walkSpeed * (1-carryLimit));

//If idle
if (vx == 0 && vy == 0) {
	//If player is not picking up or putting down 
	if (myState != playerState.pickingUp && myState != playerState.puttingDown) {
		//If player is not holding pokemon
		if (hasPokemon == noone) {
			myState = playerState.idle;
		}
		//If player is carrying
		else {
			myState = playerState.carryingIdle;
		}
	}
}

//If moving in an open area
if (vx != 0 || vy != 0) {
	if !collision_point(x+vx,y,oParentEnvironment,true,true){
	x += vx;
	}
	if !collision_point(x,y+vy,oParentEnvironment,true,true){
	y += vy;
	}
	
	//Change direction based on movement
	//right
	if (vx > 0) {
		dir = 0;
	}
	//left
	if (vx < 0) {	
		dir = 2;
	}
	//down
	if (vy > 0) {
		dir = 3;
	}
	//up
	if (vy < 0) {
		dir = 1;
	}
	
	//Set state
	//If player doesn't have a pokemon - running animation
	if (hasPokemon == noone) {
		myState = playerState.walking;
	}
	//If player is holding a pokemon - slower walking animation
	else {
		myState = playerState.carrying
	}
}

//Set my listener if sequence is playing
if (instance_exists(oControl) && oControl.sequenceState == seqState.playing) {
	var _camX = camera_get_view_x(view_camera[0])+floor(camera_get_view_width(view_camera[0])*0.5);
	var _camY = camera_get_view_y(view_camera[0])+floor(camera_get_view_height(view_camera[0])*0.5);
	
	audio_listener_set_position(0,_camX,_camY,0);
}
else {
	audio_listener_set_position(0,x,y,0);
}

//Check for collision with NPCs
nearbyNPC = collision_rectangle(x-lookRange,y-lookRange,x+lookRange,y+lookRange,oParentNpc,false,true);
if nearbyNPC {
	if (hasMet == false){
		hasMet = true;
	}
	// Pop up prompt
	if (npcPrompt == noone || npcPrompt == undefined){
		npcPrompt = scr_showPrompt(nearbyNPC,nearbyNPC.x,nearbyNPC.y-160);
	}
}
if !nearbyNPC {
	// Reset greeting
	if (hasMet == true){
		hasMet = false;
	}
	//Destroy Prompt
	scr_dismissPrompt(npcPrompt,0);
}

//Check for collision with Pokemon
nearbyPokemon = collision_rectangle(x-lookRange,y-lookRange,x+lookRange,y+lookRange,oParentPokemon,false,true);
if (nearbyPokemon && !nearbyNPC){
	//Pop up prompt
	if (PokemonPrompt == noone || PokemonPrompt = undefined) {
		PokemonPrompt = scr_showPrompt(nearbyPokemon,nearbyPokemon.x,nearbyPokemon.y-160);
	}
}
if (!nearbyPokemon || nearbyNPC){
	//Destroy prompt
	scr_dismissPrompt(PokemonPrompt,1);
}

//If picking up a Pokemon
if (myState == playerState.pickingUp) {
	if (image_index >= image_number-1) {
		myState = playerState.carrying;
		global.playerControl = true;
	}
}

//If putting down a Pokemon
if (myState == playerState.puttingDown) {
	//Reset weight
	carryLimit = 0;
	//Reset player state once animation finishes
	if (image_index >= image_number-1) {
		myState = playerState.idle;
		global.playerControl = true;
	}
}

//Auto-choose sprite based on state and direction
sprite_index = playerSpr[myState][dir];

//Depth Sorting
depth =-y;        