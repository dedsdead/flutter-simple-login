import 'package:flutter/material.dart';
import 'package:login_sqlite/routes/view_routes.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesApp.home,
      onGenerateRoute: RoutesApp.generateRoute,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.grey, errorColor: Colors.pink),
        secondaryHeaderColor: Colors.black,
      ),
    ),
  );
}
