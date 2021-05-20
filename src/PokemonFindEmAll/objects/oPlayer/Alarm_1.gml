/// @description Deal with objects and NPC states

//Remove object from posession
if (hasPokemon !=noone && instance_exists(hasPokemon)) {
	//Return pokemon to trainer
	with (hasPokemon) {
		instance_destroy();
	}
	//Reset pokemon variables
	hasPokemon = noone;
	carryLimit = 0;
}

//Marking NPC in done state
if (nearbyNPC !=noone && instance_exists(nearbyNPC)) {
	//Set pokemon as done
	with (nearbyNPC) {
		myState = npcState.done;
	}
}
