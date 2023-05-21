import 'package:flutter/material.dart';
import 'package:provider_state_management/provider/auth_provider.dart';
import 'package:provider_state_management/provider/count_provider.dart';
import 'package:provider_state_management/provider/example_one_provider.dart';
import 'package:provider_state_management/provider/favorite_provider.dart';
import 'package:provider_state_management/provider/theme_changer_provider.dart';
import 'package:provider_state_management/screens/count_example.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/screens/dark_theme.dart';
import 'package:provider_state_management/screens/example_one.dart';
import 'package:provider_state_management/screens/favorite_screen.dart';
import 'package:provider_state_management/screens/login_screen.dart';
import 'package:provider_state_management/screens/value_notify_listener.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteItemProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: Builder(
        builder: (BuildContext context){
          final themeChanger = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.blue,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark
            ),
            home: const LogInScreen(),
          );
        },
      ),
    );
  }
}

class MySliderApp extends StatefulWidget {
  const MySliderApp({Key? key}) : super(key: key);

  @override
  State<MySliderApp> createState() => _MySliderAppState();
}

class _MySliderAppState extends State<MySliderApp> {
  @override
  Widget build(BuildContext context) {
    print("BUILD");
    final provider = Provider.of<ExampleOneProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Slider Screen")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(builder: (context, value, child) {
            return Slider(
                min: 0.0,
                max: 1.0,
                value: value.value,
                onChanged: (double val) {
                  provider.setValue(val);
                });
          }),
          Consumer<ExampleOneProvider>(builder: (context, value, child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(value.value)),
                    child: const Center(child: Text("Container 1")),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(value.value)),
                    child: const Center(child: Text("Container 2")),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
