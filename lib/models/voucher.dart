class Voucher {
  final int id;
  final String voucherName;
  final String expiredDate;

  Voucher(
      {required this.id, required this.voucherName, required this.expiredDate});

  Map<String, dynamic> toJson() {
    return {'id': id, 'voucher_name': voucherName, 'expired_date': expiredDate};
  }

  static Voucher fromJson(Map<String, dynamic> json) {
    return Voucher(
        id: json['id'],
        voucherName: json['voucher_name'],
        expiredDate: json['expired_date']);
  }
}
