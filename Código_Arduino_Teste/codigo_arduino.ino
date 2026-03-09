const int PINO_SENSOR_TEMPERATURA = A0;
float temperaturaCelsius;
float temperaturaFahrenheit;

void setup() {
  Serial.begin(9600);
}

void loop() {
  int valorLeitura = analogRead(PINO_SENSOR_TEMPERATURA);
  temperaturaCelsius = (valorLeitura * 5.0 / 1023) 0.01;
  temperaturaFahrenheit = (temperaturaCelsius * 1.8) + 32;
  
  Serial.println("--------------");
  Serial.print("Temperatura: ");
  Serial.print(temperaturaCelsius);
  Serial.println(" C");
  
  Serial.print("Temperatura: ");
  Serial.print(temperaturaFahrenheit);
  Serial.println(" F");
  
  delay(2000);
}
