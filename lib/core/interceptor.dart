// import 'package:dio/dio.dart';
// import 'package:recipe_app/core/data/repository/auth_repository.dart';
// import 'package:recipe_app/core/secure_storage.dart';
//
// class AuthInterceptor extends Interceptor{
//   final Dio _dio = Dio();
//
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
//     final jwt = await SecureStorage.getToken();
//     if (jwt != null){
//       options.headers['Authorization'] = "Bearer $jwt";
//     }
//     handler.next(options);
//   }
//
//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) async{
//     if(err.response?.statusCode == 401 ){
//       final result = await navigatorKey.currentContex!.read<AuthRepository>().refreshToken();
//       if (result) {
//         final jwt = await SecureStorage.getToken();
//         err.requestOptions.headers['Authorization'] = "Bearer $jwt";
//         return handler.resolve(
//           await _dio.request(
//             err.requestOptions.baseUrl + err.requestOptions.path,
//             options: Options(
//               method: err.requestOptions.method,
//               headers: err.requestOptions.headers,
//             ),
//             data: err.requestOptions.data,
//             queryParameters: err.requestOptions.queryParameters,
//           ),
//         );
//       }else{
//         await navigatorKey.currentContext!.read<AuthRepository>().logout();
//         navigatorKey.currentContext!.go('/login');
//         return handler.reject(err);
//       }
//     }
//   }
// }