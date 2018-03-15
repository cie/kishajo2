class Stopper extends Widget {
  float left = 40+80*1, bottom = 40, r = 20;
  
  boolean hit() {
    return dist(mouseX, mouseY, left, height-bottom) < r;
  }
  
  
  void draw() {
    boolean hit=hit();
    float x = left,  y=height-bottom, dim = (hit ? dimActive : dimNormal) + 60;

    // beállítás
    strokeWeight(2);
    stroke(0, dim);
    fill(piros, dim+30);

    // stop
    beginShape();
    for (float i = 0.5; i < 8; i+=1.0) {
      float phi = 2*PI/8*i;
      vertex(x + r*cos(phi), y + r*sin(phi));
    }
    endShape(CLOSE);
  }

  void mousePressed() {
    if (frozenTime < 0) {
      frozenTime=millis();
    } else {
      clear();
    }
  }

  void mouseDragged() {
  }

  void mouseReleased() {
  }
  
  String tooltip() {
    if (frozenTime < 0) {
      return lang.STOP;
    } else {
      return lang.CLEAR;
    }
  }

}