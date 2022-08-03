class Pokemodel {
  Pokemodel({this.abiities});
  List<Abilities> abiities;
  Pokemodel.fromjson(Map<String, dynamic> json) {
    abiities = [];
    json["abilities"].forEach((v) {
      abiities.add(new Abilities.fromjson(v));
    });
  }
}

class Abilities {
  // ignore: non_constant_identifier_names
  Abilities({this.slot, this.ability, this.is_hidden});
  int slot;
  Ability ability;
  // ignore: non_constant_identifier_names
  bool is_hidden;

  Abilities.fromjson(Map<String, dynamic> json) {
    slot = json["slot"];
    ability = Ability.fromjson(json["ability"]);
    is_hidden = json["is_hidden"];
  }
}

class Ability {
  Ability({this.name, this.url});
  String name, url;

  Ability.fromjson(Map<String, dynamic> json) {
    name = json["name"];
    url = json["url"];
  }
}
