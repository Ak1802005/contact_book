class AddCredetial {
  int id;
  int? userId;
  String firstName;
  String lastName;
  String number;
  String email;
  String? relation;
  String? work;
  String? address;
  String? link;

  AddCredetial(
      {this.id = -1,
        this.userId,
        required this.firstName,
        required this.lastName,
        required this.number,
        required this.email,
        this.relation,
        this.work,
        this.address,
        this.link
      });

  factory AddCredetial.fromJson(Map json) {
    return AddCredetial(
      id: json['id'] ?? -1,
      userId: json['userId'] ?? 'Unknown',
      firstName: json['firstName'] ?? 'Unknown',
      lastName: json['lastName'] ?? 'Unknown',
      number: json['number'] ?? 'Unknown',
      email: json['email'] ?? 'Unknown',
      relation: json['relation'] ?? 'Unknown',
      work: json['work'] ?? 'Unknown',
      address: json['address'] ?? 'Unknown',
      link: json['link'] ?? 'Unknown',
    );
  }

  Map toMap() {
    return {
      'id': id,
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'number': number,
      'email': email,
      'relation': relation,
      'work': work,
      'address': address,
      'link': link
    };
  }

}