class Reservation {
  final int id;
  final String customerId;
  final String serviceId;
  final String reservationDateTime;
  final String roomId;

  Reservation(
      {required this.id,
      required this.customerId,
      required this.serviceId,
      required this.reservationDateTime,
      required this.roomId});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customer_id': customerId,
      'service_id': serviceId,
      'date': reservationDateTime,
      'room_id': roomId
    };
  }

  static Reservation fromJson(Map<String, dynamic> json) {
    return Reservation(
        id: json['id'],
        customerId: json['customer_id'],
        serviceId: json['service_id'],
        reservationDateTime: json['date'],
        roomId: json['room_id']);
  }
}
