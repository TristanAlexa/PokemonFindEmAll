/// @description Deal with sequences by state

//Control Sequences
switch sequenceState {
	case seqState.playing: {
		//Fade out town music
		if (audio_is_playing(snd_townBGM)){
			audio_sound_gain(snd_townBGM,0,60);
		}
		//Fade out town ambience
		if (audio_is_playing(snd_townAmbience)){
			audio_sound_gain(snd_townAmbience,0,60);
		} 
		global.playerControl = false;
	}; break;
	case seqState.finished: {
		//Remove sequence
		if (layer_sequence_exists(curSeqLayer,curSeq)) {
			layer_sequence_destroy(curSeq);
		}
		
		//Restore town music
		if (audio_is_playing(snd_townBGM) && audio_sound_get_gain(snd_townBGM) < townBGMvolume) {
			audio_sound_gain(snd_townBGM,townBGMvolume,60);
		}
		//Restore town ambience
		if (audio_is_playing(snd_townAmbience) && audio_sound_get_gain(snd_townAmbience) < townAmbienceVolume) {
			audio_sound_gain(snd_townAmbience,townAmbienceVolume,60);
		}
		
		//Restore player control
		global.playerControl = true;
		sequenceState = seqState.notplaying;
		curSeq = noone;
		
		//Check if NPC quests are done
		if (global.gameOver == false) {
				if (oAgatha.myState == npcState.done && oGreen.myState == npcState.done && oBruno.myState == npcState.done) {
					//Queue up game over sequence
					global.playerControl = false;
					//Mark game as won
					global.gameOver = true;
					}
			}
		}; break;
	}
