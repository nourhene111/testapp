import 'package:flutter/material.dart';

// Couleurs principales
class AppColors {
  static const Color primaryColor = Colors.blue;
  static const Color accentColor = Color.fromARGB(255, 255, 255, 255);
  static const Color backgroundColor = Colors.white;
  static const Color textColor = Colors.black;
  static const Color buttonTextColor = Colors.white;
}

// Styles de texte
class AppTextStyles {
  static const TextStyle titleStyle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static const TextStyle subtitleStyle = TextStyle(
    fontSize: 16,
    color: Colors.grey,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.buttonTextColor,
  );

  static const TextStyle linkTextStyle = TextStyle(
    color: Color.fromARGB(255, 255, 255, 255),
    fontWeight: FontWeight.bold,
  );
}

// Styles de bouton
class AppButtonStyles {
  static ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
    textStyle: AppTextStyles.buttonTextStyle,
  );
}
