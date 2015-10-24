int NUM_pins = 51;
int pins[51];
int vals[51];

void setup() {
  Serial.begin(9600);
  for (int i = 0; i < 51; i++) {
    pins[i] = i + 2;
  }
  for (int i = 0; i < NUM_pins; i++) {
    pinMode(pins[i], INPUT_PULLUP);
  }
}

void loop() {
  for (int i = 0; i < NUM_pins; i++) {
    vals[i] = digitalRead(pins[i]);
  }

  //Serial.write(val1);
  for (int i = 0; i < NUM_pins - 1; i++) {
    Serial.print(vals[i]);
    Serial.print(",");
  }
  Serial.println(vals[NUM_pins - 1]);
  delay(100);
}

