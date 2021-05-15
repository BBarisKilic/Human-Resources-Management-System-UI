import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hrms_ui/components/background_clipper.dart';
import 'package:hrms_ui/components/login_signup_text_field.dart';
import 'package:hrms_ui/controllers/login_page_controller.dart';
import 'package:hrms_ui/utils/constants.dart';
import 'package:hrms_ui/views/login/login_page.dart';
import 'package:hrms_ui/views/welcome/welcome_page.dart';
import 'package:sizer/sizer.dart';

class LoginPagePhone extends StatelessWidget {
  final LoginPageController _loginPageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: BackgroundClipper(LoginPage.id),
            child: buildTopSide(),
          ),
          buildBottomSide(),
        ],
      ),
    );
  }

  Container buildTopSide() {
    return Container(
      height: 60.h,
      width: 100.w,
      color: kPrimaryColor,
      child: Stack(
        children: [
          SafeArea(
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: GetPlatform.isMobile
                  ? const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                    )
                  : SizedBox(),
            ),
          ),
          Obx(() {
            return AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              top: GetPlatform.isMobile ? 12.h : 4.h,
              left: _loginPageController.didAnimationStart ? 10.w : -20.w,
              child: SvgPicture.asset(
                kHumanResourcesIconLocation,
                width: 22.w,
                color: kPrimaryDarkColor,
              ),
            );
          }),
          Obx(() {
            return AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              top: GetPlatform.isMobile ? 16.h : 8.h,
              right: _loginPageController.didAnimationStart ? 10.w : -20.w,
              child: SvgPicture.asset(
                kHeadhunterIconLocation,
                width: 22.w,
                color: kPrimaryDarkColor,
              ),
            );
          }),
          Obx(() {
            return AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              top: GetPlatform.isMobile ? 28.h : 24.h,
              left: _loginPageController.didAnimationStart ? 30.w : -20.w,
              child: Text(
                kWelcomeText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            );
          }),
          Obx(() {
            return AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              top: GetPlatform.isMobile ? 34.h : 30.h,
              right: _loginPageController.didAnimationStart ? 30.w : -20.w,
              child: Text(
                kBackText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            );
          }),
          Obx(() {
            return AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              bottom: 9.h,
              left: _loginPageController.didAnimationStart ? 10.w : -20.w,
              child: SvgPicture.asset(
                kRecruitmentIconLocation,
                width: 22.w,
                color: kPrimaryDarkColor,
              ),
            );
          }),
          Obx(() {
            return AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              bottom: 5.h,
              right: _loginPageController.didAnimationStart ? 10.w : -20.w,
              child: SvgPicture.asset(
                kEmployeeIconLocation,
                width: 22.w,
                color: kPrimaryDarkColor,
              ),
            );
          }),
        ],
      ),
    );
  }

  SafeArea buildBottomSide() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            LoginSignupTextField(
              controller: _loginPageController.emailTextEditingController,
              hintText: kEmailText,
              suffixIcon: Icons.done,
              prefixIcon: Icons.email_rounded,
            ),
            LoginSignupTextField(
              controller: _loginPageController.passwordTextEditingController,
              hintText: kPasswordText,
              suffixIcon: Icons.visibility_off_outlined,
              prefixIcon: Icons.lock_rounded,
            ),
          ],
        ),
      ),
    );
  }
}
