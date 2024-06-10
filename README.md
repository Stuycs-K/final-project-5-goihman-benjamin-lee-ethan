[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/syDSSnTt)
# APCS2 Final Project
THIS DOCUMENT IS REQUIRED
## Group Info
Ben Goihman and Ethan Lee
## Overview
This will be a normal chess game, MVP - Will have a working chess board with valid moves, although check or checkamte may not be done. For the full game we will have check and checkmate working, and if going well on hte sides where we reserved space we can add what pieces are taken and a timer
## Instructions
First select the piece you want to move. Then all avalaible moves will be shown.
Then either make a move, and the piece will move as well as take if needed.
You can click yourself to unselect or click another peice of your same color to select that piece instead
For pawn promotion simply move your pawn to the end of board and all the options for what to promote to will be shown. To select one just click on it, after that the pawn will be promoted and the turn will advance.
To give 30 seconds of time to the other play simply click your minus symbol. If you have less than 30 seconds left nothing will happen if you do click it.
Shortcuts:
- click c to show check works
- click m to show checkmate works
- click l to show castling works
- click p to show promotion works
- click f to set fiftyMoves to 48
- click r to reset
## Major-ish changes to prototype
- isInCheck moved to king class, as it is depedent on the color of the king and the king peice more than the board class
- All isValidMove methods removed as we validMoves can be used instead
- Add state and winner so that if the gameover screen is displayed we won't reset until you click on the restart box
### Major bugs
N/A
### Video
https://drive.google.com/file/d/1-ASrdUJl3oKWa2uq3LyNNeRFyJWiTkOk/view?usp=drive_link
