class Terrain{
  int[] terrain = new int[2000];
  PShape terrainShape;
  
  public Terrain(){
    for(int i = 0; i < 2000; i++){
      this.terrain[i] = 300; 
    }
  }
  
  void updateTerrain(){
    terrainShape = createShape(); 
    terrainShape.beginShape();
    terrainShape.fill(0,255, 0);
    for(int i = 0; i < 2000; i++){
      terrainShape.vertex(i + 1, this.terrain[i]); 
    }
    terrainShape.vertex(2000, 0);
    terrainShape.vertex(0, 0);
    terrainShape.endShape(CLOSE);
  }
  
  void drawTerrain(){
    shape(terrainShape, 0, 0); 
  }
  
}
