import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hrms_ui/components/background_clipper.dart';
import 'package:hrms_ui/components/login_signup_text_field.dart';
import 'package:hrms_ui/components/welcome_button.dart';
import 'package:hrms_ui/controllers/signup_page_controller.dart';
import 'package:hrms_ui/utils/constants.dart';
import 'package:hrms_ui/views/signup/signup_page.dart';
import 'package:sizer/sizer.dart';

class SignupPagePhone extends StatelessWidget {
  final SignupPageController _signupPageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: BackgroundClipper(SignupPage.id),
            child: buildTopSide(),
          ),
          buildBottomSide(),
        ],
      ),
    );
  }

  Container buildTopSide() {
    return Container(
      height: 25.h,
      width: 100.w,
      color: kPrimaryColor,
      child: Stack(
        children: [
          SafeArea(
            bottom: false,
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
              top: GetPlatform.isMobile ? 10.h : 2.h,
              left: _signupPageController.didAnimationStart ? 30.w : -20.w,
              child: Text(
                kCreateText,
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
              top: GetPlatform.isMobile ? 16.h : 8.h,
              right: _signupPageController.didAnimationStart ? 30.w : -20.w,
              child: Text(
                kAccountText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Padding buildBottomSide() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: SizedBox(
        height: 75.h,
        width: 100.w,
        child: SafeArea(
          top: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 50.h,
                child: DefaultTabController(
                  length: 2,
                  child: Scaffold(
                    appBar: TabBar(
                      indicatorColor: kPrimaryColor,
                      labelColor: kPrimaryColor,
                      unselectedLabelColor: Colors.black54,
                      labelStyle: TextStyle(fontSize: 12.sp),
                      tabs: [
                        Tab(
                          icon: Icon(
                            Icons.person_pin_sharp,
                          ),
                          text: kIndividualText,
                        ),
                        Tab(
                          icon: Icon(
                            FontAwesomeIcons.building,
                          ),
                          text: kCompany,
                        ),
                      ],
                    ),
                    body: TabBarView(
                      children: [
                        Column(
                          children: [
                            Spacer(),
                            LoginSignupTextField(
                              controller: _signupPageController
                                  .emailTextEditingController,
                              hintText: kEmailText,
                              suffixIcon: null,
                              prefixIcon: Icons.email_rounded,
                            ),
                            Spacer(),
                            LoginSignupTextField(
                              controller: _signupPageController
                                  .passwordTextEditingController,
                              hintText: kPasswordText,
                              suffixIcon: Icons.visibility_off_outlined,
                              prefixIcon: Icons.lock_rounded,
                            ),
                            Spacer(),
                            LoginSignupTextField(
                              controller: _signupPageController
                                  .passwordTextEditingController,
                              hintText: kFirstNameText,
                              suffixIcon: null,
                              prefixIcon: Icons.person_outline,
                            ),
                            Spacer(),
                            LoginSignupTextField(
                              controller: _signupPageController
                                  .passwordTextEditingController,
                              hintText: kLastNameText,
                              suffixIcon: null,
                              prefixIcon: Icons.person,
                            ),
                            Spacer(),
                            LoginSignupTextField(
                              controller: _signupPageController
                                  .passwordTextEditingController,
                              hintText: kNationalIdText,
                              suffixIcon: null,
                              prefixIcon: FontAwesomeIcons.idCard,
                            ),
                            Spacer(),
                            LoginSignupTextField(
                              controller: _signupPageController
                                  .passwordTextEditingController,
                              hintText: kYearOfBirthText,
                              suffixIcon: null,
                              prefixIcon: Icons.date_range_rounded,
                            ),
                            Spacer(),
                          ],
                        ),
                        Text("asdasd"),
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(
                flex: 4,
              ),
              WelcomeButton(
                text: kSignUpText,
                onPressed: () {},
                textColor: Colors.white,
                buttonColor: kPrimaryColor,
                borderColor: kPrimaryColor,
              ),
              Spacer(),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: 1,
                      color: Colors.black54,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "or",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: 1,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              Spacer(),
              WelcomeButton(
                text: kLogInText,
                onPressed: () {},
                textColor: Colors.black54,
                buttonColor: Colors.white,
                borderColor: Colors.black54,
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}