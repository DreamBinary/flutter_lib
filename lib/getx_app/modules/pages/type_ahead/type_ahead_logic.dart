import 'package:get/get.dart';

import 'type_ahead_state.dart';

class TypeAheadLogic extends GetxController {
  final TypeAheadState state = TypeAheadState();

  Future<List<String>> getSuggestions(String pattern) async {
    return List.generate(20, (index) => '$pattern suggestion $index');
  }
}
