#include "HX711.h"

// HX711 circuit wiring
const int LOADCELL_DOUT_PIN = 4;
const int LOADCELL_SCK_PIN = 5;
float b = 259800.0;
float m = 10258.97715;


HX711 scale;

void setup() {
  Serial.begin(57600);
  scale.begin(LOADCELL_DOUT_PIN, LOADCELL_SCK_PIN);
}

void loop() {

  if (scale.wait_ready_retry(10)) {
    long reading = scale.read();
   /* Serial.print("HX711 reading: ");*/
    Serial.println((-1*reading -b)/m);
  } else {
    Serial.println("HX711 not found.");
  }

  delay(1500);
  
}
