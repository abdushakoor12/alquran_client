import 'package:alquran_client/alquran_client.dart';

void main() async {
  final client = AlQuranClient();

  final metadata = await client.getMetadata();
  print(metadata);
}
