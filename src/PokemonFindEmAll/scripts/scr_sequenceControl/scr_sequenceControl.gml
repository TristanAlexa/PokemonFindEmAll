// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_playSequence(_seqToPlay){
	//Create Sequence is appropriate
	if (_seqToPlay != noone) {
		
		//Set sequence to centre view of Camera
		var _camX = camera_get_view_x(view_camera[0])+floor(camera_get_view_width(view_camera[0])*0.5);
		var _camY = camera_get_view_y(view_camera[0])+floor(camera_get_view_height(view_camera[0])*0.5);
		
		//Make sure sequence does not already exist
		if (instance_exists(oControl) && !layer_sequence_exists(oControl.curSeqLayer,_seqToPlay)) {
			if (layer_exists(oControl.curSeqLayer)) {
				//Play sequence
				layer_sequence_create(oControl.curSeqLayer,_camX,_camY,_seqToPlay);
				layer_depth(oControl.curSeqLayer,-10000);
				}
			}
		}
}