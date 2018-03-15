class Hullamver extends Scaler {
  Hajo hajo;
  float top,left;
  float base = 15;
  
  Hullamver(Hajo ahajo) {
    hajo = ahajo;
    x = log(ahajo.hullamv/parthullamv) / log(base) + 0.5;
    left = mouseX - w*x;
    top = mouseY - h/2;
  }
  
  float top() {
    return top;
  }

  float left() {
    return left;
  }

  String tooltip() {
    return nf(f()/parthullamv,0,ndig);
  }
  
  float f() {
    return parthullamv * pow(base,x-0.5);
  }
  
  void calc() {
    x = (mouseX-left())*1.0/w;
    //x = constrain(x, 0, 1);
  }

  void mouseDragged() {
    calc();
    hajo.hullamv=f();
  }
  void mousePressed() {
  }
  void mouseReleased() {
    remove(this);
  }
}
