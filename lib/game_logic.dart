import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';

extension ContainsAll on List {
  bool containsAll(x, y, [z]) {
    if (z == null) {
      return contains(x) && contains(y);
    }
    return contains(x) && contains(y) && contains(z);
  }
}

class Player {
  static List<int> playerX = [];
  static List<int> playerO = [];
}

class Game {
  static Future<void> play(int index, String activePlayer) async {
    if (activePlayer == 'X') {
      Player.playerX.add(index);
    } else {
      Player.playerO.add(index);
    }
  }

  static Future<void> autoPlay(activePlayer,) async {
    List<int> emptyCells = [];
    int index = 0;
    for (var i = 0; i < 9; i++) {
      if (!Player.playerO.contains(i) && !Player.playerX.contains(i)) {
        emptyCells.add(i);
      }
    }
    /* Defense */
    //Right to left
    if (emptyCells.isNotEmpty) {
      if (Player.playerX.containsAll(0, 1) && emptyCells.contains(2))
        index = 2;
      else if (Player.playerX.containsAll(3, 4) && emptyCells.contains(5))
        index = 5;
      else if (Player.playerX.containsAll(6, 7) && emptyCells.contains(8))
        index = 8;
      //Top to down
      else if (Player.playerX.containsAll(0, 3) && emptyCells.contains(6))
        index = 6;
      else if (Player.playerX.containsAll(1, 4) && emptyCells.contains(7))
        index = 7;
      else if (Player.playerX.containsAll(2, 5) && emptyCells.contains(8))
        index = 8;
      //Left to right
      else if (Player.playerX.containsAll(1, 2) && emptyCells.contains(0))
        index = 0;
      else if (Player.playerX.containsAll(4, 5) && emptyCells.contains(3))
        index = 3;
      else if (Player.playerX.containsAll(7, 8) && emptyCells.contains(6))
        index = 6;
      //Down to top
      else if (Player.playerX.containsAll(6, 3) && emptyCells.contains(0))
        index = 0;
      else if (Player.playerX.containsAll(7, 4) && emptyCells.contains(1))
        index = 1;
      else if (Player.playerX.containsAll(8, 5) && emptyCells.contains(2))
        index = 2;
      //Cross all
      else if (Player.playerX.containsAll(0, 4) && emptyCells.contains(8))
        index = 8;
      else if (Player.playerX.containsAll(2, 4) && emptyCells.contains(6))
        index = 6;
      else if (Player.playerX.containsAll(8, 4) && emptyCells.contains(0))
        index = 0;
      else if (Player.playerX.containsAll(6, 4) && emptyCells.contains(2))
        index = 2;
      else if (Player.playerX.containsAll(0, 8) && emptyCells.contains(4))
        index = 4;
      else if (Player.playerX.containsAll(2, 6) && emptyCells.contains(4))
        index = 4;
      //Center from top to down
      else if (Player.playerX.containsAll(0, 2) && emptyCells.contains(1))
        index = 1;
      else if (Player.playerX.containsAll(3, 5) && emptyCells.contains(4))
        index = 4;
      else if (Player.playerX.containsAll(6, 8) && emptyCells.contains(7))
        index = 7;
      //Center from right to left
      else if (Player.playerX.containsAll(0, 6) && emptyCells.contains(3))
        index = 3;
      else if (Player.playerX.containsAll(1, 7) && emptyCells.contains(4))
        index = 4;
      else if (Player.playerX.containsAll(2, 8) && emptyCells.contains(5))
        index = 5;
      /* Attack */
      //Right to left
      else if (Player.playerO.containsAll(0, 1) && emptyCells.contains(2))
        index = 2;
      else if (Player.playerO.containsAll(3, 4) && emptyCells.contains(5))
        index = 5;
      else if (Player.playerO.containsAll(6, 7) && emptyCells.contains(8))
        index = 8;
      //Top to down
      else if (Player.playerO.containsAll(0, 3) && emptyCells.contains(6))
        index = 6;
      else if (Player.playerO.containsAll(1, 4) && emptyCells.contains(7))
        index = 7;
      else if (Player.playerO.containsAll(2, 5) && emptyCells.contains(8))
        index = 8;
      //Left to right
      else if (Player.playerO.containsAll(1, 2) && emptyCells.contains(0))
        index = 0;
      else if (Player.playerO.containsAll(4, 5) && emptyCells.contains(3))
        index = 3;
      else if (Player.playerO.containsAll(7, 8) && emptyCells.contains(6))
        index = 6;
      //Down to top
      else if (Player.playerO.containsAll(6, 3) && emptyCells.contains(0))
        index = 0;
      else if (Player.playerO.containsAll(7, 4) && emptyCells.contains(1))
        index = 1;
      else if (Player.playerO.containsAll(8, 5) && emptyCells.contains(2))
        index = 2;
      //Cross all
      else if (Player.playerO.containsAll(0, 4) && emptyCells.contains(8))
        index = 8;
      else if (Player.playerO.containsAll(2, 4) && emptyCells.contains(6))
        index = 6;
      else if (Player.playerO.containsAll(8, 4) && emptyCells.contains(0))
        index = 0;
      else if (Player.playerO.containsAll(6, 4) && emptyCells.contains(2))
        index = 2;
      else if (Player.playerO.containsAll(0, 8) && emptyCells.contains(4))
        index = 4;
      else if (Player.playerO.containsAll(2, 6) && emptyCells.contains(4))
        index = 4;
      //Center from top to down
      else if (Player.playerO.containsAll(0, 2) && emptyCells.contains(1))
        index = 1;
      else if (Player.playerO.containsAll(3, 5) && emptyCells.contains(4))
        index = 4;
      else if (Player.playerO.containsAll(6, 8) && emptyCells.contains(7))
        index = 7;
      //Center from right to left
      else if (Player.playerO.containsAll(0, 6) && emptyCells.contains(3))
        index = 3;
      else if (Player.playerO.containsAll(1, 7) && emptyCells.contains(4))
        index = 4;
      else if (Player.playerO.containsAll(2, 8) && emptyCells.contains(5))
        index = 5;
      else {
        Random random = Random();
        int randomIndex = random.nextInt(emptyCells.length);
        index = emptyCells[randomIndex];
      }
      play(index, activePlayer);
    }
  }

  static String checkWinner() {
    String winner = '';
    if (Player.playerX.containsAll(0, 1, 2) ||
        Player.playerX.containsAll(3, 4, 5) ||
        Player.playerX.containsAll(6, 7, 8) ||
        Player.playerX.containsAll(0, 3, 6) ||
        Player.playerX.containsAll(1, 4, 7) ||
        Player.playerX.containsAll(2, 5, 8) ||
        Player.playerX.containsAll(0, 4, 8) ||
        Player.playerX.containsAll(2, 4, 6)) {
      winner = 'X';
      return winner;
    }
    if (Player.playerO.containsAll(0, 1, 2) ||
        Player.playerO.containsAll(3, 4, 5) ||
        Player.playerO.containsAll(6, 7, 8) ||
        Player.playerO.containsAll(0, 3, 6) ||
        Player.playerO.containsAll(1, 4, 7) ||
        Player.playerO.containsAll(2, 5, 8) ||
        Player.playerO.containsAll(0, 4, 8) ||
        Player.playerO.containsAll(2, 4, 6)) {
      winner = 'O';
      return winner;
    }
    return winner;
  }
}
