/// @description Deal with sequences

//Listen for broadcast messages
switch (event_data[? "message"]) {
	case "sequenceStart": {
		//Set our state
		sequenceState = seqState.playing;
		//Find out which Sequence, broadcast this message and mark it
		if (layer_get_element_type(event_data[? "element_id"]) == layerelementtype_sequence) {
			curSeq = event_data[? "element_id"];
			show_debug_message("oControl has heard that sequence "+string(curSeq)+" is playing");
		}
	}; break;
	case "sequenceEnd": {
		//Set our state
		sequenceState = seqState.finished;
		show_debug_message("oControlhas heard that sequence "+string(curSeq)+" is playing");
		}; break;
	}