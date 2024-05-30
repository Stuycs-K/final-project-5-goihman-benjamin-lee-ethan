public class Board {
  Piece[][] board;
  Piece selected;
  int turn;
  public Board(){
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
    
    for (int col = 0; col < col; col++) {
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
  public void shuffle(){};
  public void flip(){};
  public boolean isInCheck(){return false;};
  public boolean isInCheckMate(){return false;};
  public boolean isStaleMate(){return false;};
  public Piece get(int col, int row) {
    if (0 < col || col >= board.length || row < 0 || row >= board.length) {
      return null;
    }
    return board[row][col];
  }

public boolean move(int col, int row) {
  if (selected == null) {
    return false;
  }
  
  if (selected.isValidMove(col, row)) {
    Piece target = get(col, row);
    if (target == null || target.getColor() != selected.getColor()) {
      board[selected.getRow()][selected.getCol()] = null;
      board[row][col] = selected;
      selected.row = row;
      selected.col = col;
      selected = null;
      turn++;
      return true;
    }
  }
  
  return false;
}
  
  public void resetBoard(){
    this.turn = 0;
    this.selected = null;
    
    // Initialize black pieces
    board[0][0] = new Rook(loadImage("pieces/black-rook.png"), 0, 0, false);
    board[0][1] = new Knight(loadImage("pieces/black-knight.png"), 0, 1, false);
    board[0][2] = new Bishop(loadImage("pieces/black-bishop.png"), 0, 2, false);
    board[0][3] = new Queen(loadImage("pieces/black-queen.png"), 0, 3, false);
    board[0][4] = new King(loadImage("pieces/black-king.png"), 0, 4, false);
    board[0][5] = new Bishop(loadImage("pieces/black-bishop.png"), 0, 5, false);
    board[0][6] = new Knight(loadImage("pieces/black-knight.png"), 0, 6, false);
    board[0][7] = new Rook(loadImage("pieces/black-rook.png"), 0, 7, false);
    
    for (int x = 0; x < 8; x++) {
        board[1][x] = new Pawn(loadImage("pieces/black-pawn.png"), 1, x, false);
    }
    
    // Initialize white pieces
    board[7][0] = new Rook(loadImage("pieces/white-rook.png"), 7, 0, true);
    board[7][1] = new Knight(loadImage("pieces/white-knight.png"), 7, 1, true);
    board[7][2] = new Bishop(loadImage("pieces/white-bishop.png"), 7, 2, true);
    board[7][3] = new Queen(loadImage("pieces/white-queen.png"), 7, 3, true);
    board[7][4] = new King(loadImage("pieces/white-king.png"), 7, 4, true);
    board[7][5] = new Bishop(loadImage("pieces/white-bishop.png"), 7, 5, true);
    board[7][6] = new Knight(loadImage("pieces/white-knight.png"), 7, 6, true);
    board[7][7] = new Rook(loadImage("pieces/white-rook.png"), 7, 7, true);
    
    for (int x = 0; x < 8; x++) {
        board[6][x] = new Pawn(loadImage("pieces/white-pawn.png"), 6, x, true);
    }
    
    // Initialize empty squares
    for (int y = 2; y < 6; y++) {
        for (int x = 0; x < 8; x++) {
            board[y][x] = null;
        }
    }
  }
public boolean select(int x, int y) {
  Piece piece = get(x, y);
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
