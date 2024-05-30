Board b;

void setup() {
  size(1400, 720);
  b = new Board();
  drawBoard();
  drawPieces();
}

void draw() {
}

void mouseClicked() {
  int boardSize = 8;
  int squareSize = min(width, height) / boardSize;
  int offsetX = (width - (squareSize * boardSize)) / 2;
  int offsetY = (height - (squareSize * boardSize)) / 2;

  int col = (mouseX - offsetX) / squareSize;
  int row = (mouseY - offsetY) / squareSize;
  println("Mouse clicked at: (" + mouseX + ", " + mouseY + ")");
  println("Translated to board coordinates: (" + col + ", " + row + ")");

  if (col >= 0 && col < boardSize && row >= 0 && row < boardSize) {
    Piece clickedPiece = b.get(col, row);

    if (clickedPiece != null) {
      if (b.select(col, row)) {
        println("Selection successful");
      } else {
        if (b.selected != null && b.move(col, row)) {
          b.selected = null;
          println("Move successful");
        } else {
          println("Invalid move");
        }
      }
    } else {
      if (b.selected != null && b.move(col, row)) {
        b.selected = null;
        println("Move successful");
      } else {
        b.selected = null;
        println("Deselected piece");
      }
    }

    drawBoard();
    if (b.selected != null) {
      fill(255, 255, 200);
      rect(offsetX + col * squareSize, offsetY + row * squareSize, squareSize, squareSize);
    }
    drawPieces();
  } else {
    println("Click out of board bounds.");
  }
}

void drawBoard() {
  int boardSize = 8;
  int squareSize = min(width, height) / boardSize;
  int offsetX = (width - (squareSize * boardSize)) / 2;
  int offsetY = (height - (squareSize * boardSize)) / 2;
  boolean isLightBlue = true;

  for (int y = 0; y < boardSize; y++) {
    for (int x = 0; x < boardSize; x++) {
      if (isLightBlue) {
        fill(173, 216, 230); // Light Blue
      } else {
        fill(255); // White
      }
      rect(offsetX + x * squareSize, offsetY + y * squareSize, squareSize, squareSize);
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

  for (int y = 0; y < boardSize; y++) {
    for (int x = 0; x < boardSize; x++) {
      Piece piece = b.get(x, y);
      if (piece != null) {
        image(piece.getImage(), offsetX + x * squareSize, offsetY + (7-y) * squareSize, squareSize, squareSize); // Flip the y-coordinate to match the board's orientation
      }
    }
  }
}
