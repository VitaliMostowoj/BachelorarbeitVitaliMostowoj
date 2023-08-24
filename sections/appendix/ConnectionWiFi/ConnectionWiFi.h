#ifndef ConnectionWiFi_h
#define ConnectionWiFi_h

#include "Arduino.h"
#include "PubSubClient.h"               // Inkludieren der MQTT-Bibliothek

#include "ESP8266WiFi.h"                // Inkludieren von Bibliotheken fuer die WiFi Verbindung
#include "DNSServer.h"
#include "ESP8266WebServer.h"
#include "WiFiManager.h"  

#define mqttServer "192.168.0.109"      // Feste IP Adresse des Brokers
#define mqttPort 1883                   // Port des Brokers
#define mqttUser "username"             // Nutzername des MQTT Brokers
#define mqttPassword "password"         // Passwort des MQTT Brokers

extern WiFiClient espClient;            // Anlegen eines WiFiClient Objektes
extern PubSubClient client;             // Anlegen eines PubSubClient Objektes
 
// in der Header Datei des Mikrocontrollers wir diesem ein Name zum Verbinden gegeben
extern String client_name;  

// Message Klasse
class Message{
  public:
    String topic;
    String ort;
    String funktion;

    String inhalt;
    String einheit;

  public:
    Message();
    Message(String a, String b, String c, String d, String e);
    bool compare(String text);
    void print();
    void config(byte* payload,unsigned int &length, String &message_topic);
};

//WiFi Connection
void wifi_connect();
void configModeCallback (WiFiManager *myWiFiManager);

//MQTT Funktionen
String get_info(String topic, int which);
int find_pos(String input, char zeichen, int which);

// Connection Funktionen
void mqtt_connect();
void mqtt_reconnect();


#endif