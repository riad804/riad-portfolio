// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:portfolio_client/data/respositories/coffee_respository_impl.dart'
    as _i130;
import 'package:portfolio_client/data/web3/coffee_api.dart' as _i975;
import 'package:portfolio_client/domain/repositories/coffee_repository.dart'
    as _i276;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i975.CoffeeApi>(() => _i975.CoffeeApi());
    gh.singleton<_i276.CoffeeRepository>(
        () => _i130.CoffeeRespositoryImpl(gh<_i975.CoffeeApi>()));
    return this;
  }
}
