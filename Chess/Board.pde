public class Board {
  Piece[][] board;
  Piece selected;
  int turn;
  public Board(){
    this.turn = 0;
    this.selected = null;
    // Initialize black pieces
    board[0][0] = new Rook("pieces/black-rook.png", 0, 0, false);
    board[0][1] = new Knight("pieces/black-knight.png", 0, 1, false);
    board[0][2] = new Bishop("pieces/black-bishop.png", 0, 2, false);
    board[0][3] = new Queen("pieces/black-queen.png", 0, 3, false);
    board[0][4] = new King("pieces/black-king.png", 0, 4, false);
    board[0][5] = new Bishop("pieces/black-bishop.png", 0, 5, false);
    board[0][6] = new Knight("pieces/black-knight.png", 0, 6, false);
    board[0][7] = new Rook("pieces/black-rook.png", 0, 7, false);
    
    for (int x = 0; x < 8; x++) {
        board[1][x] = new Pawn("pieces/black-pawn.png", 1, x, false);
    }
    
    // Initialize white pieces
    board[7][0] = new Rook("pieces/white-rook.png", 7, 0, true);
    board[7][1] = new Knight("pieces/white-knight.png", 7, 1, true);
    board[7][2] = new Bishop("pieces/white-bishop.png", 7, 2, true);
    board[7][3] = new Queen("pieces/white-queen.png", 7, 3, true);
    board[7][4] = new King("pieces/white-king.png", 7, 4, true);
    board[7][5] = new Bishop("pieces/white-bishop.png", 7, 5, true);
    board[7][6] = new Knight("pieces/white-knight.png", 7, 6, true);
    board[7][7] = new Rook("pieces/white-rook.png", 7, 7, true);
    
    for (int x = 0; x < 8; x++) {
        board[6][x] = new Pawn("pieces/white-pawn.png", 6, x, true);
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
  public boolean isInCheck(){};
  public boolean isInCheckMate(){};
  public boolean isStaleMate(){};
public Piece get(int x, int y) {
    if (x < 0 || x >= board.size || y < 0 || y >= booard[0].size) {
        return null;
    }
    return board[y][x];
}
  public boolean move(int x, int y){
  }
  public void resetBoard(){
    board[0][0] = new Piece(0, 0, "pieces/black-rook.png");
    board[0][1] = new Piece(1, 0, "pieces/black-knight.png");
    board[0][2] = new Piece(2, 0, "pieces/black-bishop.png");
    board[0][3] = new Piece(3, 0, "pieces/black-queen.png");
    board[0][4] = new Piece(4, 0, "pieces/black-king.png");
    board[0][5] = new Piece(5, 0, "pieces/black-bishop.png");
    board[0][6] = new Piece(6, 0, "pieces/black-knight.png");
    board[0][7] = new Piece(7, 0, "pieces/black-rook.png");
    
    for (int x = 0; x < 8; x++) {
        board[1][x] = new Piece(x, 1, "pieces/black-pawn.png");
    }
    
    // Initialize white pieces
    board[7][0] = new Piece(0, 7, "pieces/white-rook.png");
    board[7][1] = new Piece(1, 7, "pieces/white-knight.png");
    board[7][2] = new Piece(2, 7, "pieces/white-bishop.png");
    board[7][3] = new Piece(3, 7, "pieces/white-queen.png");
    board[7][4] = new Piece(4, 7, "pieces/white-king.png");
    board[7][5] = new Piece(5, 7, "pieces/white-bishop.png");
    board[7][6] = new Piece(6, 7, "pieces/white-knight.png");
    board[7][7] = new Piece(7, 7, "pieces/white-rook.png");
    
    for (int x = 0; x < 8; x++) {
        board[6][x] = new Piece(x, 6, "pieces/white-pawn.png");
    }
    
    for (int y = 2; y < 6; y++) {
        for (int x = 0; x < 8; x++) {
            board[y][x] = null;
        }
    }
  }
  public boolean select(int x, int y){
    selected = get(x,y);
    return selected!=null;
  };
}
