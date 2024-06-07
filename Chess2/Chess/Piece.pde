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
  public String getName(){
  return "";
  }
  public void move(int nCol, int nRow){
     col=nCol;
     row=nRow;
     hasMoved = true;
  }
  public boolean tryMove(int nCol, int nRow){
    Piece old = b.board[nRow][nCol];
    b.board[nRow][nCol] = b.board[row][col];
    b.board[row][col] = null;
    boolean ret =!b.getKing(teamColor).isInCheck();
    b.board[row][col] = b.board[nRow][nCol];
    b.board[nRow][nCol] = old;  
    return ret;
  }
}
