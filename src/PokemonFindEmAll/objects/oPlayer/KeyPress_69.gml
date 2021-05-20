/// @description Interact key with game objects

var _text
var _sequence = seqGameOver;
var _layerName = "Cutscenes";

//If player has control
if (global.playerControl == true) {
	//If near an NPC
	if (nearbyNPC) {
		//If NPC quest is unfinished
		if (nearbyNPC.myState == npcState.normal) {
			//If player does not have a Pokemon
			if (hasPokemon == noone || hasPokemon == undefined) {
				_text = nearbyNPC.myText;
				if (!instance_exists(oTextbox)){
					iii = instance_create_depth(nearbyNPC.x,nearbyNPC.y-100,-10000,oTextbox);
					iii.textToShow = _text;
				}
			}
			//If player has pokemon and (pokemon exists)
			if (hasPokemon !=noone && instance_exists(hasPokemon)) {
				//If player has correct pokemon
				if (hasPokemon.object_index == nearbyNPC.myPokemon) {
					_text = nearbyNPC.pokemonTextHappy;
					//Check if we should remove object, mark NPC
					alarm[1] = 10;
				}
				//Or if player has wrong pokemon
				else {
					_text = nearbyNPC.pokemonTextSad;
				}
				//Create textbox
				if (!instance_exists(oTextbox)){
					iii = instance_create_depth(nearbyNPC.x,nearbyNPC.y-100,-10000,oTextbox);
					iii.textToShow = _text;
				}
			}
		}
		//If NPC quest is done
		if (nearbyNPC.myState == npcState.done) {
			_text = nearbyNPC.pokemonTextDone;
			if (!instance_exists(oTextbox)){
				iii = instance_create_depth(nearbyNPC.x,nearbyNPC.y-100,-10000,oTextbox);
				iii.textToShow = _text;
			}
		}
	}
	//If near a Pokemon
	if (nearbyPokemon && !nearbyNPC) {
		//If player doesn't have a Pokemon
		if (hasPokemon == noone || hasPokemon == undefined){
			global.playerControl = false;
			myState = playerState.pickingUp;
			image_index = 0;
			hasPokemon = nearbyPokemon;
			//Take into account weight of the Pokemon player picked up
			carryLimit = hasPokemon.pokemonWeight * 0.1;
			//Change state of item we're picking up
			with (hasPokemon) {
				myState = pokemonState.taken;
			}
			//Play pickup sound
			audio_play_sound(snd_itemPickup,1,0);
		}
	}
	//If not near an NPC or another Pokemon
	if (!nearbyPokemon && !nearbyNPC) {
		//Put down a Pokemon
		if (hasPokemon != noone) {
			myState = playerState.puttingDown;
			image_index = 0;
			global.playerControl = false;
			//Change state of pokemon we are carrying
			with (hasPokemon) {
				putDownY = oPlayer.y+5;
				myState = pokemonState.puttingBack;
			}
			//Play put down sound
			audio_play_sound(snd_itemPutDown,1,0);
			//Reset pokemon
			hasPokemon = noone;
		}
	}
	//Ending the game
	if (global.gameOver == false) {
			if (oAgatha.myState == npcState.done && oGreen.myState == npcState.done && oBruno.myState == npcState.done) {
				//Queue up game over sequence
				global.playerControl = false;
				var _camX = camera_get_view_x(view_camera[0])+floor(camera_get_view_width(view_camera[0])*0.5);
				var _camY = camera_get_view_y(view_camera[0])+floor(camera_get_view_height(view_camera[0])*0.5);
				layer_sequence_create(_layerName,_camX,_camY,_sequence);
				layer_depth(_layerName,-10000);
				//Close the game
				global.gameOver = true;
				}
		}
}

