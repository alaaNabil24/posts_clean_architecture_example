// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:posts/data/remote/data_sources/post_api_service.dart' as _i5;
import 'package:posts/data/repositories/posts_repo_impl.dart' as _i7;
import 'package:posts/domain/repositories/posts_repositories.dart' as _i6;
import 'package:posts/domain/use_cases/posts_uses_case.dart' as _i8;
import 'package:posts/presentation/pages/posts/cubit/posts_cubit.dart' as _i9;
import 'package:posts/shared/di/app_module.dart' as _i10;
import 'package:posts/shared/helper/navgtion_app.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    await gh.factoryAsync<_i3.Dio>(
      () => appModule.dio,
      preResolve: true,
    );
    gh.lazySingleton<_i4.NavigationApp>(() => _i4.NavigationApp());
    gh.factory<_i5.PostsApiService>(() => appModule.getService(gh<_i3.Dio>()));
    gh.factory<_i6.PostsRepository>(
        () => _i7.PostsRepositoryImpl(gh<_i5.PostsApiService>()));
    gh.factory<_i8.PostsUsesCase>(
        () => _i8.PostsUsesCase(gh<_i6.PostsRepository>()));
    gh.factory<_i9.PostsCubit>(() => _i9.PostsCubit(gh<_i8.PostsUsesCase>()));
    return this;
  }
}

class _$AppModule extends _i10.AppModule {}
