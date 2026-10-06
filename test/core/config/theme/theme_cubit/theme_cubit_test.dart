import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spotify/core/config/theme/theme_cubit/theme_cubit.dart';

class MockStorage extends Mock implements Storage {}

void main() {
  late Storage storage;

  setUp(() {
    storage = MockStorage();
    when(() => storage.read(any())).thenReturn(null);
    when(() => storage.write(any(), any<dynamic>())).thenAnswer((_) async {});
    when(() => storage.delete(any())).thenAnswer((_) async {});
    HydratedBloc.storage = storage;
  });

  group('ThemeCubit', () {
    test('initial state is ThemeMode.dark', () {
      expect(ThemeCubit().state, ThemeMode.dark);
    });

    test('emits light when updateTheme(light) is called', () {
      final cubit = ThemeCubit();

      expectLater(cubit.stream, emits(ThemeMode.light));
      cubit.updateTheme(ThemeMode.light);
    });

    test('toJson / fromJson round trip works for every mode', () {
      final cubit = ThemeCubit();
      for (final mode in ThemeMode.values) {
        final json = cubit.toJson(mode);
        expect(cubit.fromJson(json!), mode);
      }
    });

    test('restores saved theme from storage', () {
      when(() => storage.read('ThemeCubit'))
          .thenReturn({'theme': ThemeMode.light.index});

      expect(ThemeCubit().state, ThemeMode.light);
    });
  });
}