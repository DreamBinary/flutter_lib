import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

import 'type_ahead_logic.dart';

class TypeAheadPage extends StatefulWidget {
  const TypeAheadPage({Key? key}) : super(key: key);

  @override
  _TypeAheadPageState createState() => _TypeAheadPageState();
}

class _TypeAheadPageState extends State<TypeAheadPage> {
  final logic = Get.find<TypeAheadLogic>();
  final state = Get.find<TypeAheadLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TypeAheadField(
          textFieldConfiguration: const TextFieldConfiguration(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'What are you looking for?',
            ),
          ),
          suggestionsCallback: (pattern) async {
            return await logic.getSuggestions(pattern);
          },
          itemBuilder: (context, suggestion) {
            return ListTile(
              title: Text(suggestion.toString()),
            );
          },
          onSuggestionSelected: (suggestion) {
            debugPrint(suggestion.toString());
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<TypeAheadLogic>();
    super.dispose();
  }
}
