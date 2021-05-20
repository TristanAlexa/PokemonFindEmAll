/// @description Music and more

//Play music based on room
switch room {
	case rm_mainGame: {
		audio_play_sound(snd_townBGM,1,1);
		audio_play_sound(snd_townAmbience,1,1);
	}; break;
}

//Mark sequences layer
if (layer_exists("Cutscenes")) {
	curSeqLayer = "Cutscenes";
}
else {
	curSeqLayer = "Instances";
}