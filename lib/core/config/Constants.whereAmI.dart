import 'package:flutter/material.dart';

extension FlavourTypeExtension on String {
  Color getFlavourColor() {
    switch (this) {
      case 'dev':
        return Colors.yellow[800];
      case 'stage':
        return Colors.grey[600];
      case 'prod':
        return Colors.green[600];
      default:
        return Colors.blue[600];
    }
  }

  String getFlavourName() {
    switch (this) {
      case 'dev':
        return 'Development';
      case 'stage':
        return 'Staging';
      case 'prod':
        return 'Production';
      default:
        return 'Unknown';
    }
  }

  baseurl() {
    switch (this) {
      case 'dev':
        return 'https://covid-193.p.rapidapi.com/history?country=usa&day=2022-06-02';
      case 'stage':
        return 'Staging';
      case 'prod':
        return 'https://covid-193.p.rapidapi.com/history?country=indonesia&day=2022-06-02';
      default:
        return 'Unknown';
    }
  }
}
