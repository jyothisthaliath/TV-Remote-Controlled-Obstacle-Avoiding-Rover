#include <IRremote.h>
bool m1a,m2a,m1b,m2b,mod=LOW,pwr=HIGH,
fwd_dis=LOW,left_dis=LOW,right_dis=LOW;
int x=0,y=0,amb0=0,amb1=0,amb2=0,M1A=7,M1B=6,M2A=5,M2B=4,MOD=8,
RECV_PIN = 3,PWR_LED=13, s1=0, s2=0, s0=0;
static int j;
IRrecv irrecv(RECV_PIN);
decode_results results;
void setup()
{
Serial.begin(9600);
irrecv.enableIRIn(); // Start the receiver
pinMode(M1A, OUTPUT); pinMode(M1B, OUTPUT); pinMode(M2A,
OUTPUT);
pinMode(M2B, OUTPUT); pinMode(PWR_LED, OUTPUT);
amb0 = analogRead(0); amb1 = analogRead(1); amb2 = analogRead(2);
}
int signal()
{
int i;
if (irrecv.decode(&results))
{
switch(results.value)
{
case 0xFF52AD : i= 1; break;
case 0xFF7887 : i= 2; break;
case 0xFF42BD : i= 3; break;
case 0xFFB847 : i= 4; break;
case 0xFFE21D : i= 5; break;
case 0xFF02FD : i=6; break;
case 0xFFFFFFFF : i= j; break;
}
irrecv.resume(); // Receive the next value
j=i;
}
else i=0;
return i;
}
void fwd()
{
if(fwd_dis==LOW)
m1a=HIGH; m1b=LOW; m2a=HIGH; m2b=LOW;
}
void back()
{
m1a=LOW; m1b=HIGH; m2a=LOW; m2b=HIGH;
}
void left()
{
if(left_dis==LOW)
{
m1a=LOW; m1b=HIGH; m2a=HIGH; m2b=LOW;
}
}
void right()
{
if(right_dis==LOW)
{
m1a=HIGH; m1b=LOW; m2a=LOW; m2b=HIGH;
}
}
void idle()
{
m1a=LOW; m1b=LOW; m2a=LOW; m2b=LOW; }
void mode()
{
if (mod==LOW)
mod=HIGH;
else
mod=LOW;
}
void power()
{
if (pwr==LOW)
{
pwr=HIGH;
mod=LOW;
}
else
pwr=LOW;
}
void drive()
{
digitalWrite(M1A,m1a); digitalWrite(M2A,m2a);
digitalWrite(M1B,m1b); digitalWrite(M2B,m2b); digitalWrite(MOD,mod);
delay(100);
idle();
}
void sense()
{
s0 = analogRead(0); s1 = analogRead(1); s2 = analogRead(2);
if(s0>(amb0+80))
fwd_dis=HIGH;
else
fwd_dis=LOW;
if(s1>(amb1+20))
left_dis=HIGH;
else
left_dis=LOW;
if(s2>(amb2+20))
right_dis=HIGH;
else
right_dis=LOW;
}
void loop()
{
digitalWrite(PWR_LED,pwr);
sense();
x=signal();
if(x!=0||(x==0&&y==0))
{
if(x!=5 && mod==LOW && pwr==HIGH) //REMOTE DRIVE
{
switch(x)
{
case 0 : idle(); break;
case 1 : fwd(); break;
case 2 : back(); break;
case 3 : left(); break;
case 4 : right(); break;
}
drive();
}
else if(x==5 && pwr==HIGH) //AUTO DRIVE
mode();
if(x==6) //POWER CHANGE
power();
}
y=x;
}
