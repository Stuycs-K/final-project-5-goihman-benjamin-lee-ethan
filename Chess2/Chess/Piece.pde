import java.util.ArrayList;
abstract class Piece{
  final PImage image;
  final boolean teamColor;
  int row; int col;
  boolean hasMoved;
  
  
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
  public void move(int nCol, int nRow){
     col=nCol;
     row=nRow;
     hasMoved = true;
  }
}
