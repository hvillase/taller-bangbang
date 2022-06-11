// Mensajes para sinte asr
(
OSCdef(\recibir, {|msg|
	//msg[1].postln;
	~sint.set(\frec, msg[1].postln);
}, '/frec');
);

(
OSCdef(\apagar, {|msg|
	//msg[1].postln;
	~sint.set(\gate, msg[1].postln);
},'/apagado')
);

// mensajes para sinte percusivo
(
OSCdef(\frec, {|msg|
	~frec=msg[1].postln;
}, '/num');
);

(
OSCdef(\rel, {|msg|
	~rel=msg[1].postln;
}, '/rel');
);

(
OSCdef(\on, {|msg|
	if(1==msg[1],{Synth(\perc, [\frec, ~frec, \rel, ~rel])},{Synth(\pd)});
}, '/on')
);

// sinte con envolvente asr
(
SynthDef(\asr, {|frec=300, gate=1, rel=0.1, out=0|
	var sen, env;
	sen = SinOsc.ar(frec, 0, 0.5);
	sen = Pan2.ar(sen, 0);
	env = EnvGen.kr(Env.asr(0.01, 1, 0.1), gate, doneAction:0);
	Out.ar(out, sen*env)
}).add
);

~sint=Synth(\asr);
~sint.set(\frec, 400);
~sint.set(\gate, 0);

// sinte percusivo
(
SynthDef(\perc, {|frec=300, gate=1, rel=0.1, out=0|
	var sen, env;
	sen = SinOsc.ar(frec, 0, 0.5);
	sen = Pan2.ar(sen, 0);
	env = EnvGen.kr(Env.perc(0.01, rel), gate, doneAction:2);
	Out.ar(out, sen*env)
}).add
);

Synth(\perc);
