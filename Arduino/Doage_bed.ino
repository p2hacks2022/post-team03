
#include <IRremote.hpp>

#include <Servo.h>

Servo servo;
int receiverPin = 8;
int a = 6;
bool lightOn = false;
IRrecv receiver(receiverPin);
decode_results results;

void setup() {
  Serial.begin(9600);
  receiver.enableIRIn();
  servo.attach(10, 500, 2400);
  pinMode(10, OUTPUT);
}
void loop() {
 if(receiver.decode(&results))  {
        Serial.println(results.value,HEX);
        receiver.resume();
    }
if(results.value==0xFF6897){
  a=0;
}
if(results.value==0xFF30CF){
  a=1;
}
if(a==0){ 
  servo.write(75);
  delay(1000);

 }
 if(a==1){ 
  servo.write(0);
  delay(1000);
  servo.write(75);
  delay(1000);
 }
}
