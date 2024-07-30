import '../../../../core/constants/api_url.dart';
import '../../../../core/networks/web_service.dart';
import '../../model/followers.dart';

abstract class FetchFollowersDataSource {
  Future<dynamic> fetchFollowers();
}

class FetchFollowersDataSourceImpl implements FetchFollowersDataSource{
  FetchFollowersDataSourceImpl(this.webService);
  final  WebService webService;
  @override
  Future<dynamic>  fetchFollowers() async{
    return await  webService.getRequest(path: baseUrl);

  }

}