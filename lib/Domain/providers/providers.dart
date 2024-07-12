import 'package:flutter_application_3/Model/viewmodels/notifiers/detail_notifier.dart';
import 'package:flutter_application_3/Model/viewmodels/notifiers/home_notifier.dart';
import 'package:flutter_application_3/Model/viewmodels/notifiers/login_notifier.dart';
import 'package:flutter_application_3/Model/viewmodels/states/detail_state.dart';
import 'package:flutter_application_3/Model/viewmodels/states/home_state.dart';
import 'package:flutter_application_3/Model/viewmodels/states/login_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginViewModelProvider =
    NotifierProvider<LoginNotifier, LoginState>(LoginNotifier.new);

final homeViewModelProvider =
    NotifierProvider<HomeNotifier, HomeState>(HomeNotifier.new);

final marketViewModelProvider =
    NotifierProvider<HomeNotifier, HomeState>(HomeNotifier.new);

final detailViewModelProvider =
    NotifierProvider<DetailNotifier, DetailState>(DetailNotifier.new);
