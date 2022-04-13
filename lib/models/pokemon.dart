class Pokemon {
  String id;
  String number;
  String name;
  String image;
  List<String> types;
  Weight weight;
  Weight height;
  String classification;
  List<String> resistant;
  Attacks attacks;
  List<String> weaknesses;
  double fleeRate;
  num maxCP;
  num maxHP;
  List<Evolutions> evolutions;
  EvolutionRequirements evolutionRequirements;

  Pokemon(
      {this.id,
      this.number,
      this.name,
      this.image,
      this.types,
      this.weight,
      this.height,
      this.classification,
      this.resistant,
      this.attacks,
      this.weaknesses,
      this.fleeRate,
      this.maxCP,
      this.maxHP,
      this.evolutions,
      this.evolutionRequirements});

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    name = json['name'];
    image = json['image'];
    types = json['types'].cast<String>();
    weight =
        json['weight'] != null ? new Weight.fromJson(json['weight']) : null;
    height =
        json['height'] != null ? new Weight.fromJson(json['height']) : null;
    classification = json['classification'];
    resistant = json['resistant'].cast<String>();
    attacks =
        json['attacks'] != null ? new Attacks.fromJson(json['attacks']) : null;
    weaknesses = json['weaknesses'].cast<String>();
    fleeRate = json['fleeRate'];
    maxCP = json['maxCP'];
    maxHP = json['maxHP'];
    if (json['evolutions'] != null) {
      evolutions = new List<Evolutions>();
      json['evolutions'].forEach((v) {
        evolutions.add(new Evolutions.fromJson(v));
      });
    }
    evolutionRequirements = json['evolutionRequirements'] != null
        ? new EvolutionRequirements.fromJson(json['evolutionRequirements'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['number'] = this.number;
    data['name'] = this.name;
    data['image'] = this.image;
    data['types'] = this.types;
    if (this.weight != null) {
      data['weight'] = this.weight.toJson();
    }
    if (this.height != null) {
      data['height'] = this.height.toJson();
    }
    data['classification'] = this.classification;
    data['resistant'] = this.resistant;
    if (this.attacks != null) {
      data['attacks'] = this.attacks.toJson();
    }
    data['weaknesses'] = this.weaknesses;
    data['fleeRate'] = this.fleeRate;
    data['maxCP'] = this.maxCP;
    data['maxHP'] = this.maxHP;
    if (this.evolutions != null) {
      data['evolutions'] = this.evolutions.map((v) => v.toJson()).toList();
    }
    if (this.evolutionRequirements != null) {
      data['evolutionRequirements'] = this.evolutionRequirements.toJson();
    }
    return data;
  }
}

class Weight {
  String minimum;
  String maximum;

  Weight({this.minimum, this.maximum});

  Weight.fromJson(Map<String, dynamic> json) {
    minimum = json['minimum'];
    maximum = json['maximum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['minimum'] = this.minimum;
    data['maximum'] = this.maximum;
    return data;
  }
}

class Attacks {
  List<Skill> fast;
  List<Skill> special;

  Attacks({this.fast, this.special});

  Attacks.fromJson(Map<String, dynamic> json) {
    if (json['fast'] != null) {
      fast = new List<Skill>();
      json['fast'].forEach((v) {
        fast.add(new Skill.fromJson(v));
      });
    }
    if (json['special'] != null) {
      special = new List<Skill>();
      json['special'].forEach((v) {
        special.add(new Skill.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fast != null) {
      data['fast'] = this.fast.map((v) => v.toJson()).toList();
    }
    if (this.special != null) {
      data['special'] = this.special.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Skill {
  String name;
  String type;
  num damage;

  Skill({this.name, this.type, this.damage});

  Skill.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    damage = json['damage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['damage'] = this.damage;
    return data;
  }
}

class Evolutions {
  String id;
  String name;
  List<String> types;
  String number;
  String image;

  Evolutions({this.id, this.name, this.types, this.number, this.image});

  Evolutions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    types = json['types'].cast<String>();
    number = json['number'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['types'] = this.types;
    data['number'] = this.number;
    data['image'] = this.image;
    return data;
  }
}

class EvolutionRequirements {
  num amount;
  String name;

  EvolutionRequirements({this.amount, this.name});

  EvolutionRequirements.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['name'] = this.name;
    return data;
  }
}

class PokemonList {
  List<PokemonInfo> pokemons;

  PokemonList({this.pokemons});

  PokemonList.fromJson(Map<String, dynamic> json) {
    if (json['pokemons'] != null) {
      pokemons = new List<PokemonInfo>();
      json['pokemons'].forEach((v) {
        pokemons.add(new PokemonInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pokemons != null) {
      data['pokemons'] = this.pokemons.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PokemonInfo {
  String id;
  String number;
  String name;
  String image;
  List<String> types;

  PokemonInfo({this.id, this.number, this.name, this.image, this.types});

  PokemonInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    name = json['name'];
    image = json['image'];
    types = json['types'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['number'] = this.number;
    data['name'] = this.name;
    data['image'] = this.image;
    data['types'] = this.types;
    return data;
  }
}
