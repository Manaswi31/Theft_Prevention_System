#ifndef SENDER_H
#define SENDER_H
enum {
AM_RSSIMSG = 10
};
typedef nx_struct RssiMsg{
nx_int16_t rssi;
} RssiMsg;
#endif
