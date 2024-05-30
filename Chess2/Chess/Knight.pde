class Knight extends Piece{
  
  Knight(PImage image, int col, int row, boolean teamColor){
    super(image,col,row,teamColor);
  }
  
  public boolean isValidMove(int x, int y){
    if (x < 8 && x > 0 && y > 0 && y <7){
      return (x-2 == this.getX() && (y == this.getY() +1 || y==this.getY()-1) || (x+2 == this.getX() && (y == this.getY() +1 || y==this.getY()-1)) || (y-2 == this.getY() && (x == this.getX() +1 || x==this.getX()-1))|| (y+2 == this.getX() && (x == this.getX() +1 || x==this.getX()-1)))&&(b.get(x,y)== null || b.get(x,y).getColor() != this.getColor());
    }
    return false;
  }
  
  
  public ArrayList<int[]> validMoves(){
    ArrayList<int[]> f = new ArrayList<int[]>();
    return f;
  }
  
  public boolean move(int newX, int newY){
    //action
    return isValidMove(newX,newY);
  }
}
