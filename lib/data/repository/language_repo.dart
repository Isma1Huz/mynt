import 'package:flutter/material.dart';
import 'package:mynt/data/model/response/language_model.dart';
import 'package:mynt/util/app_constants.dart';

class LanguageRepo {
  List<LanguageModel> getAllLanguages({BuildContext context}) {
    return AppConstants.languages;
  }
}
