class EventTracker{
  int players = 2;
  int playerTurn = 0;
  ArrayList<Tank> Players = new ArrayList<Tank>();
  ArrayList<Projectile> Projectiles = new ArrayList<Projectile>();
  ArrayList<Explosion> Explosions = new ArrayList<Explosion>();
  
  public EventTracker(int playerAmount){
    players = playerAmount; 
    Players.add(new Tank(300, "Adam"));
    Players.add(new Tank(1700, "Janusz"));
    
    this.Players.get(this.playerTurn).currentTurn = true;
  }
  
  void swapTurns(){
    
    events.Players.get(this.playerTurn).currentTurn = false;
    
    playerTurn++;
    if(playerTurn >= players){
      playerTurn = 0; 
    }
    events.Players.get(this.playerTurn).currentTurn = true;
    events.Players.get(this.playerTurn).fuel = 250;
  }
  
}
