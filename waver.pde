class Waver extends Widget {
  
  float left = 40, bottom = 40, r = 20;
  
  void mousePressed() {
    startWaves();
  }
  
  boolean hit() {
    return dist(mouseX, mouseY, left, height-bottom) < r;
  }
  
  void draw() {
    boolean hit=hit();
    float x = left,  y=height-bottom, dim = hit ? dimActive : dimNormal, w = 8;
    noFill();
    strokeWeight(w);
    stroke(wave, dim);
    ellipse(x, y, 2*r, 2*r);
    stroke(0, dim);
    strokeWeight(1);
    ellipse(x, y, 2*r+w/2+3, 2*r+w/2+3);
    ellipse(x, y, 2*r-w/2-3, 2*r-w/2-3);
  }
  
  void mouseReleased() {
  }
  
  void mouseDragged() {
  }

  String tooltip() {
    return lang.START;
  }
  
}