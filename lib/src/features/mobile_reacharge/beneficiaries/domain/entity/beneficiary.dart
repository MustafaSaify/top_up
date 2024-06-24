import 'package:json_annotation/json_annotation.dart';

part 'beneficiary.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Beneficiary {
  const Beneficiary({required this.id, required this.name, required this.phoneNumber});

  factory Beneficiary.fromJson(Map<String, dynamic> json) => _$BeneficiaryFromJson(json);

  final String id;
  final String name;
  final String phoneNumber;
}
