import 'package:flutter_test/flutter_test.dart';
import 'package:proyect_test/src/utils/providers/validaciones_utils.dart';

void main(){
  test('Testing bad email',(){

    Validations validations = Validations();
    dynamic data = validations.validateEmail('sergio@gmail');
    expect(data,'El Email suministrado no es válido. Intente otro correo electrónico');

  });

  test('Testing good email',(){

    Validations validations = Validations();
    dynamic data = validations.validateEmail('sergio@gmail.com');
    expect(data,null);

  });

  test('Testing void email',(){

    Validations validations = Validations();
    dynamic data = validations.validateEmail('');
    expect(data,'El campo Email no puede estar vacío!');

  });




    test('Testing bad Password',(){

    Validations validations = Validations();
    dynamic data = validations.validatePassword('123456');
    expect(data,'El tamaño de la contraseña debe ser más de 8 carácteres');

  });

  test('Testing good Password',(){

    Validations validations = Validations();
    dynamic data = validations.validatePassword('12345678');
    expect(data,null);

  });

  test('Testing void Password',(){

    Validations validations = Validations();
    dynamic data = validations.validatePassword('');
    expect(data,'El campo Contraseña no puede estar vacío');

  });




  
    test('Testing bad RepeatPassword',(){

    Validations validations = Validations();
    dynamic data = validations.validateRepetPassword('12345678','12345687');
    expect(data,'Las contraseñas no coinciden');

  });

  test('Testing good RepeatPassword',(){

    Validations validations = Validations();
    dynamic data = validations.validateRepetPassword('12345678','12345678');
    expect(data,null);

  });

}