import 'package:chartification/core/core.dart';
import 'package:chartification/features/features.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_quotation.freezed.dart';

class GetQuotation extends UseCase<Quotation, QuotationParams> {
  final GeneralRepository _repo;

  GetQuotation(this._repo);

  @override
  Future<Either<Failure, Quotation>> call(QuotationParams params) =>
      _repo.quotation(params);
}

@freezed
class QuotationParams with _$QuotationParams {
  const factory QuotationParams({
    @Default("") String symbol,
  }) = _QuotationParams;
}
