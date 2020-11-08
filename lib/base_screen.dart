library flutter_skye_base_screen;
import 'package:flutter/material.dart';
import 'package:flutter_skye_log/flutter_skye_log.dart';


abstract class BaseScreen extends StatefulWidget {
  @override
  BaseScreenState createState() => BaseScreenState();
}

class BaseScreenState extends State with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => setWanKeepAlike();

  String screenTag = '';
  bool showAppBar = false;

  Logger logger = Logger.instance();

  @override
  void initState() {
    super.initState();
    screenInit();
    logger.debug("$screenTag initState");
  }

  @override
  void dispose() {
    super.dispose();
    logger.debug("$screenTag dispose");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    logger.debug("$screenTag didChangeDependencies");
  }

  @override
  void deactivate() {
    super.deactivate();
    logger.debug("$screenTag deactivate");
  }

  // 页面状态保持
  bool setWanKeepAlike() => true;

  // 页面的主体
  Widget screenBody() => null;

  // 初始化设置
  void screenInit() {}

  // appBar
  Widget screenAppBar() => null;

  @override
  Widget build(BuildContext context) {
    logger.debug("$screenTag build");
    return Scaffold(
      appBar: showAppBar ? screenAppBar() : null,
      body: SafeArea(child: screenBody()),
    );
  }
}