import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voco_study_case/feature/service/connectivity_service.dart';
import 'package:voco_study_case/product/constants/app_strings.dart';
import 'package:voco_study_case/product/extension/context_extension.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  const AppScaffold({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    var networkStatus = Provider.of<NetworkStatus>(context);
    return Scaffold(
      body: networkStatus == NetworkStatus.online
          ? child
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        AppStrings.noConnection,
                        style: context.textTheme.bodyMedium,
                      ),
                    )
                  ],
                ),
              ],
            ),
    );
  }
}
