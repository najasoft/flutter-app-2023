class Contact {
  int id;
  String nom;
  String prenom;
  int age;
  String photo;
  String email;
  Contact({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.age,
    required this.photo,
    required this.email,
  });
// Constructeur nommé
  Contact.empty()
      : id = 0,
        nom = '',
        prenom = '',
        age = 0,
        photo = '',
        email = '';
}
