import 'package:chartification/core/core.dart';
import 'package:chartification/features/general/general.dart';
import 'package:dartz/dartz.dart';

abstract class GeneralRepository {
  Future<Either<Failure, Quotation>> quotation(QuotationParams quotationParams);
}
