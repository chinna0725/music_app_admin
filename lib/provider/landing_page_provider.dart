import 'package:flutter/material.dart';

class LandingPageProvider extends ChangeNotifier {
  bool isExpanded = true;

  int selectedTitleIndex = 1;
  bool get getIsExpanded => isExpanded;

  set setIsExpanded(bool isExpanded) {
    this.isExpanded = isExpanded;
    notifyListeners();
  }

  int get getSelectedTitleIndex => selectedTitleIndex;

  set setSelectedTitleIndex(int selectedTitleIndex) {
    this.selectedTitleIndex = selectedTitleIndex;
    notifyListeners();
  }
}
