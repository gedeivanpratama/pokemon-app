// Mocks generated by Mockito 5.4.0 from annotations
// in flutter_technical_test/test/mockfiles/mock_generates.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;

import 'package:dartz/dartz.dart' as _i3;
import 'package:flutter_technical_test/core/utility/errors.dart' as _i10;
import 'package:flutter_technical_test/core/utility/metwork_info.dart' as _i11;
import 'package:flutter_technical_test/features/home/data/datasources/pokemon_datasorce.dart'
    as _i6;
import 'package:flutter_technical_test/features/home/data/datasources/pokemon_local_datasource.dart'
    as _i8;
import 'package:flutter_technical_test/features/home/data/models/pokemons_model.dart'
    as _i2;
import 'package:flutter_technical_test/features/home/domain/entities/habitats.dart'
    as _i14;
import 'package:flutter_technical_test/features/home/domain/entities/pokemons.dart'
    as _i9;
import 'package:flutter_technical_test/features/home/domain/repositories/habitat_repository.dart'
    as _i5;
import 'package:flutter_technical_test/features/home/domain/repositories/pokemon_repository.dart'
    as _i4;
import 'package:flutter_technical_test/features/home/domain/usecases/get_habitats.dart'
    as _i13;
import 'package:flutter_technical_test/features/home/domain/usecases/get_pokemons.dart'
    as _i12;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakePokemonsModel_0 extends _i1.SmartFake implements _i2.PokemonsModel {
  _FakePokemonsModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePokemonRepository_2 extends _i1.SmartFake
    implements _i4.PokemonRepository {
  _FakePokemonRepository_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeHabitatRepository_3 extends _i1.SmartFake
    implements _i5.HabitatRepository {
  _FakeHabitatRepository_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PokemonDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockPokemonDataSource extends _i1.Mock implements _i6.PokemonDataSource {
  MockPokemonDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i2.PokemonsModel> getPokemons() => (super.noSuchMethod(
        Invocation.method(
          #getPokemons,
          [],
        ),
        returnValue: _i7.Future<_i2.PokemonsModel>.value(_FakePokemonsModel_0(
          this,
          Invocation.method(
            #getPokemons,
            [],
          ),
        )),
      ) as _i7.Future<_i2.PokemonsModel>);
}

/// A class which mocks [PokemonLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockPokemonLocalDataSource extends _i1.Mock
    implements _i8.PokemonLocalDataSource {
  MockPokemonLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i2.PokemonsModel> getPokemons() => (super.noSuchMethod(
        Invocation.method(
          #getPokemons,
          [],
        ),
        returnValue: _i7.Future<_i2.PokemonsModel>.value(_FakePokemonsModel_0(
          this,
          Invocation.method(
            #getPokemons,
            [],
          ),
        )),
      ) as _i7.Future<_i2.PokemonsModel>);
  @override
  _i7.Future<bool> setPokemons(List<_i9.Pokemon>? habitats) =>
      (super.noSuchMethod(
        Invocation.method(
          #setPokemons,
          [habitats],
        ),
        returnValue: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);
}

/// A class which mocks [PokemonRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockPokemonRepository extends _i1.Mock implements _i4.PokemonRepository {
  MockPokemonRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i3.Either<_i10.Failure, _i9.Pokemons>> getPokemons() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPokemons,
          [],
        ),
        returnValue: _i7.Future<_i3.Either<_i10.Failure, _i9.Pokemons>>.value(
            _FakeEither_1<_i10.Failure, _i9.Pokemons>(
          this,
          Invocation.method(
            #getPokemons,
            [],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i10.Failure, _i9.Pokemons>>);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i11.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);
}

/// A class which mocks [GetPokemons].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetPokemons extends _i1.Mock implements _i12.GetPokemons {
  MockGetPokemons() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.PokemonRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakePokemonRepository_2(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i4.PokemonRepository);
  @override
  _i7.Future<_i3.Either<_i10.Failure, _i9.Pokemons>> call() =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i7.Future<_i3.Either<_i10.Failure, _i9.Pokemons>>.value(
            _FakeEither_1<_i10.Failure, _i9.Pokemons>(
          this,
          Invocation.method(
            #call,
            [],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i10.Failure, _i9.Pokemons>>);
}

/// A class which mocks [GetHabitats].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetHabitats extends _i1.Mock implements _i13.GetHabitats {
  MockGetHabitats() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.HabitatRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeHabitatRepository_3(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i5.HabitatRepository);
  @override
  _i7.Future<_i3.Either<_i10.Failure, _i14.Habitats>> call() =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i7.Future<_i3.Either<_i10.Failure, _i14.Habitats>>.value(
            _FakeEither_1<_i10.Failure, _i14.Habitats>(
          this,
          Invocation.method(
            #call,
            [],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i10.Failure, _i14.Habitats>>);
}
