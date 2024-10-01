import 'package:flutter/material.dart';

class Constants {
  Constants._();

  static const String appName = 'TalentForge';
  static const String appVersion = 'version 1.0.1';

  static const double flutterBootstrapGutterSize = 10.0;
  static const int gridRowsPerPage = 10;

  static const String imageDir = 'assets/images';
  static const String dialogQuestionIcon = '$imageDir/dialog-question-icon.png';
  static const String dialogInfoIcon = '$imageDir/dialog-info-icon.png';
  static const String dialogErrorIcon = '$imageDir/dialog-error-icon.png';
  static const String logotipo = '$imageDir/logotipo.png';
  static const String backgroundImage = '$imageDir/background.png';
  static const String loginImage = '$imageDir/login.jpg';
  static const String profileImage = '$imageDir/profile.png';

  static const String iconDir = 'assets/icons';
  static const String knowledge = '$iconDir/knowledge.png';
  static const String engagement = '$iconDir/engagement.png';
  static const String communication = '$iconDir/communication.png';
  static const String goals = '$iconDir/goals.png';
  static const String productivity = '$iconDir/productivity.png';
  static const String training = '$iconDir/training.png';
  static const String feedback = '$iconDir/feedback.png';
  static const String problemResolved = '$iconDir/problem_resolved.png';
  static const String resolution = '$iconDir/resolution.png';
  static const String absence = '$iconDir/absence.png';
  static const String late = '$iconDir/late.png';
  static const String slogan = '$iconDir/slogan.jpg';

  // local database
  static const sqlGetSettings = "SELECT * FROM HIDDEN_SETTINGS WHERE ID=1";

  static const primaryColor = Color(0xFF2697FF);
  static const secondaryColor = Color(0xFF2A2D3E);
  static const bgColor = Color(0xFF212332);
  static const defaultPadding = 16.0;
}

enum DialogType { info, warning, error, success, question, noHeader }
