import processing.serial.*;
import ddf.minim.*;
import ddf.minim.signals.*;

Serial myPort;
Minim minim;
AudioSample C;
AudioSample D;
AudioSample E;
AudioSample G;
AudioSample A;
PImage backImage;
PFont font;

float x = 0;

int screen = 0;

int val [] = new int [38];
int temp [] = new int [38];

void setup() {
  size(100, 100);
  myPort = new Serial(this, "/dev/cu.usbmodem1421", 9600);
  //backImage = loadImage("back.png");
  //font = loadFont("DevanagariMT-Bold-250.vlw");
  minim = new Minim(this);
  C = minim.loadSample( "do.mp3", 512);
  D = minim.loadSample( "re.mp3", 512);
  E = minim.loadSample( "mi.mp3", 512);
  G = minim.loadSample( "so.mp3", 512);
  A = minim.loadSample( "la.mp3", 512);
  //textFont( font );
  for (int i=0; i<38; i++) {
    val[i] = 0;
  }
  for (int i=0; i<38; i++) {
    temp[i] = 1;
  }
}

void draw() {
  background(255);  

  //do1
  if (val[0]==0 || val[3]==0 || val[9]==0 || val[13]==0 || val[16]==0 || val[22]==0 || val[25]==0 || val[37]==0) {
    C.trigger();
  }
  //re1
  if (val[1]==0 || val[4]==0 || val[8]==0 || val[10]==0 || val[12]==0 || val[14]==0 || val[17]==0 || val[21]==0 || val[23]==0 || val[35]==0 || val[36]==0) {
    D.trigger();
  }
  //mi1
  if (val[2]==0 || val[5]==0 || val[7]==0 || val[11]==0  || val[15]==0 || val[18]==0 || val[20]==0 || val[24]==0 || val[28]==0 || val[33]==0 || val[34]==0) {
    E.trigger();
  }
  //so1
  if (val[6]==0 || val[19]==0 || val[26]==0 || val[27]==0 || val[29]==0 || val[32]==0) {
    G.trigger();
  }
  //la
  if (val[30]==0 || val[31]==0) {
    A.trigger();
  }
}

void serialEvent(Serial p) {
  String vs = p.readStringUntil('\n');
  println(vs);
  if (vs != null) {
    vs = trim(vs);
    String [] value = split(vs, ','); 

    if (value.length > 8) {
      for (int i=0; i<8; i++) {
        val[i] =int(value[i]);
        
      }
    }
  }
}

