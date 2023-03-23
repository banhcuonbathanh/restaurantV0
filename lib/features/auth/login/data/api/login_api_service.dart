import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restauranttdd0/features/auth/login/data/dto/response/login_response.dart';
// import 'package:ecom_app/core/remote/network_service.dart';
// import 'package:ecom_app/features/auth/login/data/dto/response/login_response.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/remote/network_service.dart';

// part 'login_api_service.g.dart';
part 'login_api_service.g.dart';

final loginApiServiceProvider = Provider.autoDispose<LoginApiService>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return LoginApiService(dio);
});

// @RestApi()
// abstract class LoginApiService {
//   factory LoginApiService(Dio dio) => _LoginApiService(dio);

//   @POST('api/v1/login')
//   Future<LoginResponse> login(@Body() Map<String,dynamic> request);
// }

// messsssss
// baseUrl: 'https://gorest.co.in/public/v2/'
@RestApi()
abstract class LoginApiService {
  factory LoginApiService(Dio dio) => _LoginApiService(dio);
  // @GET('users')
  // Future<dynamic> getUsers();
  // @GET('users/{id}')
  // Future<dynamic> getUserWithId(@Path("id") int id);
  // @GET('comments')
  // Future<dynamic> getComments(@Query('post_id') int postId);
  @POST('api/v1/login')
  Future<LoginResponse> login(@Body() Map<String, dynamic> request);
  // @POST('users')
  // Future<LoginResponse> login(@Body() Map<String, dynamic> request);
  // @POST("users")
  // // @http.Headers(<String, dynamic>{
  // //   HttpHeaders.authorizationHeader: key,
  // // })
  // Future<LoginResponseTest> createUser(@Body() LoginResponseTest request);
}





// const key =
//     'Bearer ff4fd8240cf758b51b2971c3d96736bba5f3b5838be52828a778f60295b4d935';

// // *** CLIENT *** //
// @RestApi(baseUrl: "https://gorest.co.in/public/v1/")
// abstract class APIClient {
//   factory APIClient(Dio dio, {String baseUrl}) = _APIClient;

//   // ===== GET ===== //
//   @GET('users')
//   Future<GetUsersResponse> getUsers();

//   // Get using @Path
//   @GET('users/{id}')
//   Future<GetUserResponse> getUserWithId(@Path("id") int id);

//   //Get using @query
//   @GET('comments')
//   Future<GetCommentsResponse> getPostComments(@Query("post_id") int postId);

//   @GET('comments')
//   Future<GetCommentsResponse> getPostCommentsWithQueryMap(
//     @Queries() Map<String, dynamic> queries,
//   );

//   // ===== POST ===== //
//   //   const key =
//   //    'Bearer ff4fd8240cf758b51b2971c3d96556bba5f3b5838be52828a778f60246b4d935';
//   @POST("users")
//   @http.Headers(<String, dynamic>{
//     HttpHeaders.authorizationHeader: key,
//   })
//   Future<GetUserResponse> createUser(@Body() User user);

//   // ===== PUT / PATCH ===== //
//   @PUT("users/{id}")
//   @http.Headers(<String, dynamic>{
//     HttpHeaders.authorizationHeader: key,
//   })
//   Future<GetUserResponse> updateUser(@Path() String id, @Body() User user);

//   // ===== DELETE ===== //
//   @DELETE('users/{id}')
//   @http.Headers(<String, dynamic>{
//     HttpHeaders.authorizationHeader: key,
//   })
//   Future<void> deleteUser(@Path("id") int id);
// }
