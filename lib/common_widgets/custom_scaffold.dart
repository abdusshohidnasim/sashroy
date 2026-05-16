
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sashroy/gen/colors.gen.dart';

class CustomScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;

  const CustomScaffold({
    super.key,
    this.appBar,
    this.body,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.cFFFFFF,
        body:  SafeArea(
          child: Column(
            children: [
              if (appBar != null) appBar!,
              Expanded(
                child: body ?? const SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
