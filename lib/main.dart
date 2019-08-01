import 'package:blockpatter/base/BlocProvider.dart';
import 'package:blockpatter/blocs/LoginBloc.dart';
import 'package:blockpatter/data/network/ApiResponse.dart';
import 'package:blockpatter/models/PostResponse.dart';
import 'package:blockpatter/data/network/APIs.dart';
import 'package:blockpatter/repositories/LoginRepository.dart';
import 'package:blockpatter/ui/login/Login_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: BlocProvider<LoginBloc>(
          bloc: LoginBloc(),
          child: LoginPage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  LoginBloc _loginBloc;
  List<Post> _posts;

  ScrollController _scrollController;
  bool _isPaginating = false;
  String _nextPageUrl;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        if (_nextPageUrl != null && !_isPaginating) {
          _loadMoreData();
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            _loginBloc.login(APIs.POST_URL);
          }),
      appBar: AppBar(
        title: Text("Bloc Patter"),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          _loginBloc.login(APIs.POST_URL);
        },
        child: StreamBuilder<ApiResponse<PostResponse>>(
            stream: _loginBloc.item,
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                switch (snapShot.data.status) {
                  case Status.ON_LOADING:
                    if(_isPaginating){
                      return _buildProgressIndicator();
                    }
                    break;
                  case Status.ON_COMPLETED:
                    if(!_isPaginating){
                      PostResponse postResponse = snapShot.data.data;
                      _nextPageUrl = postResponse.nextPageUrl;
                      _posts = postResponse.posts;
                    }
                    print("NEXT PAGE URL: $_nextPageUrl");
                   // _posts = postResponse.posts;
//                    if(_isPaginating){
//                      setState(() {
//                        _isPaginating = false;
//                        _posts.addAll(postResponse.posts);
//                      });
//                    }else{
//                      _posts = postResponse.posts;
//                    }
                    return _buildList();
                  case Status.ON_ERROR:
                    print(">>>>>>>>>>> ERROR Occurred.");
                    break;
                }
              }
              return Container();
            }),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: _isPaginating ? 1.0 : 00,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _buildList() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      controller: _scrollController,
      itemCount: _posts == null ? 0 : _posts.length + 1,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        if (index == _posts.length && _nextPageUrl != null) {
          return _buildProgressIndicator();
        } else {
          Post _user = _posts[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text("L"),
            ),
            title: Text("User id: ${_user.id}"),
            isThreeLine: true,
            subtitle: Text(
              "${_user.title}",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          );
        }
      },
    );
  }

  void _loadMoreData() async{
    setState(() {
      _isPaginating = true;
    });
    final loginRepository = LoginRepository();
  //  PostResponse response = await loginRepository.doLogin(_nextPageUrl);
  //  _nextPageUrl = response.nextPageUrl;
    print("LOAD MORE DATA: $_nextPageUrl");
    setState(() {
   //   _posts.addAll(response.posts);
      _isPaginating = false;
    });
  }
}
