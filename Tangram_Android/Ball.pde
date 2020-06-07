class Ball {

  float x, y;
  color ballColor;
  float radius;
  float dx;
  float dy;
  String name;

  Ball(float r, color c, float vx,float vy,String tempname) {
    x = random(width);
    y = random(height);
    ballColor = c;
    radius = r;
    name = tempname;
    dx = vx;
    dy = vy;
  }

  void display() {
    noStroke();

    textSize(25*displayDensity);

    fill(ballColor);
    ellipse(x, y, radius*2, radius*2);
    fill(0);
    text(name, x-(radius-25), y-(radius/2) ,2*radius,2*radius );
    move();
    bounce();
  }

  void move() {
    x += dx;
    y += dy;
  }

  void bounce() {
    if (x > (width -radius)) {
      x = width -radius;
      dx = -dx;
    } else if (x < radius) {
      x = radius;
      dx = -dx;
    }

    if ( y > (height -radius)) {
      y= height -radius;
      dy = -dy;
    } else if (y < radius) {
      y = radius;
      dy = -dy;
    }
  }
}
