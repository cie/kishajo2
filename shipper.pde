class Shipper extends Widget {

  float left = 40+80*2, bottom = 40, r = 20,  w = r*2-5, h = w*12/15;

  
  boolean hit() {
    return dist(mouseX, mouseY, left, height-bottom) < r;
  }

  void draw() {
    boolean hit=hit();
    float x = left,  y=height-bottom, dim = (hit ? dimActive : dimNormal) + 60;

    // beállítás
    strokeWeight(1);
    stroke(0, dim);

    // test
    fill(120, dim);
    rect(x-w/2, y-h/2, w, h);

    // lámpa
    fill(piros, dim);
    ellipse(x+w/4, y, w/4, w/4);
  }

  void mousePressed() {
    Hajo h = new Hajo(viewport.origX(mouseX), viewport.origY(mouseY), random(0,2*PI));
    add(h);
    dragSource = h;
  }

  void mouseDragged() {
  }

  void mouseReleased() {
  }

  boolean altTooltip = false;  // see main#mouseClicked
  String tooltip() {
    return altTooltip ? lang.SHIPPER_INSTRUCTION : lang.SHIPPER;
  }



}