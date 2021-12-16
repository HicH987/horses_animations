

class Sprite {
  float x, y, w, speed, index;
  int len;
  ArrayList<PImage> animation;
  color tint;

  Sprite(ArrayList<PImage> animation_, float x_, float y_, float speed_, color c) {
    tint = c;
    x = x_;
    y = y_;
    animation = animation_;
    w = animation.get(0).width;
    len = animation.size();
    speed = speed_;
    index = 0;
  }

  void show() {
    int index = floor(this.index) % len;
    image(animation.get(index), x, y);
    tint(this.tint);
  }

  void animate() {
    this.index += this.speed;
    // println(this.index);
    this.x += this.speed * 15;

    if (this.x > width) {
      this.x = -this.w;
      horseOut = true;
    }
  }

}


