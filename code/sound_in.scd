s = Server.local;
s.boot;

s.doWhenBooted({



	(
                play(
                        {PitchShift.ar(
                AudioIn.ar([1,2]),
                0.1,
                MouseX.kr(0.5,3),  // nominal
                0,                // pitch dispersion
                0.004 );}       // time dispersion


	);

	)




});
