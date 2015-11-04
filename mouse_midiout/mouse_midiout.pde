import processing.opengl.*;
import promidi.*;

MidiIO midiIO;
MidiOut midiOut;
Note note;

void setup(){
  size(300,400);
  background(0);
  smooth();
  //get an instance of MidiIO
  midiIO = MidiIO.getInstance(this);
  
  //print a list with all available devices
  midiIO.printDevices();
  
  //open an midiout using the first device and the first channel
  midiOut = midiIO.getMidiOut(0,0);
}

void draw(){
  
}

void mousePressed(){
  playNote();
}

void playNote(){
    note = new Note(49, 80,40);
    midiOut.sendNote(note);
  }
