public class Board {
  Piece[][] board;
  Piece selected;
  int turn;
  public Board(){
    this.turn = 0;
    this.selected = null;
    board = new Piece[8][8];
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
  public void shuffle(){};
  public void flip(){};
  public boolean isInCheck(){return false;};
  public boolean isInCheckMate(){return false;};
  public boolean isStaleMate(){return false;};
  public Piece get(int x, int y) {
    if (x < 0 || x >= board.length || y < 0 || y >= board[0].length) {
      return null;
    }
    return board[y][x];
  }

public boolean move(int x, int y) {
  if (selected == null) {
    return false;
  }
  if(true){//if (selected.isValidMove(x, y)) {
    print(x,y);
    print(selected.x,selected.y);
    Piece target = get(x, y);
    if (target == null || target.getColor() != selected.getColor()) {
      board[7-selected.getY()][selected.getX()] = null;
      board[y][x] = selected;
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
