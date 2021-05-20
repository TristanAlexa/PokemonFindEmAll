/// @description NPC animation

//Change appearance with state
switch myState {
	case npcState.normal: {
	}; break;
	case npcState.done: {
		if (doneSprite !=noone && sprite_index !=doneSprite) {
			sprite_index = doneSprite;
		}
	}; break;
}
//Depth sorting
depth =-y;