// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "fingerprint_setting": MessageLookupByLibrary.simpleMessage(
            "Fingerprint is not set up on your device.\nGo to Settings > Security to add your fingerprint."),
        "fingerprint_verification": MessageLookupByLibrary.simpleMessage(
            "Please you need to login with username for the first time"),
        "go_to_setting": MessageLookupByLibrary.simpleMessage("Go to Settings"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "no_internet_connection": MessageLookupByLibrary.simpleMessage(
            "Check your internet connection"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "password_hint":
            MessageLookupByLibrary.simpleMessage("Enter Your Password"),
        "place_your_finge": MessageLookupByLibrary.simpleMessage(
            "Place your finger on the device sensor to verify your identity"),
        "something_went_wrong_please_try_again":
            MessageLookupByLibrary.simpleMessage(
                "Something went wrong, please try again later"),
        "use_account_password":
            MessageLookupByLibrary.simpleMessage("Use Account password"),
        "username": MessageLookupByLibrary.simpleMessage("User Name"),
        "username_hint":
            MessageLookupByLibrary.simpleMessage("Enter Your User Name"),
        "using_biometrics_credentials": MessageLookupByLibrary.simpleMessage(
            "Press here to log in using your biometric credentials")
      };
}
