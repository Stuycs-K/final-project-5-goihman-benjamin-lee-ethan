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
  abstract boolean canMove();
  public String getName(){
  return "";
  }
  public void move(int nCol, int nRow){
     col=nCol;
     row=nRow;
     hasMoved = true;
  }
  public boolean tryMove(int nCol, int nRow, boolean colorT){
    if(!getName().equals("King")){
    Piece old = b.board[nRow][nCol];
    b.board[nRow][nCol] = b.board[row][col];
    b.board[row][col] = null;
    King k = b.getKing(colorT);
    if(k==null){
      println("king is null");
      print(nCol + " " + nRow);
      print(getName());
      print(colorT);
    }
    boolean ret = true;
    try{ret=!k.isInCheck();}
    catch(Exception e){
      e.printStackTrace();
    }
    b.board[row][col] = b.board[nRow][nCol];
    b.board[nRow][nCol] = old; 
    return ret;
  }
  else {
      Piece old = b.board[nRow][nCol];
      b.board[nRow][nCol] = b.board[row][col];
      b.board[row][col] = null;
      
      int oldCol = col;
      int oldRow = row;
      col = nCol;
      row = nRow;
      King k = (King) this;
      boolean ret = !k.isInCheck();
      
      // Revert the King's position
      col = oldCol;
      row = oldRow;
      
      b.board[row][col] = b.board[nRow][nCol];
      b.board[nRow][nCol] = old;
      return ret;
    }
    
}
}
