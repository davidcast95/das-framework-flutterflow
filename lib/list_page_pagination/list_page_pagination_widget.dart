import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ListPagePaginationWidget extends StatefulWidget {
  const ListPagePaginationWidget({Key key}) : super(key: key);

  @override
  _ListPagePaginationWidgetState createState() =>
      _ListPagePaginationWidgetState();
}

class _ListPagePaginationWidgetState extends State<ListPagePaginationWidget> {
  PageController pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
          ),
          child: Container(
            width: double.infinity,
            height: 500,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
              child: PageView(
                controller: pageViewController ??=
                    PageController(initialPage: 0),
                scrollDirection: Axis.vertical,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Hello World',
                        style: FlutterFlowTheme.bodyText1,
                      ),
                      Text(
                        'Hello World',
                        style: FlutterFlowTheme.bodyText1,
                      ),
                      Text(
                        'Hello World',
                        style: FlutterFlowTheme.bodyText1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
