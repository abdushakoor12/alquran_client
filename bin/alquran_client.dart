import 'package:alquran_client/alquran_client.dart';

void main(List<String> arguments) async {
  AlQuranClient client = AlQuranClient();
  final editions = await client.getEditions();
  print(editions.map((e) => e.direction).toSet());
}
