import 'package:blockpatter/base/BaseBloc.dart';
import 'package:blockpatter/data/network/ApiResponse.dart';
import 'package:blockpatter/models/PostResponse.dart';
import 'package:blockpatter/repositories/LoginRepository.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends BaseBloc {

  final loginRepository = LoginRepository();
  final _itemFetcher = PublishSubject<ApiResponse<PostResponse>>();

  Observable<ApiResponse<PostResponse>> get item => _itemFetcher.stream;

  void login(String url) async {
    _itemFetcher.sink.add(ApiResponse.onLoading("Please wait..."));
   // PostResponse response = await loginRepository.doLogin(url);
   // _itemFetcher.sink.add(ApiResponse.onCompleted(response));
  }

  @override
  void dispose() {
    _itemFetcher.close();
  }

}
