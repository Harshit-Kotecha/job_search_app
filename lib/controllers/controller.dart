import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_search_app/features/saved_jobs_screen.dart';
import 'package:job_search_app/features/widgets/job_details_card.dart';

import '../features/home/home_screen.dart';
import '../features/messages/messages_screen.dart';

class Controller extends GetxController {
  final RxInt _currentIndex = 0.obs;
  final List<Widget> _tabs = [
    const HomeScreen(),
    const MessagesScreen(),
    SavedJobsScreen(),
    const JobDetailsCard(),
  ];

  final RxInt _tabController = 0.obs;

  Widget switchScreen() {
    return _tabs[_currentIndex.value];
  }

  // ignore: avoid_setters_without_getters
  set switchTab(int index) {
    _tabController.value = index;
  }

  int get currentIndex {
    return _currentIndex.value;
  }

  int get tabController {
    return _tabController.value;
  }

  set currentIndex(int index) {
    _currentIndex.value = index;
  }

  set tabController(int index) {
    _tabController.value = index;
  }
}
