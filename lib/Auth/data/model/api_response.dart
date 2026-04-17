// class ApiResponse<T> {
//   final bool success;
//   final String message;
//   final T? data;
//
//   ApiResponse({
//     required this.success,
//     required this.message,
//     this.data,
//   });
//
//   factory ApiResponse.fromMap(
//       Map<String, dynamic> map, {
//         T Function(dynamic json)? parser,
//       }) {
//     return ApiResponse<T>(
//       success: (map["success"] ?? true) == true,
//       message: map["message"]?.toString() ?? "",
//       data: parser != null ? parser(map["data"]) : null,
//     );
//   }
// }
