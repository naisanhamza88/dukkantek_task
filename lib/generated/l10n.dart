// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `User Name`
  String get username {
    return Intl.message(
      'User Name',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your User Name`
  String get username_hint {
    return Intl.message(
      'Enter Your User Name',
      name: 'username_hint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Password`
  String get password_hint {
    return Intl.message(
      'Enter Your Password',
      name: 'password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Please you need to login with username for the first time`
  String get fingerprint_verification {
    return Intl.message(
      'Please you need to login with username for the first time',
      name: 'fingerprint_verification',
      desc: '',
      args: [],
    );
  }

  /// `Press here to log in using your biometric credentials`
  String get using_biometrics_credentials {
    return Intl.message(
      'Press here to log in using your biometric credentials',
      name: 'using_biometrics_credentials',
      desc: '',
      args: [],
    );
  }

  /// `Place your finger on the device sensor to verify your identity`
  String get place_your_finge {
    return Intl.message(
      'Place your finger on the device sensor to verify your identity',
      name: 'place_your_finge',
      desc: '',
      args: [],
    );
  }

  /// `Use Account password`
  String get use_account_password {
    return Intl.message(
      'Use Account password',
      name: 'use_account_password',
      desc: '',
      args: [],
    );
  }

  /// `Fingerprint is not set up on your device.\nGo to Settings > Security to add your fingerprint.`
  String get fingerprint_setting {
    return Intl.message(
      'Fingerprint is not set up on your device.\nGo to Settings > Security to add your fingerprint.',
      name: 'fingerprint_setting',
      desc: '',
      args: [],
    );
  }

  /// `Go to Settings`
  String get go_to_setting {
    return Intl.message(
      'Go to Settings',
      name: 'go_to_setting',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Check your internet connection`
  String get no_internet_connection {
    return Intl.message(
      'Check your internet connection',
      name: 'no_internet_connection',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
