class Surah {
  int? id;
  String? name;
  String? arabicName;
  String? revelationPlace;
  int? versesCount;
  String? revelationOrder;

  Surah({this.id, this.name, this.arabicName, this.revelationPlace, this.versesCount, this.revelationOrder});

  Surah.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name_simple'];
    arabicName = json['name_arabic'];
    revelationPlace = json['revelation_place'];
    versesCount = json['verses_count'];
    revelationOrder = json['revelation_order'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = Map<String, dynamic>();
  //   data['number'] = number;
  //   data['name'] = name;
  //   data['englishName'] = englishName;
  //   data['englishNameTranslation'] = englishNameTranslation;
  //   data['numberOfAyahs'] = numberOfAyahs;
  //   data['revelationType'] = revelationType;
  //   return data;
  // }
}