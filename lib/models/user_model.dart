// class UserModel {
//   final String name;
//   final String mobileNumber;
//   final String imageUrl;

//   UserModel({required this.name,
//    required this.mobileNumber,
//     required this.imageUrl});
// }

class UserModel {
  final String id;
  final String name;
  final String mobileNumber;
  // final String imageUrl;

  UserModel({
    required this.id,
    required this.name,
    required this.mobileNumber,
    // required this.imageUrl,
  });

  // Factory constructor to create an instance from a map (JSON response)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      // imageUrl: json['image_url'],
      mobileNumber: json['phone'],
    );
  }

  // Method to convert the instance back to a map (for API request or serialization)
  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'image_url': imageUrl,
  //   };
  // }
}
