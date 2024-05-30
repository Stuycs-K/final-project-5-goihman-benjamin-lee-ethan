class Rook extends Piece{
  
  Rook(PImage image, int col, int row, boolean teamColor){
    super(image,col,row,teamColor);
  }
  
  public boolean isValidMove(int col, int row){  
    return validMoves().contains(new int[]{col,row});
  }
  
  
  public ArrayList validMoves(){
     ArrayList<int[]> endList = new ArrayList<int[]>();
    int myX = this.getX();
    int myY = this.getY();
    
    while (myX > 0 && b.get(myX-1,y)!=null){
      if (b.get(myX-1,y).getColor() != this.getColor()){
        int[] f = {myX-1,myY};
        endList.add(f);
      }
      myX--;
    }
    myX = this.getX();
    while (myX < 8 && b.get(myX+1,y)!=null){
      if (b.get(myX+1,y).getColor() != this.getColor()){
        int[] f = {myX+1,myY};
        endList.add(f);

      }
      myX++;
    }
    myX = this.getX();
    while (myY > 0 && b.get(myX,myY-1) != null){
      if (b.get(myX,myY-1).getColor() != this.getColor()){
        int[] f = {myX,myY-1};
        endList.add(f);
      }
      myY--;
    }
    myY = this.getY();
    while (myY < 8 && b.get(myX,myY+1) != null){
      if (b.get(myX,myY+1).getColor() != this.getColor()){
        int[] f = {myX,myY+1};
        endList.add(f);
      }
      myY++;
    }
    
    return endList;
  }
  
  public boolean move(int newX, int newY){
    //action
    return isValidMove(newX,newY);
  }
}
