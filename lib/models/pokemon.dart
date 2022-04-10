class Pokemon {
  String id;
  String number;
  String name;
  Weight weight;
  Weight height;
  String classification;
  List<String> types;
  List<String> resistant;
  Attacks attacks;
  List<String> weaknesses;
  double fleeRate;
  int maxCP;
  int maxHP;
  List<Evolutions> evolutions;
  EvolutionRequirements evolutionRequirements;
  String image;

  Pokemon(
      {this.id,
      this.number,
      this.name,
      this.weight,
      this.height,
      this.classification,
      this.types,
      this.resistant,
      this.attacks,
      this.weaknesses,
      this.fleeRate,
      this.maxCP,
      this.maxHP,
      this.evolutions,
      this.evolutionRequirements,
      this.image});

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    name = json['name'];
    weight =
        json['weight'] != null ? new Weight.fromJson(json['weight']) : null;
    height =
        json['height'] != null ? new Weight.fromJson(json['height']) : null;
    classification = json['classification'];
    types = json['types'].cast<String>();
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
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['number'] = this.number;
    data['name'] = this.name;
    if (this.weight != null) {
      data['weight'] = this.weight.toJson();
    }
    if (this.height != null) {
      data['height'] = this.height.toJson();
    }
    data['classification'] = this.classification;
    data['types'] = this.types;
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
    data['image'] = this.image;
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
  int damage;

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

  Evolutions({this.id});

  Evolutions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}

class EvolutionRequirements {
  int amount;
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
