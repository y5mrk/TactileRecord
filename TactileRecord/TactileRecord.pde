import processing.serial.*;
import processing.opengl.*;
import promidi.*;

Serial myPort;
MidiIO midiIO;
MidiOut midiOut;
Note note;

float x = 0;

int countd = 100;
int countr = 100;
int countm = 100;
int counts = 100;
int countl = 100;

int val [] = new int [48];
int temp [] = new int [48];
int sa [] = new int [48];
String oto = "s";

void setup() {
  size(100, 100);
  myPort = new Serial(this, "/dev/cu.usbmodem1411", 9600);
  //get an instance of MidiIO
  midiIO = MidiIO.getInstance(this);
  //print a list with all available devices
  midiIO.printDevices();
  //open an midiout using the first device and the first channel
  midiOut = midiIO.getMidiOut(0, 0);

  for (int i=0; i<48; i++) {
    val[i] = 0;
  }
}

void draw() {
  background(255);
  for (int i=0; i<48; i++) {
    sa[i] = temp[i]-val[i];
  }
  println(sa);
  //do1
  if (sa[0]>0 || sa[3]>0 || sa[9]>0 || sa[13]>0 || sa[16]>0 || sa[22]>0 || sa[25]>0 || sa[37]>0) {
    playNote();
  }
  //re1
  if (sa[1]>0 || sa[4]>0 || sa[8]>0 || sa[10]>0 || sa[12]>0 || sa[14]>0 || sa[17]>0 || sa[21]>0 || sa[23]>0 || sa[35]>0 || sa[36]>0) {
    playNote();
  }
  //mi1
  if (sa[2]>0 || sa[5]>0 || sa[7]>0 || sa[11]>0  || sa[15]>0 || sa[18]>0 || sa[20]>0 || sa[24]>0 || sa[28]>0 || sa[33]>0 || sa[34]>0) {
    playNote();
  }
  //so1
  if (sa[6]>0 || sa[19]>0 || sa[26]>0 || sa[27]>0 || sa[29]>0 || sa[32]>0) {
    playNote();
  }
  //la
  if (sa[30]>0 || sa[31]>0) {
    playNote();
  }
  /*if (countd>100) {
   do1.play(0);
   countd = 0;
   }
   if (countr>100) {
   re1.play(0);
   countr = 0;
   }
   if (countm>100) {
   mi1.play(0);
   countm = 0;
   }
   if (counts>100) {
   so1.play(0);
   counts = 0;
   }
   if (countl>100) {
   la1.play(0);
   countl = 0;
   }*/
}

void serialEvent(Serial p) {
  String vs = p.readStringUntil('\n');

  if (vs != null) {
    vs = trim(vs);
    String [] value = split(vs, ','); 

    if (value.length > 47) {
      for (int i=0; i<48; i++) {
        temp[i] = val[i];
      }
      for (int i=0; i<48; i++) {
        val[i] =int(value[i]);
        //println(value);
      }
    }
  }
}

void playNote() {
  note = new Note(49, 80, 40);
  midiOut.sendNote(note);
}

