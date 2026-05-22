import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sashroy/common_widgets/custom_appbar.dart';
import 'package:sashroy/common_widgets/custom_scaffold.dart';

class NotificationScreen
    extends StatelessWidget {
  const NotificationScreen(
      {super.key});

  @override
  Widget
      build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        height: 50.h,
        ),
      body:const SafeArea(child: SingleChildScrollView(

      )),
    );
  }
}
