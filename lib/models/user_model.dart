class User {
  final String uid;
  final String userName;
  final String email;
  // final String userRole;

  User({
    this.uid,
    this.userName,
    this.email,
  });

// Firestore data를 User Object에 넣기
  User.fromData(Map<String, dynamic> data)
      : uid = data['uid'],
        userName = data['userName'],
        email = data['email'];

// Firestore에 User data 넣기
  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'email': email,
    };
  }
}
