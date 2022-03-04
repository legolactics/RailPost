const int EchoPin = 2;  //sesnors x
const int TriggerPin = 3;  //sensors x
const int Echo2 = 7;  //sensors x
const int Trigger2 = 6;  //sensors x

const int Echo1 = 4;  //sensors y
const int Trigger1 = 5;  //sensors y

int pes;
float abcd;
#include "HX711.h"
#include <SoftwareSerial.h>
SoftwareSerial mySerial(0, 1); // RX, TX

const int DOUT=A1;
const int CLK=A0;

HX711 balanza;

void setup() {
  Serial.begin(9600);
  
  pinMode(Trigger1, OUTPUT);
  pinMode(Echo1, INPUT);

  pinMode(TriggerPin, OUTPUT);
  pinMode(EchoPin, INPUT);
  pinMode(Trigger2, OUTPUT);
  pinMode(Echo2, INPUT);

  balanza.begin(DOUT, CLK);
  balanza.set_scale(-890.16); // Establecemos la escala
  balanza.tare(20);  //El peso actual es considerado Tara.
}

void loop() {
abcd = balanza.get_units(20),3;

    if (abcd > 100){
      delay(1000);
    pes = abcd;
    
    
    if (abcd > 100){
      
    delay (2000);
    
    }
    }

  int cm1 = ping(Trigger1, Echo1);
  int cm2 = pang(Trigger2, Echo2);
  int cm3 = pung(TriggerPin, EchoPin);
  byte cm_x = 10-(cm2+cm3);
  byte cm_y = 8-cm1;
  byte cm_2 = (cm_x*2)*cm_y;


  if (cm_2 > 5 && cm_2 < 150){
    if (cm_y < 250){
    Serial.print(pes);
  Serial.print(",");
  Serial.println(cm_2);
    }
    }

  delay(200);
}
  int ping(int Trigger1, int Echo1) {
   long duratiion, distanceCm;
   
   digitalWrite(Trigger1, LOW);  //para generar un pulso limpio ponemos a LOW 4us
   delayMicroseconds(4);
   digitalWrite(Trigger1, HIGH);  //generamos Trigger (disparo) de 10us
   delayMicroseconds(10);
   digitalWrite(Trigger1, LOW);
   
   duratiion = pulseIn(Echo1, HIGH);  //medimos el tiempo entre pulsos, en microsegundos
   
   distanceCm = duratiion * 10 / 292/ 2;   //convertimos a distancia, en cm
   return distanceCm;
  }

   int pung(int TriggerPin, int EchoPin) {
   long duration, distanceCm;
   digitalWrite(TriggerPin, LOW);  //para generar un pulso limpio ponemos a LOW 4us
   delayMicroseconds(4);
   digitalWrite(TriggerPin, HIGH);  //generamos Trigger (disparo) de 10us
   delayMicroseconds(10);
   digitalWrite(TriggerPin, LOW);
   
   duration = pulseIn(EchoPin, HIGH);  //medimos el tiempo entre pulsos, en microsegundos
   
   distanceCm = duration * 10 / 292/ 2;   //convertimos a distancia, en cm
   return distanceCm;
}
int pang (int Trigger2, int Echo2){
  long duracio, distanciacm2;
  digitalWrite(Trigger2, LOW);
  delayMicroseconds(4);
  digitalWrite(Trigger2, HIGH);
  delayMicroseconds(10);
  digitalWrite(Trigger2, LOW);

  duracio = pulseIn(Echo2, HIGH);

  distanciacm2 = duracio * 10 / 292/ 2;
  return distanciacm2;
}
