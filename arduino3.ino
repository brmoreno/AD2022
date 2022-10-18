int pinLed = 13;
int pinPot = A0;
int valorLectura;

void setup() {
  // put your setup code here, to run once:
  pinMode(pinLed,OUTPUT);

}

void loop() {
  // put your main code here, to run repeatedly:
  valorLectura = analogRead(pinPot);
  digitalWrite(pinLed,HIGH);
  delay(valorLectura);
  digitalWrite(pinLed,LOW);
  delay(valorLectura);
}
