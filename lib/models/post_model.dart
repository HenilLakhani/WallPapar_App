class Posts {
  final int id;
  final int userID;
  final String name;
  final String body;

  Posts({
    required this.id,
    required this.body,
    required this.name,
    required this.userID,
  });

  factory Posts.fromMap({required Map data}) {
    return Posts(
      id: data['id'],
      body: data['body'],
      name: data['name'],
      userID: data['userID'],
    );
  }
}
