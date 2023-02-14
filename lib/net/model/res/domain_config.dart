import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class DomainConfig {
  final String domain;
  final String createdAt;
  final String createdBy;
  final String domainDesc;
  final int domainStatus;
  final int id;
  final String updatedAt;
  final String updatedBy;

  DomainConfig(this.createdAt, this.createdBy, this.domainDesc,
      this.domainStatus, this.id, this.updatedAt, this.updatedBy, this.domain);
}
