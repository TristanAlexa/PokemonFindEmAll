/// @description Variables and dialogue setup

//Textbox variables
textToShow = "Hello, Red.";
textWidth = 452;
lineHeight = 25;
fadeMe = 0;
fadeSpeed = 0.1;
image_alpha = 0;
sequenceToShow = noone

global.playerControl = false;

//Play UI sound
audio_play_sound(snd_pop01,1,0);

//Dismiss any visible prompts
scr_dismissPrompt(oPrompt,0);