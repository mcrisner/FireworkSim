class Firework {
  PVector pos;
  PVector vel;
  PVector acc;
  float gravity = 0.05;
  float coef_drag = 0.01;
  float delay;
  boolean exploded;
  float explodeThresh;
  color col;
  
  Firework(float delay) {
    this.delay = delay;
    reset();
  }
  
  void reset() {
    pos = new PVector(random(200, width - 200), height + 50);
    vel = new PVector(random(-1.25, 1.25), random(-20, -10));
    acc = new PVector(0, gravity);
    col = color(random(128, 255), random(128, 255), random(128, 255));
    exploded = false;
    explodeThresh = random(-2, 0);
  }
  
  void draw() {
    fill(col);
    circle(pos.x, pos.y, 5);
  }
  
  void update() {
    if (delay > 0) {
      delay -= 0.01666666667;
    } else {
      // Calculate and apply drag force
      PVector drag = vel.copy().mult(-1).mult(coef_drag);
      acc.add(drag);
      
      // Update velocity and position
      vel.add(acc);
      pos.add(vel);
      
      // Reset acceleration
      acc.sub(drag);
      
      // Explode when the firework slows beyond explodeThresh
      if (vel.y > explodeThresh && !exploded) {
        explode();
        exploded = true;
      }
      
      // Reset the firework once its off screen
      if (pos.y > height + 50) {
        reset();
      }
    }
  }
  
  void explode() {
    float size = random(0.5, fireworkSize);
    int numParticles = int(random(150 * size * particleMultiplier, 250 * size * particleMultiplier));
    
    // Randomly generate particles around the point of explosion
    for (int i = 0; i < numParticles; i++) {
      float angle = random(TWO_PI);
      float speed = random(0, size * 5);
      PVector pVel = new PVector(cos(angle), sin(angle)).mult(speed);
      particles.add(new Particle(pos.copy(), pVel, acc.copy(), col));
    }
    
    col = color(0);
  }
}
