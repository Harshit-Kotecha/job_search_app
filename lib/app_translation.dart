import 'package:job_search_app/constants/strings.dart';

abstract class AppTranslation {
  AppTranslation._();

  static Map<String, Map<String, String>> translationKeys = {
    "en_US": enUS,
    "bn": bn,
    "te": te,
    "ur": ur,
    "hi": hi,
    "ta": ta,
    "es": es,
    "mr": mr,
    "ru": ru,
    "fr": fr
  };
}

final Map<String, String> enUS = {
  'greeting': 'Hello, How are you?',
  'day': "Awesome day..."
};

final Map<String, String> bn = {
  'greeting': 'হ্যালো, আপনি কেমন আছেন?',
  'day': "সন্ত্রস্ত দিন..."
};
final Map<String, String> te = {
  'greeting': 'హలో, మీరు ఎలా ఉన్నారు?',
  'day': "గొప్ప రోజు..."
};
final Map<String, String> ur = {
  'greeting': 'ہیلو آپ کیسے ہیں؟',
  'day': "بہت اچھا دن ..."
};
final Map<String, String> hi = {
  'greeting': 'नमस्ते आप कैसे हैं?',
  'day': "शानदार दिन...",
  StaticText.welcomeBackProfile: 'नमस्ते',
  StaticText.profileName: 'शानदार',
};

final Map<String, String> ta = {
  'greeting': "வணக்கம் எப்படி இருக்கிறாய்?",
  'day': "அற்புதமான நாள் ..."
};
final Map<String, String> es = {
  'greeting': "¿Hola como estas?",
  'day': "Día impresionante..."
};
final Map<String, String> mr = {
  'greeting': "हॅलो, कसे आहात",
  'day': "अप्रतिम दिवस ..."
};
final Map<String, String> ru = {
  'greeting': "Привет как дела?",
  'day': "Замечательный день..."
};
final Map<String, String> fr = {
  'greeting': "Salut comment allez-vous?",
  'day': "Super journée..."
};
