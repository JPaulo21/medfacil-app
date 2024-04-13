import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradient_elevated_button/gradient_elevated_button.dart';
import 'package:toastification/toastification.dart';

class LoginPage extends StatefulWidget {
  final bool? userCreated;

  const LoginPage({super.key, this.userCreated = false});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();

  FocusNode digito1 = FocusNode();
  FocusNode digito2 = FocusNode();
  FocusNode digito3 = FocusNode();
  FocusNode digito4 = FocusNode();

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if(widget.userCreated == true){
        toastification.show(
          context: context,
          type: ToastificationType.success,
          style: ToastificationStyle.flatColored,
          autoCloseDuration: const Duration(seconds: 7),
          title: Text('Cadastro Realizado com sucesso!'),
          description: RichText(text: const TextSpan(text: 'Faça seu Login', style: TextStyle(color: Colors.black)))
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          centerTitle: true,
          title: const Image(
              image: AssetImage('assets/images/Logotipo_MedFacil_Branca.png')
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image(image: AssetImage('assets/images/login/icons8-entrar-64.png')),
                Text('Login', style: TextStyle(color: Color(0xFF6052FF), fontSize: 20, fontWeight: FontWeight.w600)),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 50,
                        child:Image(image: AssetImage('assets/images/login/icons8_senha_64.png'))
                      ),
                      SizedBox(
                        width: 56,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                          child: TextFormField(
                            //autofocus: true,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(color: Color(0xFF6052FF)),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(),
                              ),
                            ),
                            cursorColor: Colors.transparent,
                            focusNode: digito1,
                            onChanged: (value){
                              if(value.length == 1){
                                digito2.requestFocus();
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 56,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(color: Color(0xFF6052FF)),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(),
                              ),
                            ),
                            cursorColor: Colors.transparent,
                            focusNode: digito2,
                            onChanged: (value){
                              if(value.length == 1){
                                digito3.requestFocus();
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 56,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(color: Color(0xFF6052FF)),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(),
                              ),
                            ),
                            cursorColor: Colors.transparent,
                            focusNode: digito3,
                            onChanged: (value){
                              if(value.length == 1){
                                digito4.requestFocus();
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 56,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(color: Color(0xFF6052FF)),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(),
                              ),
                            ),
                            cursorColor: Colors.transparent,
                            focusNode: digito4,
                            onChanged: (value){
                              if(value.length == 1){
                                //TODO: Implementar obtenção dos dígitos e chamar método de autenticação
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GradientElevatedButton(
                  onPressed: () {
                    //TODO: Implementar Login

                  },
                  style: GradientElevatedButton.styleFrom(
                    gradient: const LinearGradient(
                      colors: [Color(0x623ACEB5), Color(0x626052FF)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: const Text("Receber Código",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 20)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
