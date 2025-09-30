class AnimalResponse {
  final List<Animal> animals;

  final String status;

  AnimalResponse({required this.animals, required this.status});

  factory AnimalResponse.fromJson(Map<String, dynamic> json) {
    final List<dynamic> imagesJson = json['message'];
    return AnimalResponse(
      animals: imagesJson.map((image) => Animal.fromJson(image)).toList(),
      status: json['status'],
    );
  }
}

class Animal {
  final String imageUrl;

  Animal({required this.imageUrl});

  factory Animal.fromJson(String json) {
    return Animal(imageUrl: json);
  }
}
