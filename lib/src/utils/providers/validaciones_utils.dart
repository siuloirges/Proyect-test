

class Validations {
  


String validateEmail(String value) {
  if (value.isEmpty) {
    return 'El campo Email no puede estar vacío!';
  }
  // Regex para validación de email
  String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
      "\\@" +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
      "(" +
      "\\." +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
      ")+";
  RegExp regExp = new RegExp(p);
  if (regExp.hasMatch(value)) {
    return null;      
  }

  return 'El Email suministrado no es válido. Intente otro correo electrónico';

}

String validatePassword(String value) {
  if (value.isEmpty) {
    return 'El campo Contraseña no puede estar vacío';
  }
  // Use cualquier tamaño de contraseña que usted quiera aquí
  if (value.length < 8) {
    return 'El tamaño de la contraseña debe ser más de 8 carácteres';
  }
  return null;
}
  String validateRepetPassword(String value, String password) {
    //print("valorrr $value passsword ${passwordCtrl.text}");
    if (value != password) {
      return "Las contraseñas no coinciden";
    } else if (value.length < 8) {
      return 'El tamaño de la contraseña debe ser más de 8 carácteres';
    }
    return null;
  }


}