import 'package:fecth2/future/data/model/pokemodel.dart';

class Pilihpoke {
  int base_experience;
  List<Abilities> abilites;
  Pilihpoke({this.base_experience, this.abilites});

  Pilihpoke.fromjson(Map<String, dynamic> json) {
    base_experience = json["base_experience"];
    abilites = List<Abilities>.from(
        json["abilities"].map((x) => Abilities.fromjson(x)));
  }
}

class Abilities {
  Ability ability;
  Abilities({this.ability});

  Abilities.fromjson(Map<String, dynamic> json) {
    ability = Ability.fromjson(json[""]);
  }
}

class Ability {
  String ablilityname;
  int slot;
  Ability({this.ablilityname, this.slot});
  Ability.fromjson(Map<String, dynamic> json) {
    ablilityname = json["name"];
    slot = json["slot"];
  }
}
