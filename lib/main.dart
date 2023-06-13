import 'package:flutter/material.dart';
import 'spacex_app.dart';
import 'package:spacex_rocket_launch_data/core/get_it.dart' as getItInstance;

void main() async{
  getItInstance.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}



