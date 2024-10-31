import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Assurez-vous d'ajouter cette dépendance à pubspec.yaml
import 'profile_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String selectedGender = 'Male'; // Initialisation du genre par défaut
  DateTime? selectedDate; // Date de naissance sélectionnée
  String? imagePath; // Chemin de l'image de profil

  // Fonction pour afficher le calendrier et sélectionner la date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000), // Date initiale par défaut
      firstDate: DateTime(1900), // Date de début
      lastDate: DateTime.now(), // Date maximale
    );
    if (pickedDate != null && pickedDate != selectedDate)
      setState(() {
        selectedDate = pickedDate;
      });
  }

  // Fonction pour changer la photo de profil
  Future<void> _changeProfilePicture() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imagePath = pickedFile.path; // Mettre à jour le chemin de l'image
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Couleur de fond blanche
      appBar: AppBar(
        title: Text('Personal Data'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40), // Espace pour remonter les champs

              // Image de profil avec icône de caméra
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: imagePath != null
                              ? AssetImage(
                                  imagePath!) // Utiliser l'image sélectionnée
                              : AssetImage(
                                  'assets/images/image1.png'), // Image par défaut
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap:
                            _changeProfilePicture, // Appeler la fonction pour changer l'image
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4.0,
                                spreadRadius: 1.0,
                              ),
                            ],
                          ),
                          child: Icon(Icons.camera_alt,
                              color: const Color.fromARGB(255, 124, 103, 182)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Titre et champ pour le nom
              Text('Your Name',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ProfileField(label: 'Your Name', value: 'William John Malik'),

              // Titre et champ pour la date de naissance avec le calendrier
              SizedBox(height: 10),
              Text('Date of Birth',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: ProfileField(
                    label: 'Date of Birth',
                    value: selectedDate != null
                        ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                        : 'Select your birth date',
                    isEditable: false,
                  ),
                ),
              ),

              // Titre et champ pour l'emploi
              SizedBox(height: 10),
              Text('Your Job',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ProfileField(label: 'Your Job', value: 'Successor Designer'),

              // Titre et champ pour le revenu mensuel
              SizedBox(height: 10),
              Text('Monthly Income',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ProfileField(
                  label: 'Monthly Income', value: '\$500 - \$3000 / year'),

              // Titre et sélection du genre avec boutons radio dans des boîtes
              SizedBox(height: 10),
              Text('Gender',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Centrer les genres
                children: [
                  // Boîte pour "Male"
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 'Male';
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8), // Élargir les boîtes
                      decoration: BoxDecoration(
                        color: selectedGender == 'Male'
                            ? Colors.blue[100]
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: selectedGender == 'Male'
                              ? Colors.blue
                              : Colors.grey,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Radio<String>(
                            value: 'Male',
                            groupValue: selectedGender,
                            onChanged: (String? value) {
                              setState(() {
                                selectedGender = value!;
                              });
                            },
                          ),
                          Text('Male'),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 20),

                  // Boîte pour "Female"
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 'Female';
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8), // Élargir les boîtes
                      decoration: BoxDecoration(
                        color: selectedGender == 'Female'
                            ? Colors.pink[100]
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: selectedGender == 'Female'
                              ? Colors.pink
                              : Colors.grey,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Radio<String>(
                            value: 'Female',
                            groupValue: selectedGender,
                            onChanged: (String? value) {
                              setState(() {
                                selectedGender = value!;
                              });
                            },
                          ),
                          Text('Female'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
