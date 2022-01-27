import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyect_test/src/utils/components/ui/widgets/global_widgets.dart';


class HttpProvider {

  dynamic getMethod(url) async {
    try {
      dynamic resp = await http.get(
        url,
        headers: {'Accept': 'application/json'},
      );

      dynamic decodeResp = json.decode(resp.body);

      return decodeResp;
    } catch (e) {
      floadMessage(mensaje: "Error - get: $url");
      return {"error": "$e"};
    }
    
  }

}