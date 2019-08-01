import 'package:blockpatter/base/BasePresenter.dart';
import 'package:blockpatter/base/BaseView.dart';
import 'package:blockpatter/data/network/ApiResponse.dart';
import 'package:blockpatter/data/network/DioHandler.dart';
import 'package:blockpatter/models/LoginResponse.dart';
import 'package:blockpatter/data/network/APIs.dart';

class LoginView extends BaseView {
  void loginBtnDidTapped(){}
  void loginDidSucceed() {}
  void loginDidFailed(String failedMsg) {}
}

class LoginPresenter {
  void doLogin(String userName, String password) {}
}

class LoginPresenterImpl extends BasePresenter<LoginView> implements LoginPresenter {

  LoginPresenterImpl(LoginView view): super(view);

  @override
  void doLogin(String userName, String password) async{
    mView.onNetworkCallStarted("Logging in...");
    BaseApiResponse response = await DioHandler.reqeust(APIs.LOGIN, method: RequestMethod.GET);
    switch(response.status){
      case ResponseStatus.ON_SUCCESS:
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        print(loginResponse.name);
        mView.loginDidSucceed();
        break;
      case ResponseStatus.ON_FORM_DATA_INVALID:
        Map<String, String> errors = response.errorMap;
        mView.loginDidFailed("Falied");
        break;
    }
  }
}
