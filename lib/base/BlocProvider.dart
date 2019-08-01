import 'package:blockpatter/base/BaseBloc.dart';
import 'package:flutter/material.dart';

class BlocProvider<T extends BaseBloc> extends StatefulWidget {

  final Widget child;
  final T bloc;

  BlocProvider({Key key, @required this.bloc, @required this.child}) : super(key: key);

  @override
  _BlockProviderState<T> createState() => _BlockProviderState<T>();

  static T of<T extends BaseBloc>(BuildContext context) {
    final type = _typeOf<BlocProvider<T>>();
    BlocProvider<T> provider = context.ancestorWidgetOfExactType(type);
    return provider.bloc;
  }

  static Type _typeOf<T>() => T;
}

class _BlockProviderState<T extends BaseBloc> extends State<BlocProvider<T>> {
  @override
  Widget build(BuildContext context) {
    return Container(child: widget.child);
  }

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

}
