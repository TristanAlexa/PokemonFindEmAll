/// @description Game variables	

//Game variables
global.playerControl = true;
townBGMvolume = audio_sound_get_gain(snd_townBGM);
townAmbienceVolume = audio_sound_get_gain(snd_townAmbience);
global.gameOver = false;
global.gameStart = false;

//Player States
enum playerState {
	idle,
	walking,
	pickingUp,
	carrying,
	carryingIdle,
	puttingDown,
}

//Pokemon States
enum pokemonState {
	idle,			//lost
	taken,			//carried
	used,			//found
	puttingBack,    //no quest
}

//NPC States
enum npcState {
	normal, //to do quest
	done,	//finished quest
}

//Sequence States
enum seqState {
	notplaying,
	waiting,
	playing,
	finished,
}

//Sequence Variables
sequenceState = seqState.notplaying;
curSeqLayer = noone;
curSeq = noone;