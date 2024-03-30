import 'package:encrypt/encrypt.dart';

const int _kIV = 8;
const int _kKey = 256;

Future<String> encrypt(String value, {String? salt}) async => encryptSync(value, salt: salt);

Future<String> decrypt(String value, {String? salt}) async => decryptSync(value, salt: salt);

String encryptSync(String value, {String? salt}) {
  final String realSalt = _salt(salt);
  return _createCrypto(_salt(salt)).encrypt(value, iv: IV.fromUtf8(realSalt.substring(0, _kIV))).base16;
}

String decryptSync(String value, {String? salt}) {
  final String realSalt = _salt(salt);
  return _createCrypto(_salt(salt)).decrypt16(value, iv: IV.fromUtf8(realSalt.substring(0, _kIV)));
}

Encrypter _createCrypto(String salt) => Encrypter(Salsa20(Key.fromUtf8(salt)));

String _salt(String? salt) {
  String rawSalt = [salt ?? 'NO_SALT'].join();
  if (rawSalt.length != _kKey) {
    if (rawSalt.length < _kKey) {
      rawSalt = [rawSalt, ''.padLeft(_kKey - rawSalt.length, '.')].join();
    } else {
      rawSalt = String.fromCharCodes(rawSalt.codeUnits.take(_kKey));
    }
  }
  return rawSalt;
}
