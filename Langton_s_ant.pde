Ant ant;
color[] gridColors;
int[][] grid;
PImage img;

String pattern = "RLLR";

void setup() {
  size(600, 600);
  gridColors = new color[pattern.length()];
  for (int i = 0; i < pattern.length(); i++) {
    gridColors[i] = color(random(255), random(255), random(255));
  }
  
  ant = new Ant(width / 2, height / 2);
  grid = new int[width][height];
  
  img = createImage(width, height, RGB);
  img.loadPixels();
  for (int i = 0; i < img.pixels.length; i++) {
    img.pixels[i] = color(255);
  }
  img.updatePixels();
}

void draw() {
  background(255);
  img.loadPixels();
  for (int i = 0; i < 3000; i++) {
    int state = grid[ant.x][ant.y];
    
    String[] turns = pattern.split("");
    if (turns[state].equals("R")) { //<>//
      ant.turnRight(); //<>//
    } else if (turns[state].equals("L")) {
      ant.turnLeft(); //<>//
    }
    
    // next state
    grid[ant.x][ant.y]++;
    if (grid[ant.x][ant.y] >= turns.length) {
      grid[ant.x][ant.y] = 0;
    }
    
    int pix = ant.x + width * ant.y;
    img.pixels[pix] = gridColors[state];
    ant.move();
  }
  img.updatePixels();
  
  image(img, 0, 0);
}
