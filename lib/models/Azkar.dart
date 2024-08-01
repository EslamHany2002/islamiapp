class Azkar {
  final String category;
  final String count;
  final String description;
  final String reference;
  final String content;

  Azkar({
    required this.category,
    required this.count,
    required this.description,
    required this.reference,
    required this.content,
  });

  factory Azkar.fromJson(Map<String, dynamic> json) {
    return Azkar(
      category: json['category'] ?? '',
      count: json['count'] ?? '',
      description: json['description'] ?? '',
      reference: json['reference'] ?? '',
      content: json['content'] ?? '',
    );
  }
}
