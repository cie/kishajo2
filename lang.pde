class Lang {
  String PART_OFF, PART_ON, SHIPPER, SHIPPER_INSTRUCTION, START, STOP, CLEAR, SCALER;
}
Lang hu = new Lang() {{
  PART_OFF = "Part kikapcsolás";
  PART_ON = "Part bekapcsolás";
  SHIPPER = "Hajóraktár";
  SHIPPER_INSTRUCTION = "Húzz bele vagy húzz ki belőle hajókat!";
  START = "Indítás";
  STOP = "Leállítás";
  CLEAR = "Törlés";
  SCALER = "Kicsinyítés - Nagyítás";
}};

Lang en = new Lang() {{
  PART_OFF = "Turn coast off";
  PART_ON = "Turn coast on";
  SHIPPER = "Shipyard";
  SHIPPER_INSTRUCTION = "Drag ships out of here and into here";
  START = "Start";
  STOP = "Stop";
  CLEAR = "Clear";
  SCALER = "Zoom in/out";
}};

Lang lang = en;  
/*
class Langer extends Widget {
  void draw() {
  }
  void mousePressed() {}
  void mouseReleased() {}
  void mouseDragged() {}
  boolean hit() {return false;}
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
  
}*/