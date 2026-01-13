import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quadleo_machine_test/utils/constants/app_colors.dart';
import 'package:quadleo_machine_test/utils/constants/app_fonts.dart';
import 'package:quadleo_machine_test/utils/constants/validators.dart';
import 'package:quadleo_machine_test/utils/router/app_router.dart';
import 'package:quadleo_machine_test/utils/shared_pref_helper/shared_pref_helper.dart';
import 'package:quadleo_machine_test/views/auth/bloc/auth_bloc.dart';
import 'package:quadleo_machine_test/views/auth/bloc/auth_event.dart';
import 'package:quadleo_machine_test/views/auth/bloc/auth_state.dart';
import 'package:quadleo_machine_test/views/common_widgets/custom_button1.dart';
import 'package:quadleo_machine_test/views/common_widgets/custom_snackbar.dart';
import 'package:quadleo_machine_test/views/common_widgets/custom_textformfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey=GlobalKey<FormState>();
  final TextEditingController emailcontroller = TextEditingController();

  final TextEditingController passwordcontroller = TextEditingController();
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        
        title: const Padding(
          padding: EdgeInsets.only(top: 30.0),
          child: Text("Login"),
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) async{
          if (state is AuthAuthenticated) {
            await SharedPrefHelper.setLoggedIn(true);
            Navigator.pushReplacementNamed(context, AppRouter.home);
          }
      
          if (state is AuthError) {
            CustomSnackBar.error(context, "Invalid Credentials");
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: LayoutBuilder(
              builder: (context,constraints) {
                return SingleChildScrollView(
                   padding: EdgeInsets.symmetric(horizontal: 15),
                  child: ConstrainedBox(
                     constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Form(
                        key: _formkey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Welcome back!",
                              style: AppFonts.heading,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 27),
                            CustomTextformfield(
                              controller: emailcontroller,
                              hintText: "Email",
                              prefixicon: SvgPicture.asset("assets/svg/email_prefix.svg"),
                              validator: Validators.email,
                            ),
                            SizedBox(height: 10),
                            CustomTextformfield(
                              controller: passwordcontroller,
                              hintText: "Password",
                              suffixicon: SvgPicture.asset(
                                "assets/svg/password_suffix.svg",
                              ),
                              prefixicon: SvgPicture.asset(
                                "assets/svg/password_prefix.svg",
                              ),
                              validator: Validators.password,
                            ),
                            SizedBox(height: 45),
                            CustomButtonWidget(
                              color: AppColors.primary,
                              text: state is AuthLoading ? "Signing in..." : "Sign in",
                              textStyle: AppFonts.buttontxt,
                        
                              onPressed: state is AuthLoading
                                  ? null
                                  : () async{
                                    if(_formkey.currentState!.validate()){
                                       context.read<AuthBloc>().add(
                                        LoginRequested(
                                          emailcontroller.text.trim(),
                                          passwordcontroller.text.trim(),
                                        ),
                                      );
                                    }
                                     
                                    },
                            ),
                            SizedBox(height: 15),
                            CustomButtonWidget(
                              color: AppColors.foreground,
                              text: "Forgot password?",
                              textStyle: AppFonts.buttontxt2,
                              onPressed: () {},
                            ),
                            SizedBox(height: 15),
                            CustomButtonWidget(
                              color: AppColors.background,
                              text: "Create Account",
                              textStyle: AppFonts.buttontxt2,
                              isBorder: true,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
            ),
          );
        },
      ),
    );
  }
}
