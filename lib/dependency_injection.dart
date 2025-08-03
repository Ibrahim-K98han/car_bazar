import 'package:car_bazar/data/data_provider/remote_data_source.dart';
import 'package:car_bazar/logic/bloc/internet_status/internet_status_bloc.dart';
import 'package:car_bazar/logic/bloc/login/login_bloc.dart';
import 'package:car_bazar/logic/cubit/website_setup/website_setup_cubit.dart';
import 'package:car_bazar/logic/repository/auth_repository.dart';
import 'package:car_bazar/logic/repository/website_setup_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/data_provider/local_data_source.dart';
import 'logic/cubit/car_details/car_details_cubit.dart';
import 'logic/cubit/home/home_cubit.dart';
import 'logic/repository/home_repository.dart';

class DInjector {
  static late final SharedPreferences _sharedPreferences;

  static Future<void> initDB() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static final repositoryProvider = <RepositoryProvider>[
    RepositoryProvider<Client>(create: (context) => Client()),
    RepositoryProvider<SharedPreferences>(
      create: (context) => _sharedPreferences,
    ),
    RepositoryProvider<RemoteDataSource>(
      create: (context) => RemoteDataSourceImpl(client: context.read()),
    ),

    RepositoryProvider<LocalDataSources>(
      create:
          (context) => LocalDataSourcesImpl(sharedPreferences: context.read()),
    ),

    RepositoryProvider<AuthRepository>(
      create:
          (context) => AuthRepositoryImpl(
            remoteDataSources: context.read(),
            localDataSources: context.read(),
          ),
    ),
    RepositoryProvider<WebsiteSetupRepository>(
      create:
          (context) => WebsiteSetupRepositoryImpl(
            remoteDataSource: context.read(),
            localDataSources: context.read(),
          ),
    ),
    RepositoryProvider<HomeRepository>(
      create: (context) => HomeRepositoryImpl(remoteDataSource: context.read()),
    ),
  ];
  static final blocProviders = <BlocProvider>[
    BlocProvider<InternetStatusBloc>(create: (context) => InternetStatusBloc()),
    BlocProvider<WebsiteSetupCubit>(
      create: (context) => WebsiteSetupCubit(repository: context.read()),
    ),
    BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(repository: context.read()),
    ),
    BlocProvider<HomeCubit>(
      create:
          (context) => HomeCubit(
            loginBloc: context.read(),
            homeRepository: context.read(),
          ),
    ),

    BlocProvider<CarDetailsCubit>(
      create:
          (context) => CarDetailsCubit(
            homeRepository: context.read(),
            loginBloc: context.read(),
          ),
    ),
  ];
}
