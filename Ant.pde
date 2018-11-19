public class Ant {
  int direction = 0;
  int x;
  int y;
  
  public Ant(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  void move() {
    switch(direction) {
      case 0: moveVertical(UP); break;
      case 1: moveHorisontal(RIGHT); break;
      case 2: moveVertical(DOWN); break;
      case 3: moveHorisontal(LEFT); break;
    }
  }
  
  private void moveVertical(int dir) {
    if (dir == UP) {
      y--;
      if (y < 0) {
        y = height - 1;
      }
    } else if (dir == DOWN) {
      y++;
      if (y > height - 1) {
        y = 0;
      }
    }
  }
  
  private void moveHorisontal(int dir) {
    if (dir == RIGHT) {
      x++;
      if (x > width - 1) {
        x = 0;
      }
    } else if (dir == LEFT) {
      x--;
      if (x < 0) {
        x = width - 1;
      }
    }
  }
  
  void turnRight() {
    direction++;
    if (direction > 3) {
      direction = 0;
    }
  }
  
  void turnLeft() {
    direction--;
    if (direction < 0) {
      direction = 3;
    }
  }
}
