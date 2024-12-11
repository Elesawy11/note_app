import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'fatures/home/presentation/views/home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async {
  await ScreenUtil.ensureScreenSize();
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize:const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xffCFCCD4),
        ),
        debugShowCheckedModeBanner: false,
        home:const HomeView(),
      ),
    );
  }
}
