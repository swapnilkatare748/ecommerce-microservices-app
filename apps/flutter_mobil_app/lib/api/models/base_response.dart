class BaseResponse {
  String? message;
  int? response;
  String? innerException;
  dynamic data; // Can be int, string, object, or array
  String? technicalMessage;
  String? extraInformation;
  String? errors;

  BaseResponse({
    this.message,
    this.response,
    this.data,
    this.innerException,
    this.technicalMessage,
    this.extraInformation,
    this.errors,
  });

  BaseResponse.fromBaseJson(Map<String, dynamic> json) {
    final dynamic rawData = json['data'];

    // Handle different possible data types
    if (rawData is Map<String, dynamic>) {
      data = rawData;
    } else if (rawData is List) {
      data = List<dynamic>.from(rawData);
    } else if (rawData is int || rawData is String || rawData == null) {
      data = rawData; // Keep as is
    }

    message = json['message'];
    response = json['response'];
    innerException = json['innerException'];
    technicalMessage = json['technicalMessage'];
    extraInformation = json['extraInformation'];
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() => {
    'data': data,
    'message': message,
    'response': response,
    'innerException': innerException,
    'technicalMessage': technicalMessage,
    'extraInformation': extraInformation,
    'errors': errors,
  };

  // Helper method to get data safely
  T? getDataAs<T>() {
    if (data is T) {
      return data as T;
    }
    return null;
  }
}
