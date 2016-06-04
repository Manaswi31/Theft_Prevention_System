#include "Sender.h"
module SenderC
{
  uses interface Boot;
  uses interface Timer<TMilli> as SendTimer;
  uses interface AMSend as RssiMsgSend;
  uses interface SplitControl as RadioControl;
  uses interface Leds;
}
implementation
{
  message_t msg;
  event void Boot.booted(){
  call RadioControl.start();
}
event void RadioControl.startDone(error_t result){
  call SendTimer.startPeriodic(250);
}
event void RadioControl.stopDone(error_t result){}
event void SendTimer.fired(){
  call RssiMsgSend.send(AM_BROADCAST_ADDR, &msg, sizeof(RssiMsg));
  call Leds.led2Toggle();
}
event void RssiMsgSend.sendDone(message_t *m, error_t error){}
}

