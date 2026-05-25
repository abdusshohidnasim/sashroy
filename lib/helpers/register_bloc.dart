
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sashroy/features/auth/presentation/forgot_password_email/bloc/forgot_password_bloc.dart';
import 'package:sashroy/features/auth/presentation/sign_up_email/bloc/sign_up_email_bloc.dart';
import 'package:sashroy/features/card/presentation/bloc/card_bloc.dart';
import '../features/auth/presentation/forgot_password_set/bloc/forgot_set_password_bloc.dart';
import '../features/auth/presentation/login/bloc/login_bloc.dart';
import '../features/auth/presentation/sign_up_verify_email/bloc/sign_up_verification_bloc.dart';
import '../features/auth/presentation/signup/bloc/signup_bloc.dart';

List<BlocProvider> appBlocProviders = [
  BlocProvider<LoginBloc>(
    create: (_) => LoginBloc(),
  ),

  BlocProvider<SignupBloc>(
    create: (_) => SignupBloc(),
  ),
  BlocProvider<ForgotPasswordBloc>(
    create: (_) => ForgotPasswordBloc(),
  ),

  BlocProvider<ForgotSetPasswordBloc>(
    create: (_) => ForgotSetPasswordBloc(),
  ),

  BlocProvider<SignUpEmailBloc>(
    create: (_) => SignUpEmailBloc(),
  ),

  BlocProvider<SignUpVerificationBloc>(
    create: (_) => SignUpVerificationBloc(),
  ),

  BlocProvider<CartBloc>(
    create: (_) => CartBloc(),
  ),
  
  // 
  // BlocProvider<ProductBloc>(
  //   create: (_) => ProductBloc(),
  // ),
  // নতুন bloc এখানে add করবেন
];






// import 'package:provider/provider.dart';
// import '../provider/internet_connection_provider.dart';

// var providers = [
//   // ChangeNotifierProvider<EmailProvider>(create: ((context) => EmailProvider())),

//   // ChangeNotifierProvider(create: (_) => InternetConnectionProvider()),

//   // ChangeNotifierProvider<SubscriptionProvider>(
//   //     create: ((context) => SubscriptionProvider())),

//   ChangeNotifierProvider<InternetConnectionProvider>(
//       create: ((context) => InternetConnectionProvider())),

//   // ChangeNotifierProvider<DateTimeProvider>(
//   //   create: ((context) => DateTimeProvider()),
//   // ),
// ];
