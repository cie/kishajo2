
Shipper shipper;

void setup() {
  size(640, 480);
  smooth();
  add(new Hajo(width/2, height/2, 0));
  add(new Scaler());
  add(new Waver());
  add(shipper = new Shipper());
  add(new Stopper());
  add(new Parter());
  add(new Tooltip());
  uiSetup();
}

color
water= #056CAA,
sand = #FAE3B1,
wave = #B9FFFD,
piros = #FF0000,
feher = #FFFFFF,
helpColor= #7C5922;


float
part = 40,
v1 = 50,
v2 = 50,
waveSize = 8,
parthullamv = 50;

int ndig = 2; // number of digits



void draw() {
  thd = topHitDraggable();
  
  pushMatrix();
  
    viewport.draw();
    background(water);
    
    // tenger
    hullamok.drawAll();
    kotelek.drawAll();
  
    // tengerpart
    if (partShown) {
      fill(sand);
      noStroke();
      rect(-100000, height-part, 200000, 100000);
    }
    hajok.drawAll();
  
  popMatrix();
  
  // ui
  widgets.drawAll();
  tooltips.drawAll();
  
}




float dragThreshold = 5;



void restart() {
  frozenTime = -1;
  startWaves();
}

void clear() {
  hullamok.clear();
  kotelek.clear();
}


int frozenTime = -1;

float t() {
  if (frozenTime > 0) {
    return frozenTime;
  } else {
    return millis();
  }
}

void clearIfFrozen() {
  if (frozenTime > 0) {
    clear();
    frozenTime = -1;
  }
}

void mouseClicked() {
  if (mouseButton == LEFT) {
    if (thd instanceof Shipper) {
      Shipper s = ((Shipper) thd);
      s.altTooltip = true;
    } else if (thd instanceof Hajo) {
      clearIfFrozen();
      add(((Hajo) thd).createHullam());
    } else if (thd instanceof Viewport && viewport.origY(mouseY) > height-part && partShown) {
      clearIfFrozen();
      add(new LinHullam(height-part, -parthullamv));   
    }
  }
}