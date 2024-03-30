import 'package:flutter/material.dart';
import 'package:gradient_elevated_button/gradient_elevated_button.dart';

class UserRegisterPage extends StatefulWidget{
  const UserRegisterPage({super.key});

  @override
  State<UserRegisterPage> createState() => _UserRegisterPage();
}

class _UserRegisterPage extends State<UserRegisterPage>{

  TextEditingController nameController = TextEditingController();
  TextEditingController birthController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  bool isChecked = false;

  final dropValue = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: const Image(image: AssetImage('assets/images/Logotipo_MedFacil_Branca.png')),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('Faça seu cadastro', style: TextStyle(color: Color(0xFF6052FF), fontSize: 32),),
                      // Line name
                      Padding(padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const Image(image: AssetImage('assets/images/icons8_user.png') ),
                            Expanded(child: TextFormField(
                                keyboardType: TextInputType.text,
                                controller: nameController,
                                decoration: InputDecoration(
                                    labelText: 'Nome Completo',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: const BorderSide(),
                                    )
                                )
                            ),
                            )
                          ],
                        ),),
                      // Line birth
                      Padding(padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const Image(image: AssetImage('assets/images/icons8-calendario.png')),
                            Expanded(child: TextFormField(
                                keyboardType: TextInputType.datetime,
                                controller: birthController,
                                decoration: InputDecoration(
                                    hintText: 'dd/mm/yyyy',
                                    labelText: 'Nascimento',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: const BorderSide(),
                                    )
                                )
                            ),
                            )
                          ],
                        ),),
                      // Line sex
                      Padding(padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const Image(image: AssetImage('assets/images/icons8-sex.png')),
                            ValueListenableBuilder(valueListenable: dropValue, builder: (BuildContext context, String value, _) {
                              return DropdownButton<String>(
                                hint: const Text('Sexo'),
                                value: (value.isEmpty) ? null : value,
                                onChanged: (String? value) => dropValue.value = value.toString() ,
                                items: const [
                                  DropdownMenuItem(value: "Masculino",child: Text('M'),),
                                  DropdownMenuItem(value: "Feminino",child: Text('F'),)
                                ],
                              );
                            })
                          ],
                        ),),
                      //Line cpf
                      Padding(padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const Image(image: AssetImage('assets/images/icons8-passe-de-seguranca.png') ),
                            Expanded(child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: cpfController,
                                decoration: InputDecoration(
                                    labelText: 'CPF',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: const BorderSide(),
                                    )
                                )
                            ),
                            )
                          ],
                        ),),
                      //Line contact
                      Padding(padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const Image(image: AssetImage('assets/images/icons8-mobile-72.png') ),
                            Expanded(child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: phoneNumberController,
                                decoration: InputDecoration(
                                    labelText: 'Celular',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: const BorderSide(),
                                    )
                                )
                            ),
                            )
                          ],
                        ),),
                      //Line e-mail
                      Padding(padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const Image(image: AssetImage('assets/images/icons8-e-mail-72.png') ),
                            Expanded(child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                decoration: InputDecoration(
                                    labelText: 'E-mail',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: const BorderSide(),
                                    )
                                )
                            ),
                            )
                          ],
                        ),),
                      // Line termos de uso
                      Padding(padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Checkbox(
                                value: isChecked,
                                onChanged: (bool? value){
                                  setState(() {
                                    isChecked = value!;
                                  });
                                }),
                            const Text('Li e estou de acordo com o Termo de Uso e \nPolítica de Privacidade',
                              style: TextStyle(fontSize: 14),)
                          ],
                        ),
                      ),
                      GradientElevatedButton(
                        onPressed: () {
                          //TODO: Implementar Login

                        },
                        style: GradientElevatedButton.styleFrom(
                          gradient: const LinearGradient(colors: [
                            Color(0x623ACEB5),
                            Color(0x626052FF)
                          ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),

                        ),
                        child: const Text("Cadastrar", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20)),
                      )
                    ],
                  )
              ),
            )
        ),
      )
    );
  }

}



