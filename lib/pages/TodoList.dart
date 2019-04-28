
import 'package:flutter/material.dart';
import '../components/Todo.dart';
import './TodoDetail.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class TodoList extends StatefulWidget {

  @override
  _TodoList createState() => _TodoList();
}

class _TodoList extends State<TodoList> {
  final ScrollController _scrollController = new ScrollController();
  @override
  void initState() {
    super.initState();
    _getTabs();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels 
          >= _scrollController.position.maxScrollExtent - 100) {
        _getMoreData();
      }
    });
  }

  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  uploadFile() async {
    debugPrint(_image.path);
    Dio dio = Dio();
    dio.options.baseUrl = "http://192.168.1.15:8360";
    dio.options.connectTimeout = 5000; //5s
    dio.options.receiveTimeout = 3000;
    dio.interceptors.add(CookieManager(CookieJar()));

    FormData formData = new FormData.from({
        "name": "wendux",
        // Pass multiple files within an Array
        "file1": UploadFileInfo(_image, "img1"),
        "file2": UploadFileInfo(_image, "img2"),
        "files": [
          UploadFileInfo(_image, "img1"),
          UploadFileInfo(_image, "img2"),
        ]
    });

    Response response = await dio.post(
      "/index/test",
      data: formData,
      onSendProgress: (int sent, int total) {
        print("$sent $total");
      },
    );

    debugPrint(response.toString());
    
  }

  _getTabs() async {
    try {
      Dio dio = Dio();
      dio.options.baseUrl = "http://192.168.1.15:8360";
      dio.options.connectTimeout = 5000; //5s
      dio.options.receiveTimeout = 3000;
      dio.interceptors.add(CookieManager(CookieJar()));

      Response r = await dio.get('/index/setCookie');

      var res = await dio.get('/index/getList');
      var body = res.data;

      print(body['data'].map((item) => item * 2).toString());
    } on DioError catch(e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if(e.response != null) {
          print(e.response.data);
          print(e.response.headers);
          print(e.response.request);
      } else{
          // Something happened in setting up or sending the request that triggered an Error
          print(e.request);
          print(e.message);
      }
    }
    
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List todos = List.generate(
    10,
    (i) => i,
  );
  bool isLoadMore = false;

  _TodoList();

  _getData() {
    todos = List.generate(
      10,
      (i) => i,
    );
  }

  Future _getMoreData() async {
    if (!isLoadMore) {
      isLoadMore = true;
      var lists = List.generate(
        5,
        (i) => i,
      );
      todos.addAll(lists);
      setState(() {
        
      });
      await Future.delayed(Duration(seconds: 2), () {
        isLoadMore = false;
        setState(() {
          
        });
      });
    }
  }

  int _getListLength() {
    var len = todos.length;
    if (isLoadMore) {
      len += 1;
    }
    return len;
  }

  Widget _renderFooter() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          Container(width: 20),
          Text('加载中...'),
        ],
      ),
    );
  }

  Widget _renderListItem(context, index) {
    if (isLoadMore && index == todos.length) {
      return _renderFooter();
    }

    var _todo = Todo(
      '列表项: $index',
      '描述部分: $index',
    );

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TodoDetail(todo: _todo),
          ),
        );
      },
      child: _todo,
    );
  }

  Widget _listBody() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _getListLength(),
      itemBuilder: _renderListItem,
    );
  }

  Widget _wrapRefresh() {
    return RefreshIndicator(
      child: _listBody(),
      onRefresh: () {
        _getData();
        return Future.value(true);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('选择图片'),
            onPressed: () {
              getImage();
            },
          ),
          RaisedButton(
            child: Text('上传图片'),
            onPressed: uploadFile,
          ),
          _image == null
            ? Text('No image selected.')
            : Image.file(_image)
          // Container(
          //   padding: EdgeInsets.all(12.0),
          //   child: _wrapRefresh(),
          // )
        ],
      ),
    );
  }
}

