class Bob {
  private float x, y ;
  private color c ;
  private float s ;
  private int leg_position ;
  private float speed;
  Level level;

    Bob (float x, float y, color c, float s,int leg_position, float speed){
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
    speed *= 0.98;
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
   
  void setLevel(Level lvl){
    level=lvl;
  }
  void moveManage(){
    if (keyPressed) {
    if (keyCode == LEFT) {
      this.changeSpeed(-0.5);
      firstMove = true;
    } else if (keyCode == RIGHT) {
      this.changeSpeed(0.5);
      firstMove = true;
    }
    } else {
    if (firstMove) {
      this.slowDown();
    } else {
      this.x=width / 2;
      this.speed=0;
    }
  }
  }
  void bobMain(){
    moveManage();
    move(bob.speed);
    limitPosition();
  }
}
