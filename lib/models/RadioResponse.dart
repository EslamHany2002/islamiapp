class RadioResponse {
  final List<Radio>? radios;

  RadioResponse({this.radios});

  factory RadioResponse.fromJson(Map<String, dynamic> json) {
    var radiosJson = json['radios'] as List<dynamic>;
    List<Radio> radiosList = radiosJson.map((i) => Radio.fromJson(i)).toList();

    return RadioResponse(
      radios: radiosList,
    );
  }
}

class Radio {
  final String? name;
  final String? url;

  Radio({this.name, this.url});

  factory Radio.fromJson(Map<String, dynamic> json) {
    return Radio(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );
  }
}
