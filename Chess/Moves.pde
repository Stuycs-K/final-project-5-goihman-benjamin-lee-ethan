public class Moves{
  Piece pieceMoved;
  int[] oldCoord;
  int[] newCoord;
  Piece captured;
  
  public Moves(Piece p, int Ocol, int Orow, int Ncol, int Nrow, Piece c){
    pieceMoved = p;
    oldCoord = new int[]{Ocol, Orow};
    newCoord = new int[]{Ncol, Nrow};
    captured = c;
  }
}
