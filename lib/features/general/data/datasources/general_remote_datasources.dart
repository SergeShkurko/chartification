import 'package:chartification/core/core.dart';
import 'package:chartification/features/general/general.dart';
import 'package:chartification/utils/utils.dart';
import 'package:dartz/dartz.dart';

abstract class GeneralRemoteDatasource {
  Future<Either<Failure, QuotationResponse>> quotation(
      QuotationParams quotationParams);
}

class GeneralRemoteDatasourceImpl implements GeneralRemoteDatasource {
  final DioClient _client;

  GeneralRemoteDatasourceImpl(this._client);

  @override
  Future<Either<Failure, QuotationResponse>> quotation(
    QuotationParams quotationParams,
  ) async {
    final response = await _client.getRequest(
      ListAPI.query,
      queryParameters: {
        'apikey': Constants.get.token,
        'function': 'OVERVIEW',
        'symbol': quotationParams.symbol,
      },
      converter: (response) =>
          QuotationResponse.fromJson(response as Map<String, dynamic>),
    );

    return response;
  }
}
