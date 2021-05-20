// script function for pokemon
//drawing position of pokemon when being carried in relation to player object

function scr_pokemonposition(){
var _x, _y, _depth;
if (instance_exists(oPlayer)) {
	switch oPlayer.dir {
		case 0: { //right
			_x = oPlayer.x-80;
			_y = oPlayer.y-10;
			_depth = oPlayer.depth-2;
			}; break;
		case 1: { //up
			_x = oPlayer.x;
			_y = oPlayer.y+40;
			_depth = oPlayer.depth+2;
			}; break;
		case 2: { //left
			_x = oPlayer.x+80;
			_y = oPlayer.y-10;
			_depth = oPlayer.depth-2;
			}; break;
		case 3: { //down
			_x = oPlayer.x;
			_y = oPlayer.y-95;
			_depth = oPlayer.depth+2;
			}; break;
		}
	return [_x,_y,_depth];
	}

}