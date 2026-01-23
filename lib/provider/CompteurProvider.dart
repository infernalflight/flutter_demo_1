import 'package:flutter/material.dart';

class CompteurProvider extends ChangeNotifier
{
    int _compteur = 0;

    int get compteur => _compteur;

    void increment() {
      _compteur++;
      notifyListeners();
    }
}