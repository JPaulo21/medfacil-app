import 'package:flutter/material.dart';
import 'package:gradient_elevated_button/gradient_elevated_button.dart';
import 'package:medfacil_app/pages/user_register_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  goRegisterUser() {
    Navigator.push(context, MaterialPageRoute(
        builder: (_) => const UserRegisterPage(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Spacer(flex: 4,),
            const Flexible(
                flex: 2,
                child: Text('Olá, bem-vindo(a)', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),)),
            const Spacer(),
            const Flexible(
                flex: 5,
                child: Image(image: AssetImage('assets/images/Logo_MedFacil.png')),),
            const Spacer(),
            Flexible(
              flex: 5,
              child: GradientElevatedButton(
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
              child: const Text("Login", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20)),
            )),
            const Spacer(),
            Flexible(
              flex: 14,
              child: TextButton(onPressed: () => goRegisterUser(), child: const Text('Cadastrar', style: TextStyle(decoration: TextDecoration.underline, fontSize: 20, fontWeight: FontWeight.w600),)))
          ],
        ),
      ),
    );
  }

}
