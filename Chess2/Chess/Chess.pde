Board b;

void draw() {
  drawBoard();
  drawPieces();
}

void setup() {
  b = new Board();
  size(1400, 720);
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
        image(piece.getImage(), offsetX + x * squareSize, offsetY + y * squareSize, squareSize, squareSize);
      }
    }
  }
}
