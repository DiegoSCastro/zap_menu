// import 'package:dio/browser.dart';
// import 'package:dio/dio.dart';

// import '../../app.dart';

// class CustomDio extends DioForBrowser {
//   final _authInterceptor = const Interceptor();

//   CustomDio()
//     : super(
//         BaseOptions(
//           baseUrl: AppEnv.baseUrl,
//           connectTimeout: const Duration(milliseconds: AppEnv.connectTimeout),
//           receiveTimeout: const Duration(milliseconds: AppEnv.receiveTimeout),
//         ),
//       ) {
//     interceptors.add(
//       LogInterceptor(
//         requestBody: true,
//         responseBody: true,
//         requestHeader: true,
//       ),
//     );
//   }

//   CustomDio auth() {
//     interceptors.add(_authInterceptor);
//     return this;
//   }

//   CustomDio unAuth() {
//     interceptors.remove(_authInterceptor);
//     return this;
//   }
// }
