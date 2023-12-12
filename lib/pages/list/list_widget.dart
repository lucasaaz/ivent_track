import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'list_model.dart';
export 'list_model.dart';
import 'sql_helper.dart';
import 'package:geolocator/geolocator.dart';

final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class ListWidget extends StatefulWidget {
  const ListWidget({Key? key}) : super(key: key);

  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class ListaProdutos extends StatelessWidget {
  const ListaProdutos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData darkTheme = ThemeData.dark().copyWith(
      primaryColor: Colors.orange,
    );
    return MaterialApp(
      scaffoldMessengerKey: _scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      title: 'Lista de Produtos',
      theme: darkTheme,
      home: const ListWidget(),
    );
  }
}

class _ListWidgetState extends State<ListWidget> {
  List<Map<String, dynamic>> _produtos = [];
  List<Map<String, dynamic>> _produtosFiltrados = [];
  bool _estaAtualizando = true;

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _qrcodeController = TextEditingController();
  final TextEditingController _qteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _atualizaProdutos();
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _descricaoController.dispose();
    _qrcodeController.dispose();
    _qteController.dispose();

    super.dispose();
  }

  void _atualizaProdutos() async {
    final data = await SQLHelper.pegaProdutos();
    setState(() {
      _produtos = data;
      _produtosFiltrados = _produtos; // Initialize filtered list
      _estaAtualizando = false;
    });
  }

  void _filtrarProdutosPorNome(String filtro) {
    setState(() {
      _produtosFiltrados = _produtos
          .where((produto) =>
              produto['nome'].toLowerCase().contains(filtro.toLowerCase()))
          .toList();
    });
  }

  void _mostraEdicao(int? id) async {
    if (id != null) {
      final produtoExistente =
          _produtos.firstWhere((element) => element['id'] == id);
      _nomeController.text = produtoExistente['nome'];
      _descricaoController.text = produtoExistente['descricao'];
      _qrcodeController.text = produtoExistente['qrcode'].toString();
      _qteController.text = produtoExistente['qte'].toString();
    }

    showModalBottomSheet(
      context: context,
      elevation: 5,
      isScrollControlled: true,
      builder: (_) => Container(
        padding: EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom + 120,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(hintText: 'Nome do Produto'),
            ),
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              controller: _descricaoController,
              decoration:
                  const InputDecoration(hintText: 'Descrição do Produto'),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _qrcodeController,
                    decoration:
                        const InputDecoration(hintText: 'QRcode do Produto'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.barcode_reader),
                  onPressed: () {
                    scanBarCode();
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              controller: _qteController,
              decoration:
                  const InputDecoration(hintText: 'Quantidade do Produto'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Add your logic to get the current location here
                _getCurrentLocation();
              },
              child: Text('Obter Posição Atual'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (id == null) {
                  await _adicionaProduto();
                }
                if (id != null) {
                  await _atualizaProduto(id);
                }
                _nomeController.text = '';
                _descricaoController.text = '';
                _qrcodeController.text = '';
                _qteController.text = '';
                _atualizaProdutos();
                if (!mounted) return;
                Navigator.of(context).pop();
              },
              child: Text(id == null ? 'Adicionar' : 'Atualizar'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // A posição contém as informações de latitude e longitude
      double latitude = position.latitude;
      double longitude = position.longitude;

      // Faça algo com a latitude e longitude, por exemplo, exiba em um diálogo
      _showLocationDialog(latitude, longitude);
    } catch (e) {
      print("Erro ao obter a posição atual: $e");
      // Trate qualquer erro que possa ocorrer durante a obtenção da posição
    }
  }

  void _showLocationDialog(double latitude, double longitude) {
    // Exemplo simples de como mostrar a posição em um diálogo
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Posição Atual"),
          content: Text("Latitude: $latitude\nLongitude: $longitude"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Fechar"),
            ),
          ],
        );
      },
    );
  }

  Future<void> _adicionaProduto() async {
    await SQLHelper.adicionarProduto(
      _nomeController.text,
      _descricaoController.text,
      int.parse(_qrcodeController.text),
      int.parse(_qteController.text),
    );
    _atualizaProdutos();
  }

  Future<void> _atualizaProduto(int id) async {
    await SQLHelper.atualizaProduto(
      id,
      _nomeController.text,
      _descricaoController.text,
      int.parse(_qrcodeController.text),
      int.parse(_qteController.text),
    );
    _atualizaProdutos();
  }

  void _apagaProduto(int id) async {
    await SQLHelper.apagaProduto(id);
    _scaffoldMessengerKey.currentState?.showSnackBar(const SnackBar(
      content: Text('Produto apagado!'),
    ));
    _atualizaProdutos();
  }

  Future<void> scanBarCode() async {
    String resultadoBarCode = "0000000000000";
    try {
      resultadoBarCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancelar',
        true,
        ScanMode.BARCODE,
      );
    } on PlatformException {
      resultadoBarCode = 'Erro ao pegar a versão da plataforma.';
    }
    if (!mounted) return;
    setState(() {
      _qrcodeController.text = resultadoBarCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            context.pushNamed(
              'HomePage',
              extra: <String, dynamic>{
                kTransitionInfoKey: TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.leftToRight,
                  duration: Duration(milliseconds: 220),
                ),
              },
            );
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'j1hdhf2v' /* Lista de itens */,
          ),
          style: FlutterFlowTheme.of(context).titleSmall.override(
                fontFamily: 'Readex Pro',
                color: Color(0xFFC1C1C1),
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
        elevation: 0.0,
      ),
      body: _estaAtualizando
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _produtos.length,
              itemBuilder: (context, index) => Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.blue, // Cor de fundo azulado
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "QRcode: ${_produtos[index]['qrcode']}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.white, // Cor das letras branca
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () =>
                                    _mostraEdicao(_produtos[index]['id']),
                              ),
                              Text(
                                _produtos[index]['nome'],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Descrição",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            _produtos[index]['descricao'],
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Qte",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            _produtos[index]['qte'].toString(),
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _apagaProduto(_produtos[index]['id']),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 132, 0, 255),
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () => _mostraEdicao(null),
      ),
    );
  }
}
