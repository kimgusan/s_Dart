mixin class Strong {
  final double strengthLevel = 1500.99;
}

mixin class QuickRunner {
  void runQuick() {
    print('ruuuuun');
  }
}

mixin class Tall {
  final double height = 1.99;
}

enum Team { blue, red }

class Player with Strong, QuickRunner, Tall {
  final Team team;

  Player({
    required this.team,
  });
}

class Horce with Strong, QuickRunner {}

class Kid with Tall {}

void main() {
  var player = Player(
    team: Team.red,
  );
  player.runQuick();
}
