class Knight extends Piece{
  
  Knight(PImage image, int x, int y, boolean teamColor){
    super(image,x,y,teamColor);
  }
  
  public boolean isValidMove(int x, int y){
    return (x-2 == this.getX() && (y == this.getY() +1 || y==this.getY()-1) || (x+2 == this.getX() && (y == this.getY() +1 || y==this.getY()-1)) || (y-2 == this.getY() && (x == this.getX() +1 || x==this.getX()-1))|| (y+2 == this.getX() && (x == this.getX() +1 || x==this.getX()-1)))&&(b.get(x,y)== null || b.get(x,y).getColor() != this.getColor());
  }
  
  
  public int[][] validMoves(){
    return new int[0][0];
  }
  
  public boolean move(int newX, int newY){
    //action
    return isValidMove(newX,newY);
  }
}
