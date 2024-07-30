import '../../../../core/constants/api_url.dart';
import '../../../../core/networks/web_service.dart';

abstract class FetchFollowersDataSource {
  Future<dynamic> fetchFollowers(String username, {int pages=0});
}

class FetchFollowersDataSourceImpl implements FetchFollowersDataSource{
  FetchFollowersDataSourceImpl(this.webService);
  final  WebService webService;
  @override
  Future<dynamic>  fetchFollowers(String username,{int pages = 0}) async{
    return await  webService.getRequest(path: '$baseUrl$username/followers',queryParameters: {'per_page':pages} );

  }

}