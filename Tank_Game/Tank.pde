class Tank{
  int health = 300;
  int fuel = 250;
  int xPosition;
  String username;
  boolean currentTurn = false;
  int angle = 45;
  int power = 35;
  int ratio = 0;
  
  public Tank(int xPos, String playerName){
    this.xPosition = xPos;
    username = playerName;
    
    
    
  }
  
  void drawTank(){
    fill(0,55,255);
    rect(this.xPosition - 25, Terrain.terrain[this.xPosition], 50, 25); 
    
    if(this.currentTurn == true){
      fill(255, 255, 255, 50);
      ellipse(this.xPosition, Terrain.terrain[this.xPosition], 500, 500);
     
      //pushMatrix(); 
      //translate(0, -height);
      
      fill(255, 255, 255, 100);
      arc((float)this.xPosition,(float)Terrain.terrain[this.xPosition], (float) (int) 500 * (power/35) , (float) (int) 500 * (power/35), radians(((angle) - 10)- 270), radians(((angle) + 10) - 270));
      text(power + ", " + angle, this.xPosition, 1000 - Terrain.terrain[this.xPosition] + 50);
      
      //popMatrix();
    }
    
  }
  
  void keyInput(char character){
    if(character == 'a' || character == 'd'){
      this.drive(character); 
    }
    else if(character == 32){
       this.shoot();
    }
    else if(character == 'j' || character == 'i' || character == 'l' || character == 'k'){ // 37 left 38 up 39 right 40 down
      this.aim(character); 
    }
  }
  
  void drive(char character){
    if(fuel > 0){
      if(character == 'a'){
        xPosition -= 2;
      }
      else{
        xPosition += 2; 
      }
      fuel -= 2;
    }
  }
  
  void shoot(){
    events.Projectiles.add(new Projectile(1 - ratio, ratio, this.xPosition, Terrain.terrain[this.xPosition] + 10, 50));
  }
  
  void aim(char character){
    if(character == 'j'){//37 left 38 up 39 right 40 down
      angle--; 
      if(angle < -180){
        angle = 180; 
      }
    }
    else if(character == 'l'){
      angle++;
      if(angle > 180){
        angle = -180; 
      }
    }
    else if(character == 'i' && power < 35){
      power++; 
    }
    else if(character == 'k' && power > 1){
      power--; 
    }
    if(angle != 0){
      ratio = (int) (35 * (90/angle));
    }
    else{
      ratio = 0; 
    }
  }
   
   
   
}
