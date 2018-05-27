/*
 * Based on the coding challenge: https://www.youtube.com/watch?v=LG8ZK-rRkXo
 * Some adjustments have been made to make the sponge fractal cooler and more
 *  rainbowy. As a part of this the blocks have been made a bit more see-through.
 */
float a = 0;
ArrayList<Box> sponge;

void setup() {
  size(400, 400, P3D);
  sponge = new ArrayList<Box>();
  Box b = new Box(0, 0, 0, 200);
  sponge.add(b);
}

void mousePressed() {
  ArrayList<Box> next = new ArrayList<Box>();
  for (Box b : sponge) {
    ArrayList<Box> newBoxes = b.generate();
    next.addAll(newBoxes);
  }
  sponge = next;
}

void draw() {
  background(51);
  stroke(255);
  noFill();
  lights();

  translate(width/2, height/2);
  rotateX(a);
  rotateY(a * 0.4);
  rotateZ(a * 0.1);
  for (Box b : sponge) {
    b.show();
  }

  a += 0.01;
}
