#ifndef RECEIVER_H
#define RECEIVER_H
enum {
AM_RADIOMESSAGE = 6,
TIMER_PERIOD_INVITATION = 2000, // Invitation message interval
TIMER_PERIOD_SENSORDATA = 5000// Sensor data reporting interval
};
typedef nx_struct rssi {
nx_uint8_t DATA;
} rssi;
#endif
