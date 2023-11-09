import 'dart:convert';

class Pokemons {
  List<Pokemon>? pokemon;

  Pokemons({this.pokemon});

  Pokemons.fromJson(Map<String, dynamic> jon) {
    if (jon['pokemon'] != null) {
      pokemon = <Pokemon>[];
      jon['pokemon'].forEach((v) {
        pokemon!.add(Pokemon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pokemon != null) {
      data['pokemon'] = pokemon!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pokemon {
  num? id;
  String? number;
  String? name;
  String? img;
  List<String>? type;
  String? height;
  String? weight;
  String? candy;
  num? candyCount;
  String? egg;
  num? spawnChance;
  num? avgSpawns;
  String? spawnTime;
  List<String>? weaknesses;

  Pokemon(
      {this.id,
        this.number,
        this.name,
        this.img,
        this.type,
        this.height,
        this.weight,
        this.candy,
        this.candyCount,
        this.egg,
        this.spawnChance,
        this.avgSpawns,
        this.spawnTime,
        this.weaknesses,});

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['num'];
    name = json['name'];
    img = json['img'];
    type = json['type'].cast<String>();
    height = json['height'];
    weight = json['weight'];
    candy = json['candy'];
    candyCount = json['candy_count'];
    egg = json['egg'];
    spawnChance = json['spawn_chance'];
    avgSpawns = json['avg_spawns'];
    spawnTime = json['spawn_time'];
    weaknesses = json['weaknesses'].cast<String>();
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    data['num'] = number;
    data['name'] = name;
    data['img'] = img;
    data['type'] = type;
    data['height'] = height;
    data['weight'] = weight;
    data['candy'] = candy;
    data['candy_count'] = candyCount;
    data['egg'] = egg;
    data['spawn_chance'] = spawnChance;
    data['avg_spawns'] = avgSpawns;
    data['spawn_time'] = spawnTime;
    data['weaknesses'] = weaknesses;
    return data;
  }
}

class NextEvolution {
  String? num;
  String? name;

  NextEvolution({this.num, this.name});

  NextEvolution.fromJson(Map<String, String> json) {
    num = json['num'];
    name = json['name'];
  }

  Map<String, String> toJson() {
    final Map<String, String> data = <String, String>{};
    data['num'] = num!;
    data['name'] = name!;
    return data;
  }
}