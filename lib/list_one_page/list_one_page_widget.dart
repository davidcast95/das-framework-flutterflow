import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ListOnePageWidget extends StatefulWidget {
  const ListOnePageWidget({Key key}) : super(key: key);

  @override
  _ListOnePageWidgetState createState() => _ListOnePageWidgetState();
}

class _ListOnePageWidgetState extends State<ListOnePageWidget> {
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
          child: FutureBuilder<ApiCallResponse>(
            future: GetDataCall.call(
              page: 0,
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: SpinKitChasingDots(
                      color: FlutterFlowTheme.primaryColor,
                      size: 50,
                    ),
                  ),
                );
              }
              final columnGetDataResponse = snapshot.data;
              return Builder(
                builder: (context) {
                  final task = (getJsonField(
                            columnGetDataResponse.jsonBody,
                            r'''$.message.data''',
                          )?.toList() ??
                          [])
                      .take(5)
                      .toList();
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(task.length, (taskIndex) {
                      final taskItem = task[taskIndex];
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                              child: Text(
                                getJsonField(
                                  taskItem,
                                  r'''$.name''',
                                ).toString(),
                                style: FlutterFlowTheme.bodyText1,
                              ),
                            ),
                            Divider(
                              height: 0,
                            ),
                          ],
                        ),
                      );
                    }),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
