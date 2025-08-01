import 'package:car_bazar/data/data_provider/remote_data_source.dart';
import 'package:car_bazar/data/model/auth/login_state_model.dart';
import 'package:car_bazar/logic/bloc/login/login_bloc.dart';
import 'package:car_bazar/logic/bloc/login/login_event.dart';
import 'package:car_bazar/logic/bloc/login/login_state.dart';
import 'package:car_bazar/routes/route_names.dart';
import 'package:car_bazar/utils/constraints.dart';
import 'package:car_bazar/utils/utils.dart';
import 'package:car_bazar/widgets/custom_form.dart';
import 'package:car_bazar/widgets/custom_text.dart';
import 'package:car_bazar/widgets/fetch_error_text.dart';
import 'package:car_bazar/widgets/loading_widget.dart';
import 'package:car_bazar/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc loginBloc;

  @override
  void initState() {
    loginBloc = context.read<LoginBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFEEF2F6),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Utils.verticalSpace(size.height * 0.19),
            Container(
              height: size.height * 0.78,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                ),
                color: whiteColor,
              ),
              child: ListView(
                padding: Utils.symmetric(v: 20.0),
                children: [
                  const CustomText(
                    text: "Log in to your Account",
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                  Utils.verticalSpace(16.0),

                  BlocBuilder<LoginBloc, LoginStateModel>(
                    builder: (context, state) {
                      final login = state.loginState;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomForm(
                            label: 'Email',
                            child: TextFormField(
                              initialValue: state.email,
                              onChanged:
                                  (value) =>
                                      loginBloc.add(LoginEventUserEmail(value)),
                              decoration: const InputDecoration(
                                hintText: 'email here',
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          if (login is LoginStateFormValidate) ...[
                            if (login.errors.email.isNotEmpty)
                              FetchErrorText(text: login.errors.email.first),
                          ],
                        ],
                      );
                    },
                  ),

                  Utils.verticalSpace(10.0),
                  BlocBuilder<LoginBloc, LoginStateModel>(
                    builder: (context, state) {
                      final login = state.loginState;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomForm(
                            label: 'Password',
                            child: TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              initialValue: state.password,
                              onChanged:
                                  (value) =>
                                      loginBloc.add(LoginEventPassword(value)),
                              obscureText: state.show,
                              decoration: InputDecoration(
                                hintText: 'Password here',
                                suffixIcon: IconButton(
                                  onPressed:
                                      () => loginBloc.add(
                                        ShowPasswordEvent(state.show),
                                      ),
                                  icon: Icon(
                                    state.show
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    color: blackColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  Utils.verticalSpace(16.0),
                  BlocBuilder<LoginBloc, LoginStateModel>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: Utils.only(right: 8.0),
                                height: Utils.vSize(24.0),
                                width: Utils.hSize(24.0),
                                child: Checkbox(
                                  activeColor: primaryColor,
                                  value: state.isActive,
                                  onChanged: (value) {
                                    loginBloc.add(LoginEventRememberMe());
                                  },
                                ),
                              ),
                              const CustomText(
                                text: 'Remember me',
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: blackColor,
                                height: 1.6,
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap:
                                () => Navigator.pushNamed(
                                  context,
                                  RouteNames.forgotPasswordScreen,
                                ),
                            child: const CustomText(
                              text: 'Forgot Password',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF4B83FC),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  Utils.verticalSpace(30.0),
                  BlocConsumer<LoginBloc, LoginStateModel>(
                    listener: (context, login) {
                      final state = login.loginState;
                      if (state is LoginStateError) {
                        Utils.failureSnackBar(context, state.message);
                      } else if (state is LoginStateLoaded) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          RouteNames.mainScreen,
                          (route) => false,
                        );
                      }
                    },
                    builder: (context, login) {
                      final state = login.loginState;
                      if (state is LoginStateLoading) {
                        return LoadingWidget();
                      }
                      return PrimaryButton(
                        text: 'Login',
                        onPressed: () {
                          Utils.closeKeyBoard(context);
                          loginBloc.add(LoginEventSubmit());
                        },
                      );
                    },
                  ),
                  Utils.verticalSpace(18.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                        text: "Don't have an account? ",
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: blackColor,
                        height: 1.6,
                      ),
                      GestureDetector(
                        onTap:
                            () => Navigator.pushNamed(
                              context,
                              RouteNames.registrationScreen,
                            ),
                        child: const CustomText(
                          text: 'Sign up',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          fontFamily: bold700,
                          color: primaryColor,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                  Utils.verticalSpace(20.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RouteNames.mainScreen,
                        (route) => false,
                      );
                    },
                    child: const CustomText(
                      textAlign: TextAlign.center,
                      text: "Guest Login",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
