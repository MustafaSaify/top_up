import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:top_up/src/features/mobile_reacharge/beneficiaries/domain/entity/beneficiary.dart';
import 'package:top_up/src/network/network_constants.dart';

part 'beneficiaries_service.g.dart';

@RestApi(baseUrl: NetworkConstants.baseUrl)
abstract class BeneficiariesService {
  factory BeneficiariesService(Dio dio, {String baseUrl}) = _BeneficiariesService;

  @GET('/beneficiaries')
  Future<List<Beneficiary>> getBeneficiaries();
}
