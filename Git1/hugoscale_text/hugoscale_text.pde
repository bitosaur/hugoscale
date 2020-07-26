    import processing.serial.*;
    Serial myPort;
    int x = 0;
    int lf = 10;
    String myString = null;
    float num;
    PFont font;


    void setup() {
      // setting canvas and fonts 
      size(1200, 800);
      surface.setTitle("Hugoscale");
      font = createFont ("Serif",height/2);
      textFont (font);  
      textAlign(CENTER,CENTER);

      // setting serial comm with Arduino Nano
      println(Serial.list());  //list of available serial ports
      String portName = Serial.list()[0]; //replace 0 with whatever port you want to use.
      myPort = new Serial(this, portName, 57600);
      
    }

    
    void draw() {
      while (myPort.available() > 0) {
        myString = myPort.readStringUntil(lf);
        if (myString != null) {
          print(myString);  // Prints String
          num=float(myString);  // Converts and prints float
          println(num);
          stroke(255, 255, 99); // RGB color set
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
      
      clear();
      fill(255);
      text(round(num),width/2,height/2);
    } 
