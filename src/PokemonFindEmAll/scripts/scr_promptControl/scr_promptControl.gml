// Script functions - code to call in my objects
function scr_showPrompt(_object,_x,_y){
	if (instance_exists(_object)) {
		if (!instance_exists(oTextbox) && !instance_exists(oPrompt)){
			if (oPlayer.myState !=playerState.puttingDown) {
				iii = instance_create_depth(_x,_y,-10000,oPrompt);
				return iii;
			}
		}
	}

}
function scr_dismissPrompt(_whichPrompt,_toReset){
	if (_whichPrompt != undefined){
		if (instance_exists(_whichPrompt)){
			//Tell prompt Object to fade out
			with (_whichPrompt) {
				fadeMe = "fadeOut";
			}
			//Reset appropriate prompt variable
			if (instance_exists(oPlayer)) {
				with (oPlayer) {
					switch _toReset {
						//Reset npcPrompt
						case 0: npcPrompt = noone; break;
						case 1: PokemonPrompt = noone; break;
					}
				}
			}
		}
	}
	
}