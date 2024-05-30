import java.util.ArrayList;
abstract class Piece{
  final PImage image;
  final boolean teamColor;
  int row; int col;
  final boolean hasMoved;
  
  
  Piece(PImage image, int col, int row, boolean teamColor){
    this.image = image;
    this.col = col;
    this.row = row;
    this.teamColor = teamColor;
    hasMoved = false;
  }
  
  public PImage getImage(){
    return image;
  }
  
  public boolean getColor(){
    return teamColor;
  }
  public int getRow(){
    return row;
   }
  public int getCol(){
    return col;
  }
  
  abstract ArrayList<int[]> validMoves();
  abstract boolean move(int col, int row);
}
