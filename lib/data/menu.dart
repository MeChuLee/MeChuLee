class Menu {
  int? id;
  String? name;
  String? classification;
  int? calorie;
  int? price;
  List<String>? ingredients;
  List<bool>? allergy;
  List<bool>? vegetarianism;
  List<bool>? taste;
  int? sex;
  List<bool>? age;
  List<bool>? mood;
  List<bool>? weather;
  bool? hangover;
  bool? freeTime;
  int? fatigue;
  int? hungry;
  int? people;

  Menu({
      this.id,
      this.name,
      this.classification,
      this.calorie,
      this.price,
      this.ingredients,
      this.allergy,
      this.vegetarianism,
      this.taste,
      this.sex,
      this.age,
      this.mood,
      this.weather,
      this.hangover,
      this.freeTime,
      this.fatigue,
      this.hungry,
      this.people
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
      id : json["id"],
      name : json["name"],
      classification : json["classification"],
      calorie : json["calorie"],
      price : json["price"],
      ingredients : json["ingredients"],
      allergy : json["allergy"],
      vegetarianism : json["vegetarianism"],
      taste : json["taste"],
      sex : json["sex"],
      age :  json["age"],
      mood : json["mood"],
      weather : json["weather"],
      hangover : json["hangover"],
      freeTime : json["freeTime"],
      fatigue : json["fatigue"],
      hungry : json["hungry"],
      people : json["people"]
  );
}
