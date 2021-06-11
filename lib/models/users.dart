class Users {
  String firstName;
  String lastName;
  String email;
  String image;
  String gender;

  Users(firstName, lastName, email, image, gender) {
    firstName = this.firstName;
    lastName = this.lastName;
    email = this.email;
    image = this.image;
    gender = this.gender;
  }

  Users.fromJson(Map<String, dynamic> documentJson) {
    firstName = documentJson['name']['first'];
    lastName = documentJson['name']['last'];
    email = documentJson['email'];
    image = documentJson['picture']['large'];
    gender = documentJson['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name']['fisr'] = this.firstName;
    data['name']['lsta'] = this.lastName;
    data['email'] = this.email;
    data['picture']['large'] = this.image;
    data['gender'] = this.gender;

    return data;
  }
}
