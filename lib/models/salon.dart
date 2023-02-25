class Salon {
  String? imgLink;

  Salon({required this.imgLink});

  Map<String, dynamic> toJson() {
    return {
      'image_source': imgLink,
    };
  }

  static Salon fromJson(Map<String, dynamic> json) {
    return Salon(imgLink: json['image_source']);
  }
}
