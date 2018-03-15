class Scaler extends Widget {
  float margin=30, w=140, h=20, x=0.5;
  boolean dragging;

  void draw() {
    strokeWeight(1);
    float top = top(), left = left();
    // doboz
    boolean active = active();
    float dim =active ? dimActive : dimNormal; 
    stroke(0, dim);
    fill(wave, dim);
    rect(left, top, w,h);

    // |
    stroke(piros);
    float tick = x*w+left;
    line(tick, top, tick, top + h);   
    
    // +-
    stroke(0);
    float l = 0.6 * h, margin2 = (h-l)/2;
    // -
    line(left-h+margin2, top+h/2,     left-margin2, top + h/2);   
    // +
    line(left+w+margin2, top+h/2,     left+w+h-margin2, top + h/2); 
    line(left+w+h/2,     top+margin2, left+w+h/2,     top + h - margin2);   
  }
  
  float top() {
    return height-margin-h;
  }
  float left() {
    return width-margin-w;
  }
  
  boolean active() {
    return dragging || (!mousePressed && hit());
  }
  
  boolean hit() {
    return left() < mouseX && mouseX < left()+w && top() < mouseY && mouseY < top()+ h;
  }
  
  void mousePressed() {
    dragging = true;
    calc();
  }
  
  void calc() {
    x = (mouseX-left())*1.0/w;
    x = constrain(x, 0, 1);
  }
  
  void mouseDragged() {
    calc();
    viewport.scale=f();
  }
  
  float f() {
    return pow(15.0,x-0.5);
  }
  
  void mouseReleased() {
    dragging = false;
  }

  String tooltip() {
    return lang.SCALER;
  }
  
}