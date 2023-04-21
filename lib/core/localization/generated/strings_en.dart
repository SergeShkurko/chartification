import 'strings.dart';

/// The translations for English (`en`).
class StringsEn extends Strings {
  StringsEn([String locale = 'en']) : super(locale);

  @override
  String get failed => 'Error!';

  @override
  String get succeed => 'Well done!';

  @override
  String get cannotFetch => 'Cannot fetch data :c\nRetry after 1 minute or generate new api token';

  @override
  String cannotFetchQuotation(Object quotation) {
    return 'Cannot fech quotation: $quotation';
  }

  @override
  String get refreshNow => 'refresh now';

  @override
  String get name => 'Name';

  @override
  String get description => 'Description';

  @override
  String get symbol => 'Symbol';

  @override
  String get capitalization => 'Capitalization';

  @override
  String get loremIpsum => 'Lorem ipsum dolor sit amet, consectetur';
}
