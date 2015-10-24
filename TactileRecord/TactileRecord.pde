import processing.serial.*;
import ddf.minim.*;
import ddf.minim.signals.*;

Serial myPort;
Minim minim;
AudioSnippet player;
AudioSnippet do1;
AudioSnippet re1;
AudioSnippet mi1;
AudioSnippet so1;
AudioSnippet la1;
AudioOutput out;
PImage backImage;
PFont font;

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
  myPort = new Serial(this, "/dev/cu.usbmodem1421", 9600);
  //backImage = loadImage("back.png");
  //font = loadFont("DevanagariMT-Bold-250.vlw");
  minim = new Minim(this);
  do1  =  minim.loadSnippet("c1.mp3");
  re1  =  minim.loadSnippet("d1.mp3");
  mi1  =  minim.loadSnippet("e1.mp3");
  so1  =  minim.loadSnippet("g1.mp3");
  la1  =  minim.loadSnippet("a1.mp3");
  //textFont( font );
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
    /*if (oto == "d") {
     
    }*/
    if (oto == "r") {
      re1.pause();
       do1.rewind();
    }
    if (oto == "m") {
      mi1.pause();
       do1.rewind();
    }
    if (oto == "s") {
      so1.pause();
       do1.rewind();
    }
    if (oto == "l") {
      la1.pause();
       do1.rewind();
    }
    do1.play();
    oto = "d";
  }
  //re1
  if (sa[1]>0 || sa[4]>0 || sa[8]>0 || sa[10]>0 || sa[12]>0 || sa[14]>0 || sa[17]>0 || sa[21]>0 || sa[23]>0 || sa[35]>0 || sa[36]>0) {
    if (oto == "d") {
      do1.pause();
      re1.rewind();
    }
    if (oto == "m") {
      mi1.pause();
      re1.rewind();
    }
    if (oto == "s") {
      so1.pause();
      re1.rewind();
    }
    if (oto == "l") {
      la1.pause();
      re1.rewind();
    }
    re1.play();
    oto = "r";
  }
  //mi1
  if (sa[2]>0 || sa[5]>0 || sa[7]>0 || sa[11]>0  || sa[15]>0 || sa[18]>0 || sa[20]>0 || sa[24]>0 || sa[28]>0 || sa[33]>0 || sa[34]>0) {
    if (oto == "d") {
      do1.pause();
      mi1.rewind();
    }
    if (oto == "r") {
      re1.pause();
      mi1.rewind();
    }
    if (oto == "s") {
      so1.pause();
      mi1.rewind();
    }
    if (oto == "l") {
      la1.pause();
      mi1.rewind();
    }
    mi1.play();
    oto = "m";
  }
  //so1
  if (sa[6]>0 || sa[19]>0 || sa[26]>0 || sa[27]>0 || sa[29]>0 || sa[32]>0) {
    if (oto == "d") {
      do1.pause();
      so1.rewind();
    }
    if (oto == "r") {
      re1.pause();
      so1.rewind();
    }
    if (oto == "m") {
      mi1.pause();
      so1.rewind();
    }
    if (oto == "l") {
      la1.pause();
      so1.rewind();
    }
    so1.play();
    oto = "s";
  }
  //la
  if (sa[30]>0 || sa[31]>0) {
   if (oto == "d") {
      do1.pause();
      la1.rewind();
    }
    if (oto == "r") {
      re1.pause();
      la1.rewind();
    }
    if (oto == "m") {
      mi1.pause();
      la1.rewind();
    }
    if (oto == "s") {
      so1.pause();
      la1.rewind();
    }
   la1.play();
   oto = "l";
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

