class Pawn extends Piece{
  
  Pawn(PImage image, int x, int y, boolean teamColor){
    super(image,x,y,teamColor);
  }
  
  public boolean isValidMove(int x, int y){
    if (b.get(x,y) == null){
      return false;
    }
    if (teamColor){
      if (b.get(x+1,y+1)!= null && b.get(x+1,y+1).getColor() != true){
        return true;
      }
      //check diag right capture 
      if (b.get(x-1,y+1)!= null && b.get(x-1,y+1).getColor() != true){
        return true;
      }
      //check diag left capture
      if (hasMoved != true){
         return (y== this.getY()+1 || y == this.getY()+2)&& this.getX()==x;
      }//check first move double jump
       return y== this.getY()+1 && this.getX() == x && b.get(x,y-1)!= null;
     } else{
      if (b.get(x+1,y-1)!= null && b.get(x+1,y-1).getColor() != false){
        return true;
      }
      if (b.get(x-1,y-1)!= null && b.get(x-1,y-1).getColor() != false){
        return true;
      }
     if (hasMoved != true){
       return (y== this.getY()-1 || y == this.getY()-2)&& this.getX()==x;
     }
     return y == this.getY() -1 && this.getX() == x;
     }
     
   }
    
  public boolean promote(int x, int y){
    return true;
  }
  
  
  public ArrayList<int[]> validMoves(){
    ArrayList<int[]> f = new ArrayList<int[]>();
    for (int x = 0; x < 8; x++){
      for (int y = 0; y < 8; y++){
        if (isValidMove(x,y)){
          int[] i = new int[]{x,y};
          f.add(i);
        }
      }
    }
    return f;
  }
  
  public boolean move(int newX, int newY){
    //action

    return isValidMove(newX,newY);
  }
}
