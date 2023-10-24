import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'q_rcode_model.dart';
export 'q_rcode_model.dart';

class QRcodeWidget extends StatefulWidget {
  const QRcodeWidget({Key? key}) : super(key: key);

  @override
  _QRcodeWidgetState createState() => _QRcodeWidgetState();
}

class _QRcodeWidgetState extends State<QRcodeWidget> {
  late QRcodeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QRcodeModel());

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
        appBar: AppBar(
          backgroundColor: Color(0xFF202020),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            fillColor: Color(0x00717171),
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Color(0xFF747474),
              size: 30.0,
            ),
            onPressed: () async {
              context.pushNamed('HomePage');
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'vw4oa0jo' /* QR code */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/WhatsApp_Image_2023-08-29_at_1.36.30_PM-removebg-preview.png',
                  width: 90.0,
                  height: 90.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: BarcodeWidget(
                          data: 'Barcode',
                          barcode: Barcode.qrCode(),
                          width: 300.0,
                          height: 200.0,
                          color: FlutterFlowTheme.of(context).primaryText,
                          backgroundColor: Colors.transparent,
                          errorBuilder: (_context, _error) => SizedBox(
                            width: 300.0,
                            height: 200.0,
                          ),
                          drawText: false,
                        ),
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
                    alignment: AlignmentDirectional(0.00, 0.00),
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
