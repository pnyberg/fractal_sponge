/*
 * A box with a size and a 3D-coordinate
 * The box has a method for generating 20 new boxes 
 *  from an already existing box (all sub-boxes for 
 *  a 3x3x3 box except for the ones going "right 
 *  through" the center-point).
 */
class Box {
  PVector pos;
  float r;

  Box(float x, float y, float z, float r_) {
    pos = new PVector(x, y, z);
    r = r_;
  }

  /*
   * Generate 20 new boxes to "replace" the
   *  old box.
   */
  ArrayList<Box> generate() {
    ArrayList<Box> boxes = new ArrayList<Box>();
    for (int x = -1; x < 2; x++) {
      for (int y = -1; y < 2; y++) {
        for (int z = -1; z < 2; z++) {

          // at least two of the three axises cannot be "centered"
          if ((abs(x) + abs(y) + abs(z)) > 1) {
            float newR = r/3;
            Box b = new Box(pos.x + x * newR, pos.y + y * newR, pos.z + z * newR, newR);
            boxes.add(b);
          }
        }
      }
    }
    return boxes;
  }

  void show() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    noStroke(); // no strokes looks nicer

    // rainbow-coloring the sponge
    fill(pos.x, pos.y, pos.z, 200);
    box(r);
    popMatrix();
  }
}
