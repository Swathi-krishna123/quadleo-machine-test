import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quadleo_machine_test/utils/bloc_provider/bloc_provider.dart';
import 'package:quadleo_machine_test/utils/constants/app_colors.dart';
import 'package:quadleo_machine_test/utils/constants/app_fonts.dart';
import 'package:quadleo_machine_test/utils/router/app_router.dart';

void main() async{
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBlocProvider(
      child: MaterialApp(
        title: 'Quadleo Machine Test',
        theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
                cursorColor: AppColors.primary,
                selectionColor: AppColors.primary,
                selectionHandleColor: AppColors.primary,
              ),
          scaffoldBackgroundColor: AppColors.background,
          appBarTheme: AppBarThemeData(
            backgroundColor: AppColors.background,
            elevation: 0,
            centerTitle: true,
            toolbarHeight: 80,
            titleTextStyle: AppFonts.subheading,
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: AppRouter.splash,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
