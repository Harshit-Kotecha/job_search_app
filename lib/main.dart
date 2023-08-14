import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:job_search_app/app_job_search.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  OneSignal.shared.setAppId('0deac066-5ac1-4639-826b-0157ad75727b');

  runApp(const JobSearchApp());
}
