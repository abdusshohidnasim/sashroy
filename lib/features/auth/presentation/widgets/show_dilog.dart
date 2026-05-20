// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:sashroy/common_widgets/custom_button.dart';
// import 'package:sashroy/gen/assets.gen.dart';
// import '../../../../constants/text_font_style.dart';
// import '../../../../gen/colors.gen.dart';
// import '../../../../helpers/all_routes.dart';
// import '../../../../helpers/navigation_service.dart';
// import '../../../../helpers/ui_helpers.dart';

// class SucessfullShowDilog {
//   static void show(BuildContext context) {
//     showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (context) {
//         // Timer(const Duration(seconds: 3), () {

//         //   NavigationService.navigateToReplacement(
//         //       Routes.loginScreen);

//         // });
//         return ClipRRect(
//           child: ClipRRect(
//             child: BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
//               child: Dialog(
//                 insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
//                 backgroundColor: AppColors.cFFFFFF,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16.r),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.all(20.w),
//                   child: Column(mainAxisSize: MainAxisSize.min, children: [
//                     Image.asset(
//                       Assets.icons.checkDuotone.path,
//                       height: 75.h,
//                       width: 75.w,
//                     ),
//                     UIHelper.verticalSpace(10.h),
//                     Text("Password Changed!",
//                         style: TextFontStyle.textStyle24C1A1A1ADGSS600),
//                     UIHelper.verticalSpace(10.h),
//                     Text(
//                       "Your can now use your new password to login to your account.",
//                       style: TextFontStyle.textStyle16C808080GSR400,
//                       textAlign: TextAlign.center,
//                     ),
//                     UIHelper.verticalSpace(20.h),
//                     CustomButton(onTap: (){
//                       NavigationService.navigateTo(Routes.loginScreen); 

//                     }, btnName: "Login")
//                   ]),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
