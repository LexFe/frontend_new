import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/screen/admin/bloc/admin_bloc.dart';
import 'package:frontend/screen/admin_detail/bloc/admin_detail_bloc.dart';
import 'package:frontend/screen/home/bloc/home_bloc.dart';
import 'package:frontend/screen/login/bloc/login_bloc.dart';
import 'package:frontend/screen/main_manage/bloc/main_manage_bloc.dart';
import 'package:frontend/screen/predict/bloc/predict_bloc.dart';
import 'package:frontend/screen/predicts_detail/bloc/predict_detail_bloc.dart';
import 'package:frontend/screen/predists/bloc/predicts_bloc.dart';
import 'package:frontend/screen/recomment/bloc/recomment_bloc.dart';
import 'package:frontend/screen/user/bloc/user_bloc.dart';
import 'package:frontend/screen/user_detail/bloc/user_detail_bloc.dart';

class AppBlocProvider {
  static get allBlocProvider => [
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => PredictBloc(),
        ),
        BlocProvider(
          create: (context) => PredictsBloc(),
        ),
        BlocProvider(
          create: (context) => MainManageBloc(),
        ),
        BlocProvider(
          create: (context) => AdminBloc(),
        ),
        BlocProvider(
          create: (context) => RecommentBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => AdminDetailBloc(),
        ),
        BlocProvider(
          create: (context) => UserBloc(),
        ),
        BlocProvider(
          create: (context) => UserDetailBloc(),
        ),
        BlocProvider(
          create: (context) => PredictDetailBloc(),
        ),
      ];
}
