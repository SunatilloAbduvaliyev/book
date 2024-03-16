import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_proect/data/repository/book_repository.dart';
import 'package:library_proect/screen/home_screen/home_screen.dart';
import 'package:library_proect/view_models/view_models.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => BookViewModel(
          productRepo: BookRepository(),
        ),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) {
        ScreenUtil.init(context);
        return const MaterialApp(
          // initialRoute: RouteName.splash,
          // onGenerateRoute: AppRoutes.generateRoutes,
          home: HomeScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
