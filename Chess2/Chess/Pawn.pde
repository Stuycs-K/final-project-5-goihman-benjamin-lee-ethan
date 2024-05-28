class Pawn extends Piece{
  
  Pawn(PImage image, int x, int y, boolean teamColor){
    super(image,x,y,teamColor);
  }
  
  public boolean isValidMove(int x, int y){
    if (teamColor){
      if (hasMoved != true){
         return (y== this.getY()+1 || y == this.getY()+2)&& this.getX()==x;
      }
       return y== this.getY()+1 && this.getX() == x;
     } else{
     if (hasMoved != true){
       return (y== this.getY()-1 || y == this.getY()-2)&& this.getX()==x;
     }
     return y == this.getY() -1 && this.getX() == x;
     }
     
   }
    
  public boolean promote(int x, int y){
    return true;
  }
  
  
  public int[][] validMoves(){
    return new int[0][0];
  }
  
  public boolean move(int newX, int newY){
    //action

    return isValidMove(newX,newY);
  }
}
