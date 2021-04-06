import 'dart:io';
import 'dart:math';

void main() {
  int userTotalScore = 0;
  int botTotalScore = 0;

  int userScore = 0;
  int botScore = 0;

  while (true) {
    stdout.write("type EXIT to exit, press enter to continue: ");
    if (stdin.readLineSync()?.toLowerCase() == "exit") break;

    userScore = roll() + roll();
    botScore = roll() + roll();
    print("user sum $userScore");
    print("bot sum $botScore");
    (userScore > botScore) ? userTotalScore++ : botTotalScore++;
  }

  if (botTotalScore > userTotalScore) {
    print("Winner: BOT");
  } else if (botTotalScore < userTotalScore) {
    print("You are winner <333");
  } else {
    print("Game ended in a draw");
  }
  print("user result: $userTotalScore, bot result: $botTotalScore");
}

int roll() => Random().nextInt(7);
