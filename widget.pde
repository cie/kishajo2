abstract class Widget implements Drawable, Draggable, Tippable {
  
  int zIndex() {
    return 10;
  }


  int cursor() {
    return HAND;
  }
  
  String tooltip() {
    return null;
  }
}

void add(Widget w) {
  draggables.add(w);
  widgets.add(w);
}
void remove(Widget w) {
  draggables.remove(w);
  widgets.remove(w);
}
