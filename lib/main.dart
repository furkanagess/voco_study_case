import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voco_study_case/feature/controller/auth_controller.dart';
import 'package:voco_study_case/feature/controller/participant_controller.dart';
import 'package:voco_study_case/feature/service/network_service.dart';
import 'package:voco_study_case/feature/view/login_view.dart';
import 'package:voco_study_case/feature/view/participant_list_view.dart';
import 'package:voco_study_case/product/constants/app_strings.dart';
import 'package:voco_study_case/product/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final authController = AuthController();
  await authController.loadTokenFromLocal();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthController()),
        ChangeNotifierProvider.value(value: authController),
        ChangeNotifierProvider(create: (context) => ParticipantController()),
        StreamProvider(
          create: (context) => NetworkService().controller.stream,
          initialData: NetworkStatus.online,
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);
    return MaterialApp(
      theme: AppTheme().theme,
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      home: authController.token != null
          ? const ParticipantListView()
          : LoginView(),
    );
  }
}
