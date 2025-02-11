import java.util.*;

float particleMultiplier = 1;  // Default: 1
float fireworkSize       = 3;  // Default: 3
int numFireworks         = 10; // Default: 10
ArrayList<Firework> fireworks;
ArrayList<Particle> particles;

void setup() {
  //size(1000, 1000);
  fullScreen();
  noStroke();
  noCursor();
  
  fireworks = new ArrayList<Firework>();
  particles = new ArrayList<Particle>();
  
  for (int i = 0; i < numFireworks; i++) {
    fireworks.add(new Firework(i * 0.5));
  }
  
  
}

void draw() {
  background(0);
  
  // Draw and update fireworks
  for (Firework f : fireworks) {
    f.draw();
    f.update();
  }
  
  // Draw and update particles
  for (int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    if (p.pos.x > -5 && p.pos.x < width + 5 && p.pos.y > -5 && p.pos.y < height + 5) {
      p.draw();
      p.update();
    } else {
      particles.remove(i);
    }
    
    // Remove particle from the list if its color is black
    if (red(p.col) == 0 && green(p.col) == 0 && blue(p.col) == 0) {
      particles.remove(i);
    }
  }
}
