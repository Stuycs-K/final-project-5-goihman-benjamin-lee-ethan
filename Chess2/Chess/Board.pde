public class Board {
  Piece[][] board;
  Piece selected;
  int turn;
  public Board(){
    resetBoard();
  }
  public void shuffle(){};
  public void flip(){};
  public boolean isInCheck(){return false;};
  public boolean isInCheckMate(){return false;};
  public boolean isStaleMate(){return false;};
  public Piece get(int col, int row) {
    if (0 > col || col >= board.length || row > 0 || row >= board.length) {
      return null;
    }
    return board[row][col];
  }

boolean move(int col, int row) {
  if (col < 0 || col >= 8 || row < 0 || row >= 8) {
    return false;
  }
  if (selected == null) {
    return false;
  }
  board[selected.getRow()][selected.getCol()] = null;
  board[row][col] = selected;
  selected.row = row;
  selected.col = col;
  selected = null;
  turn++;
  return true;
}

  
  public void resetBoard(){
    this.turn = 0;
    this.selected = null;
    board = new Piece[8][8];
    
        // Initialize white pieces
    board[0][0] = new Rook(loadImage("pieces/white-rook.png"), 0, 0, true);
    board[0][1] = new Knight(loadImage("pieces/white-knight.png"), 1, 0, true);
    board[0][2] = new Bishop(loadImage("pieces/white-bishop.png"), 2, 0, true);
    board[0][3] = new Queen(loadImage("pieces/white-queen.png"), 3, 0, true);
    board[0][4] = new King(loadImage("pieces/white-king.png"), 4, 0, true);
    board[0][5] = new Bishop(loadImage("pieces/white-bishop.png"), 5, 0, true);
    board[0][6] = new Knight(loadImage("pieces/white-knight.png"), 6, 0, true);
    board[0][7] = new Rook(loadImage("pieces/white-rook.png"), 7, 0, true);
    
    for (int col = 0; col < 8; col++) {
        board[1][col] = new Pawn(loadImage("pieces/white-pawn.png"), col, 1, true);
    }
    
    // Initialize black pieces
    board[7][0] = new Rook(loadImage("pieces/black-rook.png"), 0, 7, false);
    board[7][1] = new Knight(loadImage("pieces/black-knight.png"), 1, 7, false);
    board[7][2] = new Bishop(loadImage("pieces/black-bishop.png"), 2, 7, false);
    board[7][3] = new Queen(loadImage("pieces/black-queen.png"), 3, 7, false);
    board[7][4] = new King(loadImage("pieces/black-king.png"), 4, 7, false);
    board[7][5] = new Bishop(loadImage("pieces/black-bishop.png"), 5, 7, false);
    board[7][6] = new Knight(loadImage("pieces/black-knight.png"), 6, 7, false);
    board[7][7] = new Rook(loadImage("pieces/black-rook.png"), 7, 7, false);
    
    for (int col = 0; col < 8; col++) {
        board[6][col] = new Pawn(loadImage("pieces/black-pawn.png"), col, 6, false);
    }
    

    
    // Initialize empty squares
    for (int row = 2; row < 6; row++) {
        for (int col = 0; col < 8; col++) {
            board[row][col] = null;
        }
    }

  }
public boolean select(int col, int row) {
  Piece piece = get(col, row);
  if (piece == null) {
    return false;
  }

  if (piece == selected) {
    selected = null;
    return true;
  }

  if (piece.getColor() == (turn % 2 == 0)) {
    selected = piece;
    return true;
  }
  return false;
}


}
