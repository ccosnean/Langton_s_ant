ArrayList<Ant> ants;

color[] gridColors;
int[][] grid;
PImage img;

int stepsPerFrame = 1000;
String pattern = "LR";

void setup() {
  size(600, 600);
  
  gridColors = new color[pattern.length()];
  for (int i = 0; i < pattern.length(); i++) {
    gridColors[i] = color(random(255), random(255), random(255));
  }

  grid = new int[width][height];
  
  img = createImage(width, height, RGB);
  img.loadPixels();
  for (int i = 0; i < img.pixels.length; i++) {
    img.pixels[i] = color(255);
  }
  img.updatePixels();
  
  int midX = width / 2;
  int midY = height / 2;
  ants = new ArrayList<Ant>();
  ants.add(new Ant(midX, midY));
  ants.add(new Ant(midX, midY));
  ants.add(new Ant(midX, midY));
  ants.add(new Ant(midX, midY));
}

void draw() {
  background(255);
  img.loadPixels();
  for (int i = 0; i < stepsPerFrame; i++) {
    String[] turns = pattern.split("");
    for (int index = 0; index < ants.size(); index++) {
      Ant ant = ants.get(index);
      int state = grid[ant.x][ant.y];
      if (turns[state].equals("R")) {
        ant.turnRight();
      } else if (turns[state].equals("L")) {
        ant.turnLeft();
      }
      
      grid[ant.x][ant.y]++;
      if (grid[ant.x][ant.y] >= turns.length) {
        grid[ant.x][ant.y] = 0;
      }
      
      int pix = ant.x + width * ant.y;
      img.pixels[pix] = gridColors[state];
      ant.move();
    } //<>// //<>// //<>//
  }
  img.updatePixels();
  
  image(img, 0, 0);
}
