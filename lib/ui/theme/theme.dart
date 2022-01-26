import 'package:flutter/material.dart';

const _primaryColor = Color(0xFF820BD1);

ThemeData makeAppTheme() => ThemeData(
      primaryColor: _primaryColor,
      colorScheme: const ColorScheme.light(
        primary: _primaryColor,
        secondary: _primaryColor,
      ),
    );
