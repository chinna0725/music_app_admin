
class PlaylistModel {
  final String id;
  final String name;
  final String imageUrl;

  PlaylistModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  // Factory constructor to create an instance from a map (JSON response)
  factory PlaylistModel.fromJson(Map<String, dynamic> json) {
    return PlaylistModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image_url'],
    );
  }

  // Method to convert the instance back to a map (for API request or serialization)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image_url': imageUrl,
    };
  }
}