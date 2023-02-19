class Service {
  final String id;
  final String serviceName;

  Service({
    required this.id,
    required this.serviceName,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'service_name': serviceName,
    };
  }

  static Service fromJson(Map<String, dynamic> json) {
    return Service(id: json['id'], serviceName: json['service_name']);
  }
}
