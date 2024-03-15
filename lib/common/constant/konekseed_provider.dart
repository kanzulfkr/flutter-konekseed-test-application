import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../bloc/business/business_bloc.dart';
import '../../bloc/getUser/get_user_bloc.dart';
import '../../bloc/login/login_bloc.dart';
import '../../bloc/logout/logout_bloc.dart';
import '../../bloc/product/product_bloc.dart';
import '../../bloc/storeBusiness/store_business_bloc.dart';
import '../../bloc/storeTargets/store_targets_bloc.dart';
import '../../bloc/target/target_bloc.dart';
import '../../bloc/updateTargets/update_targets_bloc.dart';
import '../../data/datasources/auth_remote_datasources.dart';
import '../../data/datasources/business_remote_datasources.dart';
import '../../data/datasources/product_remote_datasources.dart';
import '../../data/datasources/target_remote_datasources.dart';
import '../../data/datasources/user_remote_datasources.dart';
import '../../provider/business_provider.dart';
import '../../provider/target_provider.dart';
import '../../provider/user_provider.dart';

class KonekSeedProvider extends StatelessWidget {
  final Widget child;
  const KonekSeedProvider({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(AuthRemoteDataSources()),
        ),
        BlocProvider(
          create: (context) => GetUserBloc(UserRemoteDataSources()),
        ),
        BlocProvider(
          create: (context) => ProductBloc(ProductRemoteDataSources()),
        ),
        BlocProvider(
          create: (context) => BusinessBloc(BusinessRemoteDataSources()),
        ),
        BlocProvider(
          create: (context) => TargetBloc(TargetRemoteDataSources()),
        ),
        BlocProvider(
          create: (context) => StoreTargetBloc(),
        ),
        BlocProvider(
          create: (context) => StoreBusinessBloc(),
        ),
        BlocProvider(
          create: (context) => UpdateTargetsBloc(),
        ),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => BusinessProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => TargetProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => UserProvider(),
          ),
        ],
        child: child,
      ),
    );
  }
}
