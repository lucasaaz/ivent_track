import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF2B2B2B),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.00, -1.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 10.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/WhatsApp_Image_2023-08-29_at_1.36.30_PM-removebg-preview.png',
                              width: 185.0,
                              height: 150.0,
                              fit: BoxFit.cover,
                              alignment: Alignment(0.00, 0.00),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Flexible(
                child: Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Opacity(
                                      opacity: 0.8,
                                      child: Align(
                                        alignment:
                                        AlignmentDirectional(0.00, 0.00),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            context.pushNamed('Profile');
                                          },
                                          text: 'PERFIL',
                                          options: FFButtonOptions(
                                            width: 150.0,
                                            height: 180.0,
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                            color: Color(0xFF131313),
                                            textStyle:
                                            FlutterFlowTheme.of(context)
                                                .titleSmall
                                                .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.white,
                                              fontWeight:
                                              FontWeight.normal,
                                            ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Color(0x5F000000),
                                              width: 3.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(0.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Opacity(
                                      opacity: 0.8,
                                      child: Align(
                                        alignment:
                                        AlignmentDirectional(0.00, 0.00),
                                        child: FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text: 'CRIAR',
                                          options: FFButtonOptions(
                                            width: 150.0,
                                            height: 180.0,
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                            color: Color(0xFF131313),
                                            textStyle:
                                            FlutterFlowTheme.of(context)
                                                .titleSmall
                                                .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.white,
                                              fontWeight:
                                              FontWeight.normal,
                                            ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Color(0x5F000000),
                                              width: 3.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(0.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Opacity(
                                      opacity: 0.8,
                                      child: Align(
                                        alignment:
                                        AlignmentDirectional(0.00, 0.00),
                                        child: FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text: 'EDITAR',
                                          options: FFButtonOptions(
                                            width: 150.0,
                                            height: 180.0,
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                            color: Color(0xFF131313),
                                            textStyle:
                                            FlutterFlowTheme.of(context)
                                                .titleSmall
                                                .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.white,
                                              fontWeight:
                                              FontWeight.normal,
                                            ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Color(0x5F000000),
                                              width: 3.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(0.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Opacity(
                                      opacity: 0.8,
                                      child: Align(
                                        alignment:
                                        AlignmentDirectional(0.00, 0.00),
                                        child: FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text: 'DASHBOAR',
                                          options: FFButtonOptions(
                                            width: 150.0,
                                            height: 180.0,
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                            color: Color(0xFF131313),
                                            textStyle:
                                            FlutterFlowTheme.of(context)
                                                .titleSmall
                                                .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.white,
                                              fontWeight:
                                              FontWeight.normal,
                                            ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Color(0x5F000000),
                                              width: 3.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(0.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ].divide(SizedBox(height: 30.0)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.00, 1.00),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: FlutterFlowIconButton(
                            borderColor: Color(0x13000000),
                            borderRadius: 50.0,
                            borderWidth: 0.0,
                            buttonSize: 70.0,
                            fillColor: Color(0xFF5500FF),
                            hoverColor: Color(0xFF5500FF),
                            hoverIconColor: Colors.black,
                            icon: Icon(
                              Icons.house,
                              color: Colors.white,
                              size: 40.0,
                            ),
                            onPressed: () async {
                              context.pushNamed('HomePage');
                            },
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: FlutterFlowIconButton(
                            borderColor: Color(0x13000000),
                            borderRadius: 50.0,
                            borderWidth: 0.0,
                            buttonSize: 70.0,
                            fillColor: Color(0xFF9800FF),
                            hoverColor: Color(0xFF9800FF),
                            hoverIconColor: Colors.black,
                            icon: Icon(
                              Icons.qr_code_scanner,
                              color: Colors.white,
                              size: 40.0,
                            ),
                            onPressed: () async {
                              context.pushNamed('QRcode');
                            },
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: FlutterFlowIconButton(
                            borderColor: Color(0x17000000),
                            borderRadius: 50.0,
                            borderWidth: 0.0,
                            buttonSize: 70.0,
                            fillColor: Color(0xFFE700FF),
                            hoverColor: Color(0xFFE700FF),
                            hoverIconColor: Colors.black,
                            icon: Icon(
                              Icons.list,
                              color: Colors.white,
                              size: 30.0,
                            ),
                            onPressed: () async {
                              context.pushNamed('list');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}