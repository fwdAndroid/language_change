import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class Messages extends Translations {
  final Map<String, Map<String, String>> languages;
  Messages({required this.languages});

  Map<String, Map<String, String>> get keys {
    return languages;
  }
}
