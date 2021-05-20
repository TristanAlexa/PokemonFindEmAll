/// @description Destroy me and do things

//Allow control of player if no sequence
if (sequenceToShow == noone) {
	global.playerControl = true;
	}

//Create sequence if appropriate
if (sequenceToShow != noone) {
	scr_playSequence(sequenceToShow);
	}
//Destroy me
instance_destroy();
