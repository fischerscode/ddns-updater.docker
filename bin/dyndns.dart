import 'dart:async';
import 'dart:io';

import 'package:http/http.dart';

const envUrls = 'ENV_URL';
const envUsername = 'ENV_USER';
const envPassword = 'ENV_PASS';

const varPublicIPv4 = '__pIPv4__';
const varPublicIPv6 = '__pIPv6__';

const varUsername = '__USER__';
const varPassword = '__PASS__';

void main(List<String> args) async {
  var url = Platform.environment[envUrls];

  if (url == null || url.isEmpty) {
    throw '$envUrls is not set.';
  }

  Timer.periodic(Duration(minutes: 1), (timer) async {
    var v64 = (await get(Uri.parse(url.contains(varPublicIPv6)
            ? 'https://api64.ipify.org'
            : 'https://api.ipify.org')))
        .body;
    var v6 = v64.contains(':') ? v64 : '';
    var v4 = v64.contains('.')
        ? v64
        : url.contains(varPublicIPv4)
            ? (await get(Uri.parse('https://api64.ipify.org'))).body
            : '';
    await get(Uri.parse(
      url
          .replaceAll(varPublicIPv4, v4)
          .replaceAll(varPublicIPv6, v6)
          .replaceAll(varUsername, Platform.environment[envUsername] ?? '')
          .replaceAll(varPassword, Platform.environment[envPassword] ?? ''),
    ));
  });
}
