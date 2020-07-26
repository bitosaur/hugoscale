    import processing.serial.*;
    Serial myPort;
    int x = 0;
    int lf = 10;
    String myString = null;
    float num;
    PFont font;


    void setup() {
      size(1200, 800);
      println(Serial.list());  //list of available serial ports
      String portName = Serial.list()[0]; //replace 0 with whatever port you want to use.
      myPort = new Serial(this, portName, 57600);
      
      font = createFont ("Serif",height/4);
      textFont (font);
    }

    
  void draw() {
    while (myPort.available() > 0) {
      myString = myPort.readStringUntil(lf);
      if (myString != null) {
        print(myString);  // Prints String
        num=float(myString);  // Converts and prints float
        println(num);
        stroke(90, 76, 99); // RGB color set
        //vertical line with height varying according to input
        line(x, height, x, height - num); 
        if (x >=width) {
          x=0;
          background(0);
        }        
        x++;
      }
    }
    myPort.clear();
    
    textAlign(CENTER,CENTER);
    text(round(num),width/2,height/2);
    
  } 
