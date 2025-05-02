class Bob {
  private float x, y ;
  private color c ;
  private float s ;
  private int leg_position ;
  private float speed;

    Bob (float x, float y, color c, float s,int leg_position, float speed ){
    this.x=x;
    this.y=y;
    this.c=c;
    this.s=s;
    this.leg_position=leg_position;
    this.speed=speed;
    }
    
   void display() {
    pushMatrix();
    translate(x, y); // Center on Bob's position
    
    // head
    fill(255, 224, 189); // skin color
    ellipse(0, -s * 0.5, s * 0.6, s * 0.6);
    
    // legs
    fill(0); // pants color
    float leg_movement=25;
    if (keyPressed) {
      if (keyCode == LEFT || keyCode == RIGHT){
      leg_position += abs(speed);
      leg_movement = sin(leg_position * 0.1) * s * speed * 0.03; // Further reduced speed multiplier
      }
    } else {
      leg_position = 0;
      leg_movement = 0;
    }
    rect(-s * 0.25, s * 0.25, s * 0.2, s * 0.5 + min(leg_movement,0));
    rect(s * 0.05, s * 0.25, s * 0.2, s * 0.5 - max(leg_movement,0));

    // body
    fill(c); // shirt color
    rect(-s * 0.5, -s * 0.25, s, s * 0.5);
        
    // arms
    fill(255, 224, 189); // skin color
    rect(-s * 0.7, -s * 0.25, s * 0.2, s * 0.5);
    rect(s * 0.5, -s * 0.25, s * 0.2, s * 0.5);

    popMatrix();
  }
  
  void changeSpeed(float deltaSpeed) {
    speed += deltaSpeed;
  }
  void slowDown() {
    if (speed > 0) {
      speed *= 0.94; 
    } else if (speed < 0) {
      speed *= 0.98;
    }
    if (abs(speed) < 0.1) {
      speed = 0;
    }
  }
  void limitPosition() {
    if (x <= s / 2 || x >= width - s / 2) {
      speed = 0;
    }
  }
  void move(float dx){
    x += dx;
    x = constrain(x, s / 2, width - s / 2);
  }
   
  // Getters
  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  color getColor() {
    return c;
  }

  float getSize() {
    return s;
  }

  int getLegPosition() {
    return leg_position;
  }

  float getSpeed() {
    return speed;
  }

  // Setters
  void setX(float x) {
    this.x = x;
  }

  void setY(float y) {
    this.y = y;
  }

  void setColor(color c) {
    this.c = c;
  }

  void setSize(float s) {
    this.s = s;
  }

  void setLegPosition(int leg_position) {
    this.leg_position = leg_position;
  }

  void setSpeed(float speed) {
    this.speed = speed;
  }
  void moveManage(){
    if (keyPressed) {
    if (keyCode == LEFT) {
      bob.changeSpeed(-0.5);
      firstMove = true;
    } else if (keyCode == RIGHT) {
      bob.changeSpeed(0.5);
      firstMove = true;
    }
  } else {
    if (firstMove) {
      bob.slowDown();
    } else {
      bob.setX(width / 2);
      bob.setSpeed(0);
    }
  }
  }
}
