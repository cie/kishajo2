class Viewport implements Draggable , Drawable{
  float x, y, scale=1;
  
  int zIndex() {
    return -1;
  }
  
  void draw() {
    translate(width/2, height/2);
    scale(scale);
    translate(x-width/2,y-height/2);
  }
  
  
  float origX(float newX) {
    return (newX-width/2)/scale - x + width/2;
  }
  
  float origY(float newY) {
    return (newY-height/2)/scale - y + height/2;
  }
  
  float newX(float origX) {
    return (origX - width/2 + x) * scale + width/2;
  }
  
  float newY(float origY) {
    return (origY - height/2 + y) * scale + height/2;
  }
  
  
  void mouseDragged() {
    x += (mouseX-pmouseX)/scale;
    y += (mouseY-pmouseY)/scale;
  }
  
  void mousePressed() {
    dragmouseX = mouseX; dragmouseY = mouseY;
  }
  
  void mouseReleased() {
  }
  
  int cursor() {
    return mousePressed ? MOVE : (viewport.origY(mouseY) > height - part ? HAND : ARROW);
  }
  boolean hit() {
    return true;
  }
  
  
}
