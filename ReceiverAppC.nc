#include <Timer.h>
#include <Serial.h>
#include "Receiver.h"
configuration ReceiverAppC {
}
implementation {
components MainC;
components LedsC;
components ReceiverC as App;
components CC2420ActiveMessageC;
components new TimerMilliC() as Timer0;
// For Radio Communication
components ActiveMessageC;
components new AMReceiverC(AM_RADIOMESSAGE);
App.Boot ->MainC;
App.Leds ->LedsC;
App.Timer0 -> Timer0;
App.AMRadioControl -> ActiveMessageC;
App.RadioReceive -> AMReceiverC;
App -> CC2420ActiveMessageC.CC2420Packet;
}
