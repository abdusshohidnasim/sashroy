import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../gen/colors.gen.dart';

class TextFontStyle {
  //Initialising Constractor
  TextFontStyle._();

  //Splash & Onboarding Screens
  static final textStylec28cFFFFFFDMSans900 = TextStyle(
    fontFamily: "DMSans",
    fontFamilyFallback: const [
      'Open Sans',
      'Roboto',
      'Noto Sans',
    ],
    color: const Color(0xFFFFFFFF),
    fontSize: 28.sp,
    fontWeight: FontWeight.w900,
  );


///////---------------------------------------------------


// General-Sans-Semibold
static final textStyle32C1A1A1ADGSS600 = TextStyle(
  fontFamily: "General-Sans-Semibold",
  color: AppColors.c1A1A1A,
  fontSize: 32.sp,
  fontWeight: FontWeight.w600,
);
static final textStyle24C1A1A1ADGSS600 = TextStyle(
  fontFamily: "General-Sans-Semibold",
  color: AppColors.c1A1A1A,
  fontSize: 24.sp,
  fontWeight: FontWeight.w600,
);

static final textStyle20C1A1A1AGSS600 = TextStyle(
  fontFamily: "General-Sans-Semibold",
  color: AppColors.c1A1A1A,
  fontSize: 20.sp,
  fontWeight: FontWeight.w600,
);
static final textStyle16C1A1A1AGSS600 = TextStyle(
  fontFamily: "General-Sans-Semibold",
  color: AppColors.c1A1A1A,
  fontSize: 16.sp,
  fontWeight: FontWeight.w600,
);
static final textStyle16C1A1A1AGSS400 = TextStyle(
  fontFamily: "General-Sans-Semibold",
  color: AppColors.c1A1A1A,
  fontSize: 16.sp,
  fontWeight: FontWeight.w400,
);

static final textStyle14C1A1A1AGSS600 = TextStyle(
  fontFamily: "General-Sans-Semibold",
  color: AppColors.c1A1A1A,
  fontSize: 14.sp,
  fontWeight: FontWeight.w600,
);
static final textStyle12C808080AGSS400 = TextStyle(
  fontFamily: "General-Sans-Semibold",
  color: AppColors.c808080,
  fontSize: 12.sp,
  fontWeight: FontWeight.w400,
);

static final textStyle12C1A1A1ADGSS600 = TextStyle(
  fontFamily: "General-Sans-Semibold",
  color: AppColors.c1A1A1A,
  fontSize: 12.sp,
  fontWeight: FontWeight.w600,
);




///////---------------------------------------------------
// General-Sans-Regular
static final textStyle16C808080GSR400 = TextStyle(
  fontFamily: "General-Sans-Regular",
  color: AppColors.c808080,
  fontSize: 16.sp,
  fontWeight: FontWeight.w400,
);
static final textStyle16C808080GSR500 = TextStyle(
  fontFamily: "General-Sans-Regular",
  color: AppColors.c808080,
  fontSize: 16.sp,
  fontWeight: FontWeight.w500,
);

static final textStyle14C1A1A1AGSR500 = TextStyle(
  fontFamily: "General-Sans-Regular",
  color: AppColors.c1A1A1A,
  fontSize: 14.sp,
  fontWeight: FontWeight.w500,
);

static final textStyle14C808080GSR400 = TextStyle(
  fontFamily: "General-Sans-Regular",
  color: AppColors.c808080,
  fontSize: 14.sp,
  fontWeight: FontWeight.w400,
);
static final textStyle12C808080GSR400 = TextStyle(
  fontFamily: "General-Sans-Regular",
  color: AppColors.c808080,
  fontSize: 12.sp,
  fontWeight: FontWeight.w400,
);


///////---------------------------------------------------

// General-Sans-Medium
static final textStyle16C1A1A1ADGSM500 = TextStyle(
  fontFamily: "General-Sans-Medium",
  color: AppColors.c1A1A1A,
  fontSize: 16.sp,
  fontWeight: FontWeight.w500,
);

static final textStyle16CFFFFFFGSM500 = TextStyle(
  fontFamily: "General-Sans-Medium",
  color: AppColors.cFFFFFF,
  fontSize: 16.sp,
  fontWeight: FontWeight.w500,
);


static final textStyle14C1A1A1ADGSM500 = TextStyle(
  fontFamily: "General-Sans-Medium",
  color: AppColors.c1A1A1A,
  fontSize: 14.sp,
  fontWeight: FontWeight.w500,
);

static final textStyle12C808080GSM500 = TextStyle(
  fontFamily: "General-Sans-Medium",
  color: AppColors.c808080,
  fontSize: 12.sp,
  fontWeight: FontWeight.w500,
);
static final textStyle20C000000GSM500 = TextStyle(
  fontFamily: "General-Sans-Medium",
  color: AppColors.c000000,
  fontSize: 20.sp,
  fontWeight: FontWeight.w500,
);


///////---------------------------------------------------

// Poppins


static final textStyle14C484848Poppins400 = TextStyle(
  fontFamily: "Poppins",
  color: AppColors.c484848,
  fontSize: 14.sp,
  fontWeight: FontWeight.w400,
);

static final textStyle14CFFFFFFPoppins500 = TextStyle(
  fontFamily: "Poppins",
  color: AppColors.cFFFFFF,
  fontSize: 14.sp,
  fontWeight: FontWeight.w500,
);

static final textStyle20C000000Poppins500 = TextStyle(
  fontFamily: "Poppins",
  color: AppColors.c000000,
  fontSize: 20.sp,
  fontWeight: FontWeight.w500,
);

static final textStyle9CFFFFFFPoppins500 = TextStyle(
  fontFamily: "Poppins",
  color: AppColors.cFFFFFF,
  fontSize: 9.sp,
  fontWeight: FontWeight.w500,
);
static final textStyle9CFFFFFFPoppins400 = TextStyle(
  fontFamily: "Poppins",
  color: AppColors.cFFFFFF,
  fontSize: 9.sp,
  fontWeight: FontWeight.w400,
);
static final textStyle12C8A8A8APoppins400 = TextStyle(
  fontFamily: "Poppins",
  color: AppColors.c8A8A8A,
  fontSize: 12.sp,
  fontWeight: FontWeight.w400,
);
static final textStyle16C484848Poppins500 = TextStyle(
  fontFamily: "Poppins",
  color: AppColors.c484848,
  fontSize: 16.sp,
  fontWeight: FontWeight.w500,
);

static final textStyle16C000000Poppins400 = TextStyle(
  fontFamily: "Poppins",
  color: AppColors.c000000,
  fontSize: 16.sp,
  fontWeight: FontWeight.w400,
);



///////---------------------------------------------------

// Digital-Numbers


static final textStyle22C484848DigitalNumbers400 = TextStyle(
  fontFamily: "Digital-Numbers",
  color: AppColors.c484848,
  fontSize: 22.sp,
  fontWeight: FontWeight.w400,
);
}