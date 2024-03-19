mixin Stats {
  int _points = 10;
  int _health = 10;
  int _attack = 10;
  int _defense = 10;
  int _skill = 10;

//getters
  int get points => _points;
  Map<String, int> get statsAsMap => {
        'health': _health,
        'attack': _attack,
        'defense': _defense,
        'skill': _skill,
      };

  List<Map<String, String>> get statsAsFormattedList => [
        {'title': 'Health', 'value': _health.toString()},
        {'title': 'Attack', 'value': _attack.toString()},
        {'title': 'Defense', 'value': _defense.toString()},
        {'title': 'Skill', 'value': _skill.toString()},
      ];

//methods
  void increaseStat(String stat) {
    if (_points > 0) {
      switch (stat) {
        case 'Health':
          _health++;
          _points--;
          break;
        case 'Attack':
          _attack++;
          _points--;
          break;
        case 'Defense':
          _defense++;
          _points--;
          break;
        case 'Skill':
          _skill++;
          _points--;
          break;
      }
    }
  }

  void decreaseStat(String stat) {
    switch (stat) {
      case 'Health':
        if (_health > 5) {
          _health--;
          _points++;
        }
        break;
      case 'Attack':
        if (_attack > 5) {
          _attack--;
          _points++;
        }
        break;
      case 'Defense':
        if (_defense > 5) {
          _defense--;
          _points++;
        }
        break;
      case 'Skill':
        if (_skill > 5) {
          _skill--;
          _points++;
        }
        break;
    }
  }

  void setStats({required int points, required Map<String, dynamic> stats}) {
    _points = points;
    _health = stats['health'];
    _attack = stats['attack'];
    _defense = stats['defense'];
    _skill = stats['skill'];
  }
}
