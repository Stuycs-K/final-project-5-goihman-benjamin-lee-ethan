Board b;
int state;
String winner;
void setup() {
    size(1400, 720);
    b = new Board();
    state=0;
    winner = null;
    drawBoard();
    drawPieces();
    textSize(64);
    fill(255, 255, 255);
    text("White's turn", 4, 64);
}

void draw() {}

void mouseClicked() {
    int boardSize = 8;
    int squareSize = min(width, height) / boardSize;
    int offsetX = (width - (squareSize * boardSize)) / 2;
    int offsetY = (height - (squareSize * boardSize)) / 2;
    int col = (mouseX - offsetX) / squareSize;
    int row = (mouseY - offsetY) / squareSize;
    println("Mouse clicked at: (" + mouseX + ", " + mouseY + ")");
    println("Translated to board coordinates: (" + col + ", " + row + ")");
    if(state==0){
    if (col >= 0 && col < boardSize && row >= 0 && row < boardSize) {
        Piece clickedPiece = b.get(col, row);
        drawBoard();
        if (clickedPiece != null) {
            if (b.select(col, row)) {
                println("Selection successful");
            } else {
                if (b.selected != null) {
                    ArrayList < int[] > validMoves = b.selected.validMoves();
                    boolean isValidMove = false;
                    for (int[] move: validMoves) {
                        if (move[0] == col && move[1] == row) {
                            isValidMove = true;
                            break;
                        }
                    }
                    if (isValidMove && b.move(col, row)) {
                        println("Move successful");
                    } else {
                        println("Invalid move");
                    }
                }
            }
        } else {
            if (b.selected != null) {
                ArrayList < int[] > validMoves = b.selected.validMoves();
                boolean isValidMove = false;
                for (int[] move: validMoves) {
                    if (move[0] == col && move[1] == row) {
                        isValidMove = true;
                        break;
                    }
                }
                if (isValidMove) {
                    b.move(col, row);
                    //b.selected = null;
                    println("Move successful");
                } else {
                    b.selected = null;
                    println("Deselected piece");
                }
            }
        }
        if(state==0){
          
        if (b.turn % 2 == 0) {
            fill(255, 255, 255);
            text("White's turn", 4, 64);
        } else {
            fill(0, 0, 0);
            text("Black's turn", 1080, 64);
        }
        if (b.selected != null) {
            fill(255, 255, 200);
            rect(offsetX + b.selected.getCol() * squareSize, offsetY + b.selected.getRow() * squareSize, squareSize, squareSize);
            fill(0, 255, 0, 100);
            ArrayList < int[] > validMoves = b.selected.validMoves();
            for (int[] move: validMoves) {
                int moveCol = move[0];
                int moveRow = move[1];
                ellipse(offsetX + moveCol * squareSize + squareSize / 2, offsetY + moveRow * squareSize + squareSize / 2, squareSize / 2, squareSize / 2);
            }
        }}
        drawPieces();
    } else {
        println("Click out of board bounds.");
    }
    if(state==0){
  if(b.isInCheckMate(b.turn%2==0)){
      state=1;
      if (b.getKing(b.turn%2==0).isInCheck() == false){
         winner = "No one";
      }
      else {winner=(b.turn-1)%2==0 ? "White" : "Black"; }
      fill(0, 102, 153);
      rect(600, 500, 200, 100);
      fill(0, 102, 153);
      rect(300, 200, 800, 200);
      textSize(48);
      if(winner.equals("White")){
        fill(255,255,255);
      }
      else{
        fill(0,0,0);
      }
      text(winner + " wins!", 600, 300);
      textSize(32);
      text("Play Again", 625, 560);
    }}}
  
  else if (state==1){
      
      if (mouseX >= 600 && mouseX <= 800 && mouseY >= 500 && mouseY <= 600) {
          b.resetBoard();
          state = 0;
          winner = null;
          drawBoard();
          drawPieces();
          textSize(64);
          fill(255, 255, 255);
          text("White's turn", 4, 64);
      }
   
}
else if (state == 2) {
    // Assuming the selected piece is the promoted pawn
        int selectedPieceIndex = (mouseY - 74) / 103;
        println();
        println(mouseX,mouseY);
        println(selectedPieceIndex);
        Piece newPiece = null;
        boolean wh = b.selected.getColor();
        if (wh) {
            // White pieces
            switch (selectedPieceIndex) {
                case 0:
                    newPiece = new Queen(loadImage("pieces/white-queen.png"), b.selected.getCol(), b.selected.getRow(), true);
                    break;
                case 1:
                    newPiece = new Rook(loadImage("pieces/white-rook.png"), b.selected.getCol(), b.selected.getRow(), true);
                    break;
                case 2:
                    newPiece = new Knight(loadImage("pieces/white-knight.png"), b.selected.getCol(), b.selected.getRow(), true);
                    break;
                case 3:
                    newPiece = new Bishop(loadImage("pieces/white-bishop.png"), b.selected.getCol(), b.selected.getRow(), true);
                    break;
            }
        } else {
            // Black pieces
            switch (selectedPieceIndex) {
                case 0:
                    newPiece = new Queen(loadImage("pieces/black-queen.png"),  b.selected.getCol(), b.selected.getRow(), false);
                    break;
                case 1:
                    newPiece = new Rook(loadImage("pieces/black-rook.png"),  b.selected.getCol(),  b.selected.getRow(), false);
                    break;
                case 2:
                    newPiece = new Knight(loadImage("pieces/black-knight.png"),  b.selected.getCol(),  b.selected.getRow(), false);
                    break;
                case 3:
                    newPiece = new Bishop(loadImage("pieces/black-bishop.png"),  b.selected.getCol(),  b.selected.getRow(), false);
                    break;
            }
        }
        
        if (newPiece != null) {
            b.board[b.selected.getRow()][b.selected.getCol()] = newPiece;
            state = 0;
            b.selected=null;
            b.turn++;
            drawBoard();
            drawPieces();
            textSize(64);
            if(!wh){
            fill(255, 255, 255);
            text("White's turn", 4, 64);
            }
            else{
                fill(0, 0, 0);
                text("Black's turn", 1080, 64);
            }
        }
}

    


}

void drawBoard() {
    int boardSize = 8;
    int squareSize = min(width, height) / boardSize;
    int offsetX = (width - (squareSize * boardSize)) / 2;
    int offsetY = (height - (squareSize * boardSize)) / 2;
    boolean isLightBlue = true;
    background(220, 220, 220);
    for (int row = 0; row < boardSize; row++) {
        for (int col = 0; col < boardSize; col++) {
            if (isLightBlue) {
                fill(173, 216, 230); // Light Blue
            } else {
                fill(255); // White
            }
            rect(offsetX + col * squareSize, offsetY + row * squareSize, squareSize, squareSize);
            isLightBlue = !isLightBlue;
        }
        isLightBlue = !isLightBlue;
    }
}

void drawPieces() {
    int boardSize = 8;
    int squareSize = min(width, height) / boardSize;
    int offsetX = (width - (squareSize * boardSize)) / 2;
    int offsetY = (height - (squareSize * boardSize)) / 2;

    for (int row = 0; row < boardSize; row++) {
        for (int col = 0; col < boardSize; col++) {
            Piece piece = b.get(col, row);
            if (piece != null) {
                image(piece.getImage(), offsetX + col * squareSize, offsetY + row * squareSize, squareSize, squareSize);
            }
        }
    }
}
