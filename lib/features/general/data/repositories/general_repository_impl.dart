import 'package:chartification/core/core.dart';
import 'package:chartification/features/general/general.dart';
import 'package:dartz/dartz.dart';

class GeneralRepositoryImpl implements GeneralRepository {
  /// Data Source
  final GeneralRemoteDatasource generalRemoteDatasource;

  GeneralRepositoryImpl(this.generalRemoteDatasource);

  final Map<String, Quotation> _quotationSessionCache = {};

  @override
  Future<Either<Failure, Quotation>> quotation(
    QuotationParams quotationParams,
  ) async {
    final sessionCache = _quotationSessionCache[quotationParams.symbol];
    if (sessionCache != null) {
      return Right(sessionCache);
    }
    final response = await generalRemoteDatasource.quotation(quotationParams);

    return response.fold(
      (failure) => Left(failure),
      (loginResponse) {
        _quotationSessionCache[quotationParams.symbol] =
            loginResponse.toEntity();
        return Right(_quotationSessionCache[quotationParams.symbol]!);
      },
    );
  }
}
