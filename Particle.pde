class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  float gravity = 0.05;
  float coef_drag = 0.01;
  float coef_fric;
  float disapp_rate;
  color col;
  
  Particle(PVector pos, PVector vel, PVector acc, color col) {
    this.pos = pos;
    this.vel = vel;
    this.acc = acc;
    this.col = col;
    disapp_rate = random(1, 3);
  }
  
  void draw() {
    fill(col);
    circle(pos.x, pos.y, 5);
  }
  
  void update() {
    // Calculate and apply drag force
    PVector drag = vel.copy().mult(-1 * coef_drag);
    acc.add(drag);
    
    // Update velocity and position
    vel.add(acc);
    pos.add(vel);
    
    // Reset acceleration
    acc.sub(drag);
    
    // Gradually darken the color
    float r = red(col);
    float g = green(col);
    float b = blue(col);
    col = color( constrain(r - disapp_rate, 0, 255), constrain(g - disapp_rate, 0, 255), constrain(b - disapp_rate, 0, 255) );
  }
}
