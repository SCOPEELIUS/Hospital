class ApiResponse {
  final bool success;
  final dynamic body;
  final bool error;

  ApiResponse({
    required this.success,
    required this.body,
    required this.error,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      success: json['success'],
      body: json['body'],
      error: json['error'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'body': body,
      'error': error,
    };
  }
}
