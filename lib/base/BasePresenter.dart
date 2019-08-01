
import 'package:blockpatter/base/BaseView.dart';

abstract class BasePresenter<V extends BaseView>{

  V mView;

  BasePresenter(V mView){
    this.mView = mView;
  }

}