///Player Creation Code

//Variables
walkSpeed = 8.5;
vx = 0;
vy = 0;
dir = 3;
moveRight = 0;
moveLeft = 0;
moveUp = 0;
moveDown = 0;
nearbyNPC = noone;
lookRange = 30;
hasMet = false;
npcPrompt = noone;
hasPokemon = noone
nearbyPokemon = noone;
PokemonPrompt = noone;
carryLimit = 0;
myState = playerState.idle;


// Creating listener and set orientation
audio_listener_set_position(0,x,y,0);
audio_listener_set_orientation(0,0,1,0,0,0,1);

//Player Sprite array [myState][dir]
//Idle
playerSpr[playerState.idle][0] = sPlayerIdleRight;
playerSpr[playerState.idle][1] = sPlayerIdleUp;
playerSpr[playerState.idle][2] = sPlayerIdleLeft;
playerSpr[playerState.idle][3] = sPlayerIdle;

//Walking (running with no pokemon)
playerSpr[playerState.walking][0] = sPlayerRunRight;
playerSpr[playerState.walking][1] = sPlayerRunUp;
playerSpr[playerState.walking][2] = sPlayerRunLeft;
playerSpr[playerState.walking][3] = sPlayerRunDown;

//Picking up
playerSpr[playerState.pickingUp][0] = sPlayerPickUp;
playerSpr[playerState.pickingUp][1] = sPlayerPickUp;
playerSpr[playerState.pickingUp][2] = sPlayerPickUp;
playerSpr[playerState.pickingUp][3] = sPlayerPickUp;

//Carrying
playerSpr[playerState.carrying][0] = sPlayerWalkRight;
playerSpr[playerState.carrying][1] = sPlayerWalkUp;
playerSpr[playerState.carrying][2] = sPlayerWalkLeft;
playerSpr[playerState.carrying][3] = sPlayerWalkDown;

//Idle while carrying
playerSpr[playerState.carryingIdle][0] = sPlayerIdleRight;
playerSpr[playerState.carryingIdle][1] = sPlayerIdleUp;
playerSpr[playerState.carryingIdle][2] = sPlayerIdleLeft;
playerSpr[playerState.carryingIdle][3] = sPlayerIdle;

//Puttingdown
playerSpr[playerState.puttingDown][0] = sPlayerPuttingDown;
playerSpr[playerState.puttingDown][1] = sPlayerPuttingDown;
playerSpr[playerState.puttingDown][2] = sPlayerPuttingDown;
playerSpr[playerState.puttingDown][3] = sPlayerPuttingDown;
