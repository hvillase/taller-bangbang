// Asignación de IP y puerto de pd
~pd=NetAddr("127.0.0.1", 3000);

// envio de datos con diferentes bandera
~pd.sendMsg(\num, 340);
~pd.sendMsg(\vol, 0);
~pd.sendMsg(\am, 300);
~pd.sendMsg(\index, 9);

// enviamos números del 0 al 99
(
{
	100.do{arg i;
		~pd.sendMsg("/num", i.postln);
		0.25.wait;
	}
}.fork
)

// envio de datos secuenciados en una tarea
(
~index=Pseq([2,5,7,9,7,6,5,10,20], inf).asStream;
~num=Pseq([300, 400, 550, 600, Pn(250,2), 550, 700], inf).asStream;

Tdef(\iom, {
	loop{
		1.do{~pd.sendMsg(\num, 250); 0.125.wait};
		1.do{~pd.sendMsg(\num, 300); 0.125.wait};
		4.do{~pd.sendMsg(\num, ~num.next);
			~pd.sendMsg(\am, rrand(100, 500)); 0.125.wait};
		1.do{~pd.sendMsg(\index, ~index.next)}
	}
}).stop
)

