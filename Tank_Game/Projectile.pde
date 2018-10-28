class Projectile{
 int xPosition;
 float yPosition;
 int xVelocity;
 float yVelocity;
 int explosionRadius;
 
 public Projectile(int xVel, int yVel, int xPos, int yPos, int explodeRad){
   xPosition = xPos;
   yPosition = yPos;
   xVelocity = xVel;
   yVelocity = yVel;
   explosionRadius = explodeRad;
 }
  
  void nextPosition(){
    xPosition += xVelocity;
    yPosition += yVelocity;
    yVelocity -= 0.5;
    
    if(this.xPosition >= 2000 || this.xPosition <= 0){ // collision detection for out of bounds
      for(int i = 0; i < events.Projectiles.size(); i++){ // deletes the shot
        if(events.Projectiles.get(i).xPosition == this.xPosition && events.Projectiles.get(i).yPosition == this.yPosition){
          events.Projectiles.remove(0); 
          events.swapTurns();
        }
      }
    }
    else if((int) this.yPosition <= (int) Terrain.terrain[this.xPosition - 1]){ // collision detection for Terrain
      explode(); 
    }
  }
  
  void explode(){
    for(int i = 0; i < events.Projectiles.size(); i++){ //deletes the shot
        if(events.Projectiles.get(i).xPosition == this.xPosition && events.Projectiles.get(i).yPosition == this.yPosition){
          events.Projectiles.remove(0); 
        }
      }
    events.swapTurns(); 
    for(int i = 1; i <= explosionRadius * 2; i++){
      if(this.yPosition < Terrain.terrain[i - 1]){
        Terrain.terrain[((this.xPosition - explosionRadius) + i) - 1] = (int) this.yPosition - (int) sqrt( pow(explosionRadius, 2) - pow(explosionRadius - i, 2)); 
      }
      else if(Terrain.terrain[i - 1] - this.yPosition > this.explosionRadius || Terrain.terrain[i - 1] - this.yPosition < - this.explosionRadius){
        Terrain.terrain[((this.xPosition - explosionRadius) + i) - 1] -= (int) sqrt( pow(explosionRadius, 2) - pow(explosionRadius - i, 2)); 
      }
    }
    
    Terrain.updateTerrain();
    
    events.Explosions.add(new Explosion(this.xPosition, (int) this.yPosition, this.explosionRadius));
  }
  
  void drawProjectile(){
    ellipse(xPosition,(int) yPosition, 20, 20);
    this.nextPosition();
  }
}
