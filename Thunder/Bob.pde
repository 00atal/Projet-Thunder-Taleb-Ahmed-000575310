class Bob {
  float x, y;
  color c;
  float s;
  int leg_position;
  float speed;

  Bob(float x, float y, color c, float s, int leg_position, float speed) {
    this.x = x;
    this.y = y;
    this.c = c;
    this.s = s;
    this.leg_position = leg_position;
    this.speed = speed;
  }

  void display() {
    pushMatrix();
    translate(x, y);

    // head
    fill(255, 224, 189);
    ellipse(0, -s * 0.5, s * 0.6, s * 0.6);

    // legs
    fill(0);
    float leg_movement;
    if (keyPressed) {
      leg_position += abs(speed);
      leg_movement = sin(leg_position * 0.1) * s * speed * 0.03;
    } else {
      leg_position = 0;
      leg_movement = 0;
    }
    rect(-s * 0.25, s * 0.25, s * 0.2, s * 0.5 + min(leg_movement, 0));
    rect(s * 0.05, s * 0.25, s * 0.2, s * 0.5 - max(leg_movement, 0));

    // body
    fill(c);
    rect(-s * 0.5, -s * 0.25, s, s * 0.5);

    // arms
    fill(255, 224, 189);
    rect(-s * 0.7, -s * 0.25, s * 0.2, s * 0.5);
    rect(s * 0.5, -s * 0.25, s * 0.2, s * 0.5);

    popMatrix();
  }
}
