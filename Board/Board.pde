public class Board {
  board Piece[][] = new Piece[][];
  int turn = 0;
  Piece selected;
  public void shuffle(){};
  public void flip(){};
  public boolean isInCheck(){};
  public boolean isInCheckMate(){};
  public boolean isStaleMate(){};
  public Piece get(int x, int y){};
  public boolean move(int x, int y){};
  public void resetBoard();
  public boolean select(int x, int y){};
}
