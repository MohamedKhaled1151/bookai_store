import 'package:bookia/bookia_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/local/local_helper.dart';
import 'core/networking/dio_helper.dart';
import 'core/bloc_observier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();

  await LocalHelper.init();
  runApp(const BookiaApp());
}
