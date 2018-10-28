import java.util.*;

Terrain Terrain = new Terrain();
EventTracker events = new EventTracker(2);

void setup(){  
  frameRate(60);
  size(2000,1000);
  
  Terrain.updateTerrain();
}

void draw(){
  scale(1, -1);
  translate(0, -height);
  
  background(0);
  
  Terrain.drawTerrain();

  for(int i = 0; i < events.players; i++){
    events.Players.get(i).drawTank(); 
  }
  fill(255);
  for(int i = 0; i < events.Projectiles.size(); i++){ 
    events.Projectiles.get(i).drawProjectile();
  }
  for(int i = 0; i < events.Explosions.size(); i++){
    events.Explosions.get(i).tickExplosion(); 
  }
  
}

void keyPressed(){
  events.Players.get(events.playerTurn).keyInput(key);
}
