import 'package:app_todo_list/screen/home/mainPage.dart';
import 'package:app_todo_list/screen/login/login.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'Registro',
      //     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      //   ),
      //   centerTitle: true,
      //   backgroundColor:
      //       const Color.fromARGB(255, 128, 186, 186).withOpacity(0.5),
      // ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.2,
            child: Image.asset(
              'assets/img/splash.png',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.only(top:60, left: 16, right: 16, bottom: 12),
                      child: Text(
                        'Ingresa tus datos personales',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const CustomTextFormField(
                      labelText: 'Nombre',
                    ),
                    const CustomTextFormField(
                      labelText: 'Apellido',
                    ),
                    const CustomTextFormField(
                      labelText: 'Correo',
                    ),
                    const CustomTextFormField(
                      labelText: 'Contraseña',
                    ),
                    const CustomTextFormField(
                      labelText: 'Confirmar contraseña',
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('¿Ya tienes una cuenta?'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const LoginScreen()));
                      },
                      child: const Text(
                        'Login AQUÍ',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xFF2DC3C4)),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MainPage()));
                          },
                          child: const Text(
                            'Ingresar',
                            style: TextStyle(
                                color: Colors.black, fontSize: 16.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
  });

  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(color: Color(0xFF2DC3C4)),
          ),
        ),
      ),
    );
  }
}
