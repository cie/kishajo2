class Parter extends Widget {
  
  float left = 40+80*3, bottom = 40, r = 20;
  
  boolean hit() {
    return dist(mouseX, mouseY, left, height-bottom) < r;
  }
  
  
  void draw() {
    boolean hit=hit();
    float x = left,  y=height-bottom, dim = (hit ? dimActive : dimNormal) + 60;

    // beállítás
    noStroke();
    fill(lerpColor(#000000, sand, (partShown ? 0.6 : 1)), dim+30);

    rect(x-30,y,60,20);
  }

  void mousePressed() {
    partShown = !partShown;
  }

  void mouseDragged() {
  }

  void mouseReleased() {
  }
  
  String tooltip() {
    if (partShown) {
      return lang.PART_OFF;
    } else {
      return lang.PART_ON;
    }
  }

}

boolean partShown = true;