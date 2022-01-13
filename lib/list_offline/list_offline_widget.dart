import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ListOfflineWidget extends StatefulWidget {
  const ListOfflineWidget({Key key}) : super(key: key);

  @override
  _ListOfflineWidgetState createState() => _ListOfflineWidgetState();
}

class _ListOfflineWidgetState extends State<ListOfflineWidget> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              TextFormField(
                controller: textController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'ToDo',
                  labelStyle: FlutterFlowTheme.bodyText1,
                  hintText: 'Write todo',
                  hintStyle: FlutterFlowTheme.bodyText1,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                ),
                style: FlutterFlowTheme.bodyText1,
              ),
              Expanded(
                child: StreamBuilder<List<TrukRecord>>(
                  stream: queryTrukRecord(),
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
                    List<TrukRecord> listViewTrukRecordList = snapshot.data;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewTrukRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewTrukRecord =
                            listViewTrukRecordList[listViewIndex];
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 12, 0, 12),
                                  child: Text(
                                    listViewTrukRecord.name,
                                    style: FlutterFlowTheme.bodyText1,
                                  ),
                                ),
                              ),
                              Divider(
                                height: 1,
                                thickness: 1,
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
