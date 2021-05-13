#include <ESP8266WiFi.h>

//#include "DHT.h"
//#define DHTPIN D1
//#define DHTTYPE DHT11
//DHT dht(DHTPIN,DHTTYPE);

#define SS_PIN 2 //D4
#define RST_PIN 0 //D0
#include <SPI.h>
#include <MFRC522.h>

MFRC522 mfrc522(SS_PIN, RST_PIN);   // Create MFRC522 instance.
int statuss = 0;
int out = 0;

//const int trigPin = D7;
//const int echoPin = D8;
//int range = 5;
//
//const int IR_PIN = D6; 
//
//const int flame_pin=D5;
//
//const int PIR_PIN = D4;
//
//const int smoke_pin=D0;
//
//const int rain = D2;
//int soilvalue = 0;
//
//const int ldrPin = D4;

const char* ssid     = "webpro";
const char* password = "webpro@2018";
const char* host = "dhruv234.000webhostapp.com";


void setup() {
  Serial.begin(115200);
//  Serial.begin(9600);
//  delay(100);
  Serial.println();
  Serial.println();
//  pinMode(trigPin,OUTPUT);
//  pinMode(echoPin,INPUT);
//  pinMode(IR_PIN,INPUT);
//  pinMode(flame_pin,INPUT);
//  pinMode(PIR_PIN,INPUT);
//  dht.begin();
//  pinMode(ldrPin,INPUT);

  SPI.begin(); 
  mfrc522.PCD_Init(); 
//  
  Serial.print("Connecting to ");
  Serial.println(ssid);
  
  WiFi.begin(ssid, password); 
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
 
  Serial.println("");
  Serial.println("WiFi connected");  
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());
  Serial.print("Netmask: ");
  Serial.println(WiFi.subnetMask());
  Serial.print("Gateway: ");
  Serial.println(WiFi.gatewayIP());
}
//long microSecondsToInches(long ms){
//     return ms /74 /2;
//   }
//      
//long microSecondsToCm(long ms){
//     return ms /29 /2;
//   }



void loop() {
  
//    long duration,inches,cm;
//    digitalWrite(trigPin ,LOW);
//    delayMicroseconds(2);
//    digitalWrite(trigPin,HIGH);
//    delayMicroseconds(5);
//    digitalWrite(trigPin ,LOW);
//
//    duration = pulseIn(echoPin,HIGH);
//
//    inches = microSecondsToInches(duration);
//    cm = microSecondsToCm(duration);
//    Serial.print("Incehs:");
//    Serial.println(inches);
//    Serial.print("Cm:");
//   Serial.println(cm);
//  int IR_STATUS = digitalRead(IR_PIN);

//  int flame_value = digitalRead(flame_pin);
//  Serial.print("FLAME VALUE: ");
//  Serial.println(flame_value);

//  int smoke_value = analogRead(smoke_pin);//mq2
//  Serial.print("SMOKE VALUE: ");
//  Serial.println(smoke_value);

//  int pir_value = digitalRead(PIR_PIN);
//  Serial.print("MOTION VALUE: ");
//  Serial.println(pir_value);
//
//  float h = dht.readHumidity();
//  float t = dht.readTemperature();
//  Serial.print("humidity VALUE: ");
//  Serial.println(h);
//  Serial.print("temperature VALUE: ");
//  Serial.println(t);
//
//  soilvalue = analogRead(rain);
//  Serial.print("Value : ");
//  Serial.println(soilvalue);
//
//  int ldrStatus = analogRead(ldrPin);
//  Serial.print("Value : ");
//  Serial.println(ldrStatus);

  if ( ! mfrc522.PICC_IsNewCardPresent())
  {
    return;
  }
  // Select one of the cards
  if ( ! mfrc522.PICC_ReadCardSerial())
  {
    return;
  }
//  Show UID on serial monitor
  Serial.println();
  Serial.print(" UID tag :");
  String content= "";
  byte letter;
  for (byte i = 0; i < mfrc522.uid.size; i++)
  {
     Serial.print(mfrc522.uid.uidByte[i] < 0x10 ? " 0" : " ");
     Serial.print(mfrc522.uid.uidByte[i], HEX);
     content.concat(String(mfrc522.uid.uidByte[i] < 0x10 ? " 0" : " "));
     content.concat(String(mfrc522.uid.uidByte[i], HEX));
  }
  content.toUpperCase();
  Serial.println();
  if (content.substring(1) == "22 0F 74 34")
  {
    Serial.println(" Access Granted ");
    statuss = 1;
  }
  else if(content.substring(1) == "E7 94 9F 5F"){
    Serial.println(" Access Granted ");
    statuss = 1;
  }
  else   {
    Serial.println(" Access Denied ");
    delay(3000);
  }

  Serial.print("connecting to ");
  Serial.println(host);

  WiFiClient client;
  const int httpPort = 80;
  if (!client.connect(host, httpPort)) {
    Serial.println("connection failed");
    return;
  }


    String rfidvalue = content.substring(1);
//  String url = "/authentication/ultrasonic.php?ultravalue=" + String(inches);
//  String url2 = "/authentication/ir.php?irvalue=" + String(IR_STATUS);
//  String url3 = "/authentication/flameapi.php?flame=" + String(flame_value);
//  String url4 = "/authentication/smoke.php?smokevalue=" + String(smoke_value);
//  String url5 = "/authentication/pir.php?pirvalue=" + String(pir_value);
//  String url6 = "/authentication/temp.php?temp=" + String(t) + "&hum="+ String(h);
//  String url7 = "/authentication/soil.php?soilvalue=" + String(soilvalue);
//  String url8 = "/authentication/ldr.php?ldrvalue=" + String(ldrStatus);
  String url9 = "/authentication/attendance.php?key=E7%2094%209F%205F";
  Serial.print("Requesting URL: "); 
  Serial.println(url9);

  String request = String("GET ") + url9 + " HTTP/1.1\r\n" +
              "Host: " + host + "\r\n" +
              "Connection: close\r\n\r\n";
    client.print(request);     
   
//  client.print(String("GET/") + url9 + "HTTPS/1.1\r\n" +
//               "Host: " + host + "\r\n" + 
//               "Connection: close\r\n\r\n");
  delay(500);
  
  while(client.available()){
    String line = client.readStringUntil('\r');
    Serial.print(line);
  }
  
  Serial.println();
  Serial.println("closing connection");
  delay(3000);
}
