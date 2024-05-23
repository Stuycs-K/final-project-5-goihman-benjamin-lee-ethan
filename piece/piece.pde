abstract class Piece{
  final PImage image;
  final boolean teamColor;
  final int x; final int y;
  final boolean hasMoved;
  
  
  Piece(PImage image, int x, int y, boolean teamColor){
    this.image = image;
    this.x = x;
    this.y = y;
    this.teamColor = teamColor;
    hasMoved = false;
  }
  
  public boolean getColor(){
    return teamColor;
  }
  public int getX(){
    return x;
   }
  public int getY(){
    return y;
  }
  
  abstract boolean isValidMove();
  abstract Piece[][] validMoves();
}
