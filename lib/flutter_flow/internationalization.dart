import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['pt', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ptText = '',
    String? enText = '',
  }) =>
      [ptText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // list
  {
    'j1hdhf2v': {
      'pt': 'Lista de itens',
      'en': '',
    },
    '4l5gy7ck': {
      'pt': 'Burcar...',
      'en': '',
    },
    '8t4pbvkm': {
      'pt': 'Title',
      'en': '',
    },
    'qgsnzhbo': {
      'pt': 'Subtitle',
      'en': '',
    },
    'nc2nutjt': {
      'pt': 'subtext',
      'en': '',
    },
    'j5aqxlc1': {
      'pt': 'Title',
      'en': '',
    },
    'cd1zcpz2': {
      'pt': 'Subtitle',
      'en': '',
    },
    '0cgr23rx': {
      'pt': 'subtext',
      'en': '',
    },
    'i641xc93': {
      'pt': 'Title',
      'en': '',
    },
    'kemrqixj': {
      'pt': 'Subtitle',
      'en': '',
    },
    '4y4zk4i4': {
      'pt': 'subtext',
      'en': '',
    },
    'jbzetfxk': {
      'pt': 'Title',
      'en': '',
    },
    'vds0afrv': {
      'pt': 'Subtitle',
      'en': '',
    },
    '2xycbgg7': {
      'pt': 'subtext',
      'en': '',
    },
    'r4h94f82': {
      'pt': 'Shop',
      'en': '',
    },
  },
  // HomePage
  {
    'hd9c7fco': {
      'pt': 'PERFIL',
      'en': '',
    },
    'wf5dzog3': {
      'pt': 'CRIAR',
      'en': '',
    },
    'pj6syhkf': {
      'pt': 'EDITAR',
      'en': '',
    },
    '1a4ftd8d': {
      'pt': 'DASHBOARD',
      'en': '',
    },
    '18ln62un': {
      'pt': 'Home',
      'en': '',
    },
  },
  // QRcode
  {
    'vw4oa0jo': {
      'pt': 'QR code',
      'en': '',
    },
    'q5w3ab0x': {
      'pt': 'Home',
      'en': '',
    },
  },
  // Profile
  {
    'xgz441dr': {
      'pt': 'PERFIL',
      'en': '',
    },
    'swtxe62v': {
      'pt': 'Seu Nome',
      'en': '',
    },
    '0cypwqry': {
      'pt': 'Meus Dados',
      'en': '',
    },
    '5r5blbcg': {
      'pt': 'Notificações',
      'en': '',
    },
    'oicd3e6h': {
      'pt': 'Ajuda',
      'en': '',
    },
    'ilt3orh0': {
      'pt': 'PERFIL',
      'en': '',
    },
    'rjg2o882': {
      'pt': 'Tel. Celular',
      'en': '',
    },
    'cc4qg6hz': {
      'pt': 'Add Número',
      'en': '',
    },
    'i2wma4ds': {
      'pt': 'Lingua',
      'en': '',
    },
    'ex9t3h6q': {
      'pt': 'English (eng)',
      'en': '',
    },
    'e9eabrqj': {
      'pt': 'Editar Perfil',
      'en': '',
    },
    'u4e73h9v': {
      'pt': 'Editar Perfil',
      'en': '',
    },
    'g0htzepb': {
      'pt': 'Notificações',
      'en': '',
    },
    'pay1to8t': {
      'pt': 'Sair',
      'en': '',
    },
    '6py2iq2b': {
      'pt': 'Log Out?',
      'en': '',
    },
    'j7tqaimp': {
      'pt': 'Home',
      'en': '',
    },
  },
  // Miscellaneous
  {
    '07rzkj08': {
      'pt': 'Permitir acesso á camera',
      'en': '',
    },
    'wkurmrem': {
      'pt': 'Permitir acesso á Localização',
      'en': '',
    },
    'nrvsjn10': {
      'pt': 'Permitir acesso á Notificação',
      'en': '',
    },
    '57bxdrgt': {
      'pt': 'Permitir acesso á Galeria',
      'en': '',
    },
    'vseqcyyx': {
      'pt': '',
      'en': '',
    },
    'hth1y6b1': {
      'pt': '',
      'en': '',
    },
    'qjedd3km': {
      'pt': '',
      'en': '',
    },
    'z7a5qlmf': {
      'pt': '',
      'en': '',
    },
    '7kaeskth': {
      'pt': '',
      'en': '',
    },
    'g94o3k4i': {
      'pt': '',
      'en': '',
    },
    'lgxs7xlu': {
      'pt': '',
      'en': '',
    },
    'ky24gwbt': {
      'pt': '',
      'en': '',
    },
    'waxreoz2': {
      'pt': '',
      'en': '',
    },
    'zfv3h6qc': {
      'pt': '',
      'en': '',
    },
    'epwconnj': {
      'pt': '',
      'en': '',
    },
    'd3ryht23': {
      'pt': '',
      'en': '',
    },
    'eikkbna1': {
      'pt': '',
      'en': '',
    },
    'ku3uaoda': {
      'pt': '',
      'en': '',
    },
    'hr47yame': {
      'pt': '',
      'en': '',
    },
    'tck3h0dl': {
      'pt': '',
      'en': '',
    },
    '2f2pl7no': {
      'pt': '',
      'en': '',
    },
    'w1rjb4vf': {
      'pt': '',
      'en': '',
    },
    '0bpcn7yr': {
      'pt': '',
      'en': '',
    },
    'vsilzori': {
      'pt': '',
      'en': '',
    },
    'wbmya36f': {
      'pt': '',
      'en': '',
    },
    'lbg7vr6t': {
      'pt': '',
      'en': '',
    },
    'viggci5b': {
      'pt': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
