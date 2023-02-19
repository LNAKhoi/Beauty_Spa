class Voucher {
  final int id;
  final String voucherName;
  final String voucherCode;
  final String expiredDate;

  Voucher(
      {required this.id,
      required this.voucherName,
      required this.voucherCode,
      required this.expiredDate});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'voucher_name': voucherName,
      'voucher_code': voucherCode,
      'expired_date': expiredDate
    };
  }

  static Voucher fromJson(Map<String, dynamic> json) {
    return Voucher(
        id: json['id'],
        voucherName: json['voucher_name'],
        voucherCode: json['voucher_code'],
        expiredDate: json['expired_date']);
  }
}
