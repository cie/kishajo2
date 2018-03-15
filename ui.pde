 
ArrayList<Draggable> draggables =  new ArrayList<Draggable>();
DList<Hajo> hajok =  new DList<Hajo>();
DList<Drawable> widgets = new DList<Drawable>();
DList<Tooltip> tooltips = new DList<Tooltip>();

Viewport viewport = new Viewport();



  float dimActive=120, dimNormal = 80;
  
void uiSetup() {
  draggables.add(viewport);
}




  
void mouseMoved() {
  thd = topHitDraggable();
  if (!mousePressed) {
    cursor(thd.cursor());
  }
}

void mouseDragged() {
  thd = topHitDraggable();
  if (dragSource != null) {
    dragSource.mouseDragged();
  }
}

Draggable thd;

Draggable topHitDraggable() {
  Draggable result = null;
  int zIndex = 0;
  for (Draggable d : draggables) {
    if (d.hit()) {
      if (result == null || d.zIndex() > zIndex) {
        result = d;
        zIndex = d.zIndex();
      }
    }
  }
  return result;
}

int dragmouseX, dragmouseY;
Draggable dragSource;

void mousePressed() {
  thd = topHitDraggable();
  dragSource = thd;
  dragSource.mousePressed();
  cursor(dragSource.cursor());
}


void mouseReleased() {
  if (null != dragSource) {
    dragSource.mouseReleased();
    dragSource = null;
  }
}