import 'package:flutter/material.dart';

mixin LoadingState<T extends StatefulWidget> on State<T> {
  bool _isLoading = false;

  void toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  bool get isLoading => _isLoading;
}
