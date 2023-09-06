import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  WebViewController? controller;
  final String homeUrl = 'http://blog.codefactory.ai';

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Code Factory'),
        // 가운데 정렬 여부, false일 경우 왼쪽으로 정렬
        centerTitle: true,
        actions: [
          IconButton(
              // 버튼이 눌렸을 때 콜백 함수 설정
              onPressed: (){
                if(controller != null) {
                  // 웹뷰에서 보여줄 사이트 실행
                  controller!.loadUrl(homeUrl);
                }
              },
              icon: Icon(
                Icons.home,
              ))
        ],
      ),
      body: WebView(
        // 웹뷰 위젯이 생성될 때 실행될 콜백 함수
        onWebViewCreated: (WebViewController controller) {
          // 컨트롤러 저장
          this.controller = controller;
        },
        initialUrl: homeUrl,
        // 자바스크립트를 실행하도록 설정
        javascriptMode: JavascriptMode.unrestricted,
      )
    );
  }
}
