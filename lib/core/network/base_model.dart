class BaseModel<T> {
  final bool success;
  final String code;
  final String lang;
  final Map<String, dynamic> message;
  final T? data;

  BaseModel({
    required this.success,
    required this.code,
    required this.lang,
    required this.message,
    this.data,
  });

  factory BaseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return BaseModel<T>(
      success: json['success'] as bool,
      code: json['code'] as String,
      lang: json['lang'] as String,
      message: Map<String, dynamic>.from(json['message'] as Map),
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }
}
