class Hajo implements Draggable, Drawable, Tippable {
  float x, y, w = 15, h = 12, phi;
  float hullamv = parthullamv;
  
  int zIndex() {
    return 1;
  }
  
  Hajo(float ax, float ay, float aphi) {
    x = ax;
    y = ay;
    phi = aphi;
  }
  
  void draw() {
    if (dragSource == this && shipper.hit()) return;
    
    // beállítás
    strokeWeight(1);
    stroke(0);
    
    pushMatrix();
    
    translate(x,y);
    rotate(phi);
  
    // test
    fill(120);
    rect(-w/2, -h/2, w, h);
  
    // lámpa
    fill(piros);
    ellipse(+w/4, 0, w/4, w/4);
    
    popMatrix();
  

  }
  

  boolean hit() {
    return dist(viewport.origX(mouseX), viewport.origY(mouseY), x, y) < w;
  }
  
  void mousePressed() {
    if (mouseButton == LEFT) {
      ppmouseY = pmouseY; ppmouseX = pmouseX;  
    } else {
      Hullamver h = new Hullamver(this);
      add(h);
      dragSource = h;
    }
  }
  
  int ppmouseX, ppmouseY;
  
  void mouseDragged() {
    x = viewport.origX(mouseX);
    y = viewport.origY(mouseY);
    phi = atan2(mouseY-ppmouseY, mouseX-ppmouseX);
    ppmouseY = pmouseY; ppmouseX = pmouseX;
  }
  
  void mouseReleased() {
    if (shipper.hit()) {
      remove(this);
    }
  }
  
  int cursor() {
    return HAND;
  }
  
  String tooltip() {
    return nf(hullamv/parthullamv,0,ndig);
  }
  
  CircHullam createHullam() {
    return new CircHullam(x,y,hullamv);
  }
}

void add(Hajo hajo) {
  hajok.add(hajo);
  draggables.add(hajo);
}
void remove(Hajo hajo) {
  hajok.remove(hajo);
  draggables.remove(hajo);
}
