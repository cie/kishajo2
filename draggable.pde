interface Draggable {
  boolean hit();
  void mousePressed();
  void mouseDragged();
  void mouseReleased();
  int cursor();
  int zIndex();
}

interface Drawable {
  void draw();
}

class DList<E extends Drawable> extends ArrayList<E> {
  void drawAll() {
    for (Drawable d : this) {
      d.draw();
    }
  }
}

interface Tippable {
  String tooltip();
}
