/// @description Animation and more

//Depth, Animation
switch myState {
	//If pokemon is sitting on ground
	case pokemonState.idle: {
		depth =-y;
	}; break;
	//If pokemon is taken
	case pokemonState.taken: {
		//keep track of player position
		var _result = scr_pokemonposition();
		x = _result[0];
		y = _result[1]
		depth = _result[2];
	}; break;
	//If pokemon is being put back
	case pokemonState.puttingBack: {
		y = putDownY;
	}; break;
}
