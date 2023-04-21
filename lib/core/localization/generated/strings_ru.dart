import 'strings.dart';

/// The translations for Russian (`ru`).
class StringsRu extends Strings {
  StringsRu([String locale = 'ru']) : super(locale);

  @override
  String get failed => 'Ошибка!';

  @override
  String get succeed => 'Успех!';

  @override
  String get cannotFetch => 'Не удалось загрузить :c\nПопробуйте через минуту или сгенерируйте новый api токен';

  @override
  String cannotFetchQuotation(Object quotation) {
    return 'Не удается загрузить котировку: $quotation';
  }

  @override
  String get refreshNow => 'Перезагрузить';

  @override
  String get name => 'Название';

  @override
  String get description => 'Описание';

  @override
  String get symbol => 'Котировка';

  @override
  String get capitalization => 'Капитализация';

  @override
  String get loremIpsum => 'Чтобы добиться успеха в жизни нужно только... :)';
}
