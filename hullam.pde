abstract class Hullam implements Drawable {
  double startt, v;
  
  Hullam() {
    startt=t();
  }
  
  void draw() {
   // hullám 1
    strokeWeight(1);
    noFill();
  
    for(float i = 0; i < waveSize; ++i) {
      stroke(wave, 255*pow(norm(i, waveSize, 0), 2));
      draw(i);
    }
  }

  abstract void draw(double i);
  
}

class LinHullam extends Hullam {
  double y0, y;
  
  LinHullam(float ay0, float av) {
    y0 = ay0; v = av;
  }
  
  void draw(double i) {
    y = y0 + (t() - startt) * v / 1000.0;
    line(-100000, (float)(y+i), 100000, (float)(y+i));
  }
}

class CircHullam extends Hullam {
  double x, y, r;
  
  CircHullam(double ax, double ay, double av) {
    x = ax; y = ay; v = av;
  }
  
  void draw(double i) {
    r = (t()-startt) * v / 1000.0;
    ellipse((float)x, (float)y, (float)(2*r-i), (float)(2*r-i));
  }
}

 
    

DList<Hullam> hullamok = new DList<Hullam>();

void add(Hullam h1) {
  if (h1 instanceof CircHullam) {
    for (Hullam h2 : hullamok) {
      add(new Kotel(h2, (CircHullam)h1, 1.0));
      add(new Kotel(h2, (CircHullam)h1, -1.0));
    }
  } else {
    for (Hullam h2 : hullamok) {
      if (h2 instanceof CircHullam) {
        add(new Kotel(h1, (CircHullam)h2, 1.0));
        add(new Kotel(h1, (CircHullam)h2, -1.0));
      }
    }
  }
  hullamok.add(h1);
}

void startWaves() {
  clearIfFrozen();
  
  for (Hajo hajo : hajok) {
    add(hajo.createHullam());
  }
  
  if (partShown) {
    add(new LinHullam(height-part, -parthullamv));
  }
}