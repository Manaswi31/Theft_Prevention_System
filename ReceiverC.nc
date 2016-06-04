#include <Timer.h>
#include "Receiver.h"
module ReceiverC {
uses interface Boot;
uses interface Leds;
uses interface Timer<TMilli> as Timer0;
uses interface AMPacket;
uses interface Packet as RadioPacket;
uses interface Receive as RadioReceive;
uses interface SplitControl as AMRadioControl;
uses interface CC2420Packet;
}
implementation {
bool radiobusy = FALSE;
bool serialbusy = FALSE;
message_t radiopkt;
message_t serialpkt;
bool isRoot = TRUE ;
event void Boot.booted(){
  call AMRadioControl.start();
}
event void AMRadioControl.startDone(error_t err) {
  if (err == SUCCESS) {
    if (isRoot) {
    call Timer0.startPeriodic(2000);
    }
}
  else
  {
  call AMRadioControl.start();
  }
}
event void AMRadioControl.stopDone(error_t err) {
  call AMRadioControl.start();
}
event void Timer0.fired(){
  uint8_t *serialptr;
  if (!serialbusy)
  {
    serialptr = (uint8_t*) malloc(100);
    serialbusy = TRUE;
    }
  }
event message_t *RadioReceive.receive(message_t *msg, void *payload, uint8_t len)
{
  uint8_t *RSSI;
  call Leds.led0Toggle();
  if (len == sizeof(rssi))
  {
    call Leds.led1Toggle();
    RSSI = (uint8_t*) malloc(1);
    memcpy(RSSI,call CC2420Packet.getRssi(msg),1);
    if(*RSSI<100)
    {
      call Leds.led2Toggle(); //Lock Signal or Alarm rings
    }
  }
  return msg;
}
}
