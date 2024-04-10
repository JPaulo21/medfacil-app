import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradient_elevated_button/gradient_elevated_button.dart';
import 'package:medfacil_app/pages/home_page.dart';
import 'package:medfacil_app/services/user_service.dart';

import '../models/user.dart';

class UserRegisterPage extends StatefulWidget {
  const UserRegisterPage({super.key});

  @override
  State<UserRegisterPage> createState() => _UserRegisterPage();
}

class _UserRegisterPage extends State<UserRegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController birthController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  bool isChecked = false;
  final UserService userService = UserService();

  final dropValue = ValueNotifier('');

  final _formKey = GlobalKey<FormState>();

  goHomePage() {
    Navigator.push(context, MaterialPageRoute(
      builder: (_) => const HomePage(),
    ));
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
                image: AssetImage('assets/images/Logotipo_MedFacil_Branca.png')),
          ),
          body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Faça seu cadastro',
                      style: TextStyle(color: Color(0xFF6052FF), fontSize: 32),
                    ),
                    // Line name
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const Image(
                              image:
                                  AssetImage('assets/images/icons8_user.png')
                          ),
                          Expanded(
                            child: TextFormField(
                                validator: (String? value){
                                  return value != null && value.isEmpty ? 'Nome deve ser preenchido':null;
                                },
                                keyboardType: TextInputType.text,
                                controller: nameController,
                                decoration: InputDecoration(
                                    labelText: 'Nome Completo',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: const BorderSide(),
                                    ))),
                          )
                        ],
                      ),
                    ),
                    // Line birth
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const Image(
                              image: AssetImage(
                                  'assets/images/icons8-calendario.png')),
                          Expanded(
                            child: TextFormField(
                                validator: (value){
                                  return value != null && value.isEmpty ? 'Data de Nascimento deve ser preenchida!':null;
                                },
                                keyboardType: TextInputType.datetime,
                                controller: birthController,
                                decoration: InputDecoration(
                                    hintText: 'dd/mm/yyyy',
                                    labelText: 'Nascimento',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: const BorderSide(),
                                    ))),
                          )
                        ],
                      ),
                    ),
                    // Line sex
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const Image(
                              image:
                                  AssetImage('assets/images/icons8-sex.png')),
                          ValueListenableBuilder(
                              valueListenable: dropValue,
                              builder: (BuildContext context, String value, _) {
                                return DropdownButton<String>(
                                  hint: const Text('Sexo'),
                                  value: (value.isEmpty) ? null : value,
                                  onChanged: (String? value) =>
                                      dropValue.value = value.toString(),
                                  items: const [
                                    DropdownMenuItem(
                                      value: "Masculino",
                                      child: Text('M'),
                                    ),
                                    DropdownMenuItem(
                                      value: "Feminino",
                                      child: Text('F'),
                                    )
                                  ],
                                );
                              })
                        ],
                      ),
                    ),
                    //Line cpf
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const Image(
                              image: AssetImage(
                                  'assets/images/icons8-passe-de-seguranca.png')),
                          Expanded(
                            child: TextFormField(
                                validator: (value){
                                  return value != null && value.isEmpty ? 'CPF deve ser preenchido!':null;
                                },
                                keyboardType: TextInputType.number,
                                controller: cpfController,
                                decoration: InputDecoration(
                                    labelText: 'CPF',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: const BorderSide(),
                                    ))),
                          )
                        ],
                      ),
                    ),
                    //Line contact
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const Image(
                              image: AssetImage(
                                  'assets/images/icons8-mobile-72.png')),
                          Expanded(
                            child: TextFormField(
                                validator: (value){
                                  return value != null && value.isEmpty ? 'Número de celular deve ser preenchida!':null;
                                },
                                keyboardType: TextInputType.phone,
                                controller: phoneNumberController,
                                decoration: InputDecoration(
                                    labelText: 'Celular',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: const BorderSide(),
                                    ))),
                          )
                        ],
                      ),
                    ),
                    //Line e-mail
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const Image(
                              image: AssetImage(
                                  'assets/images/icons8-e-mail-72.png')),
                          Expanded(
                            child: TextFormField(
                                validator: (value){
                                  return value != null && value.isEmpty ? 'E-mail deve ser preenchida!':null;
                                },
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                decoration: InputDecoration(
                                    labelText: 'E-mail',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: const BorderSide(),
                                    ))),
                          )
                        ],
                      ),
                    ),
                    // Line termos de uso
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Checkbox(
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              }),
                          const Text(
                            'Li e estou de acordo com o Termo de Uso e \nPolítica de Privacidade',
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    ),
                    GradientElevatedButton(
                      onPressed: () {
                        //TODO: Implementar Login
                        if(_formKey.currentState!.validate()){
                          User user = User();
                          user.name = nameController.text;
                          user.birthDate = birthController.text;
                          user.sex = 'M';
                          user.cpf = cpfController.text;
                          user.ddi = '+55';
                          user.ddd = phoneNumberController.text.substring(0,3);
                          user.phoneNumber = phoneNumberController.text.substring(3, phoneNumberController.text.length);
                          user.email = emailController.text;
                          userService.createUser(user);
                          goHomePage();
                        }
                      },
                      style: GradientElevatedButton.styleFrom(
                        gradient: const LinearGradient(
                          colors: [Color(0x623ACEB5), Color(0x626052FF)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child: const Text("Cadastrar",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 20)),
                    )
                  ],
                                      ),
                )
            ),
          )
      ),
    );
  }
}
