void bubble(float x, float y, float w, float h, float rx, float ry, float a, float ra) {
  beginShape(); 
  // source: http://forum.processing.org/topic/rounded-rectangle
  float ag = 0.6;
  
  vertex(x,y+ry); //top of left side 
  bezierVertex(x,y,x,y,x+rx,y); //top left corner
  
  vertex(x+w-rx,y); //right of top side 
  bezierVertex(x+w,y,x+w,y,x+w,y+ry); //top right corner
  
  vertex(x+w,y+h-ry); //bottom of right side
  bezierVertex(x+w,y+h,x+w,y+h,x+w-rx,y+h); //bottom right corner
  
  
  vertex(x+a+ra,y+h); //right of tail
  bezierVertex(x+a+ra-ra*ag,y+h,x+a,y+h+ra-ra*ag,x+a,y+h+ra); // tip of tail
  bezierVertex(x+a,y+h+ra-ra*ag,x+a-ra+ra*ag,y+h,x+a-ra,y+h); //left of tail  
  
  vertex(x+rx,y+h); //left of bottom side
  bezierVertex(x,y+h,x,y+h,x,y+h-ry); //bottom left corner
  
  endShape(CLOSE);
}
