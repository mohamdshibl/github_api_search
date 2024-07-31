import '../../../../core/constants/api_url.dart';
import '../../../../core/networks/web_service.dart';

abstract class FetchUserInfoDataSource {
  Future<dynamic> fetchUserInfo(String username);
}

class FetchUserInfoDataSourceImpl implements FetchUserInfoDataSource{
  FetchUserInfoDataSourceImpl(this.webService);
  final  WebService webService;
  @override
  Future<dynamic>  fetchUserInfo(String username) async{
    return await  webService.getRequest(path: '$baseUrl$username' );

  }

}