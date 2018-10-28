class Explosion{// this is a particle effect
  float opacity = 100;
  int xPosition;
  int yPosition;
  int explosionDiameter;
  
  public Explosion(int xPos, int yPos, int explosionRad){
    xPosition = xPos;
    yPosition = yPos;
    explosionDiameter = explosionRad * 2;
  }
  
  void tickExplosion(){
    noStroke();
    fill(255,255,255,opacity);
    ellipse(xPosition, yPosition, explosionDiameter, explosionDiameter);
    opacity-= 0.5;
    if(opacity <= 0){
      for(int i = 0; i < events.Explosions.size(); i++){
        if(events.Explosions.get(i).opacity <= 0){
          events.Explosions.remove(i); 
        }
      }
    }
    stroke(1);
  }
  
}
