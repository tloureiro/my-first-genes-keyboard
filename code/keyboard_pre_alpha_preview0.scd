s = Server.local;
s.boot;

s.doWhenBooted({





if (MIDIClient.initialized, {}, {MIDIClient.init}); //Init if it's not initialized

//making sure it retrieves the virtual kbd
MIDIClient.sources.do({
	arg item, i;
	item.name.postln;
	  if (item.name == "Virtual Keyboard-Virtual Keyboard", {
		MIDIIn.connect(0, MIDIClient.sources.at(i));
	  }, {
	  });
});


~sound1 = Buffer.read(s, "./sounds/sound1.wav");
~sound2 = Buffer.read(s, "./sounds/sound2.wav");
~sound3 = Buffer.read(s, "./sounds/sound3.wav");
~sound4 = Buffer.read(s, "./sounds/sound4.wav");



//numbers row, first key = 48
//first row (Q-P), first key = 58
//second row (A-L), first key = 68
//third row (Z-M), first key = 77
//numpad, top left key = 84

//you can have all notes with this scale
//~scale = Scale.new(#[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], name: "BLA BLA BLA");

//or just the major scale
~scale = Scale.major;


MIDIIn.noteOn = { |veloc, num, chan, src|

    if (((chan >= 48) && (chan <= 57)), {
		~currentSound = ~sound1;
		~pitchIndex = chan % 48;
		},{});

		if (((chan >= 58) && (chan <= 67)), {
		~currentSound = ~sound2;
		~pitchIndex = chan % 58;
		},{});

		if (((chan >= 68) && (chan <= 76)), {
		~currentSound = ~sound3;
		~pitchIndex = chan % 68;
		},{});

		if (((chan >= 77) && (chan <= 83)), {
		~currentSound = ~sound4;
		~pitchIndex = chan % 77;
		},{});

	{
			PitchShift.ar( PlayBuf.ar(1, ~currentSound, BufRateScale.kr(~currentSound), doneAction:2), 0.1, ~scale.ratios[~pitchIndex], 0, 0.0001 );
	}.play;

};


});


