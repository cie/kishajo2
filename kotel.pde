class Kotel implements Drawable{

  ArrayList<PVector> points = new ArrayList<PVector>();
  boolean started;
  Hullam h1; CircHullam c2;
  double sign = 1, x, y;
  double d; // discriminant
  
  Kotel(Hullam ah1, CircHullam ah2, float asign) {
    h1 = ah1;
    c2 = ah2;
    sign = asign;
  }
  
  double sq(double x) {
    return x*x;
  }
  
  double pow(double x, double e) {
    return Math.pow(x,e);
  }
  
  double sqrt(double x) {
    return Math.sqrt(x);
  }
  
  double dist(double x1, double y1, double x2, double y2) {
    return sqrt(sq(x2-x1)+sq(y2-y1));
  }
  
  void update() {
    /*
      http://stackoverflow.com/questions/5238566/intersection-points-of-two-circles-in-matlab
      Assume a triangle ABC, where A and B are the centers of the circle, and C is one or the other
      intersection point. a, b, and c are the sides opposite the corresponding corners. alpha, beta,
      and gamma are the angles associated with A, B, and C, respectively.
      Then, b^2+c^2 - 2*b*c*cos(alpha) = a^2. Knowing alpha (or its cosine), you can find the location of C. 
    */
    if (h1 instanceof CircHullam) {
      CircHullam c1 = (CircHullam) h1;
      double 
        a = c2.r, b = c1.r,
        c = dist(c1.x, c1.y, c2.x, c2.y), //distance between circles
        cosAlpha = (pow(b,2)+pow(c,2)-pow(a,2))/(2*b*c),
        ux = (c2.x - c1.x)/c, // unit vector from first to second center
        uy = (c2.y - c1.y)/c,
        pux = uy, // perpendicular vector to unit vector
        puy = -ux;
      d = 1-pow(cosAlpha,2);
      x = c1.x + ux * (b*cosAlpha) + sign * pux * (b*sqrt(d));
      y = c1.y + uy * (b*cosAlpha) + sign * puy * (b*sqrt(d));
    } else {
      LinHullam l = (LinHullam) h1;
      y = l.y;
      double r2 = c2.r,
      // (x-hajox)^2+(y-hajoy)^2=r2^2, y=y1
      // x^2-(2*hajox)*x+(hajox^2-r2^2+(y1-hajoy)^2)=0
      a=1, b=-2*c2.x, c=sq(c2.x)-sq(r2)+sq(y-c2.y),
      d=sq(b)-4*a*c;
      x = (-b+sign*sqrt(d))/2/a;
    }
    points.add(new PVector((float)x,(float)y,millis()));

  }
  
  void draw() {
    update();
     // kötél
    stroke(piros); strokeWeight(4); noFill();
    
    // alja 
    beginShape();
    for (PVector v: points) {
      vertex(v.x, v.y);
    }
    endShape();
    
    // teteje
    
    stroke(feher); strokeWeight(4);
    int tau = 250; // fél periódusidő, ms
    
    // teteje 
    for (PVector v: points) {
      tollat((int(v.z) / tau % 2  == 0) ^ sign < 0);
      gotoXY(v.x, v.y);
    }
    tollat(false);
    
    // gömbök
    int gombMeret = 8;
    strokeWeight(1); stroke(0);
    fill(piros);
    ellipse((float)x,(float)y,gombMeret,gombMeret);
  }
  
  
  boolean toll; // lent van-e a toll
  
  // leteszi vagy felveszi a tollat
  void tollat(boolean newToll) {
    if (!toll && newToll) {
      toll = true;
      beginShape();
    }
    if (toll && !newToll) {
      toll = false;
      endShape();
    }
  }
  
  void gotoXY(float x, float y) {
    if (toll) {
      vertex(x,y);
    }
  }
}


DList<Kotel> kotelek =  new DList<Kotel>();
void add(Kotel kotel) {
  kotelek.add(kotel);
}