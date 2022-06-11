# taller-bangbang
Conexión de Pure Data con SuperCollider en red local con OSC

### Software para el Taller
puredata: https://puredata.info/  
supercollider: https://supercollider.github.io/  
### Pure Data y SuperCollider
Diferencias:  pd es programación visual, sc es programación textual.  
Similitudes: ambos trabajan con sonido, síntesis y protocolos de red.  
Relaciones: en 1996 comenzó su desarrollo en USA. Uno surge como open source por desacuerdo, otro después de un tiempo. Se crean comunidades.  

### OSC
Protocolo Open Sound Control. Está compuesto por mensajes que se envían a través de una estructura de red de computadoras. La sintaxis consiste en etiqueta-valor: /mensaje, 0.5

### Red de computadoras
Conexión entre dos o mas computadoras, requiere de protocolos para enviar información.    

 IP adress: dirección bajo el protcolo de Internet. Es un número que identifica dispositivos en la red.
localhost: 127.0.0.1 dirección IP interna de la computadora  

Puerto (port)  
**pd**: 3000  
**sc**: 57120

pd y sc se pueden enviar mensajes osc a través de la red interna o con otras computadoras.

### 1 Conexión
pd: netsend y netreceive  
sc: NetAddr y OSCdef  

### 2 probar la conexión
enviar números  
enviar strings  

### 3 sonar la conexión
SynthDef: que recibe valores de varios parámetros.  
Patch: sonido con envolvente

### vocabulario
TCP: protocol (manda mensajes stream en pd)  
UDP: User Datagram Protocol (manda mensajes datagram en pd)  
FUDI: Protocolo de red de pd, Fast Universal Digital Interface  
localhost: huésped local  
Port: puerto
