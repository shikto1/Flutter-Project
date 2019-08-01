import 'package:blockpatter/base/BasePresenter.dart';
import 'package:blockpatter/base/BaseView.dart';
import 'package:blockpatter/data/network/DioUtils.dart';
import 'package:blockpatter/models/LoginResponse.dart';
import 'package:blockpatter/data/network/APIs.dart';
import 'package:blockpatter/base/BaseApiResponse.dart';

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
    BaseApiResponse response = await DioUtils.reqeust(APIs.LOGIN, method: RequestMethod.GET);
    mView.onNetworkCallEnded();
    switch(response.status){
      case Status.SUCCESS:
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        print(loginResponse.name);
        mView.loginDidSucceed();
        break;

      case Status.FORM_DATA_ERROR:
        break;

      case Status.DIO_ERROR:
        super.handleError(response.error);
        break;
    }
  }
}
