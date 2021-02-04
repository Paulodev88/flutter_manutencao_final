import 'package:flutter/material.dart';
import 'package:manutencao_parse/screen/signup/sign_Up_Screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrar', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 8,
              margin: EdgeInsets.symmetric(horizontal: 32),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Acessar com E-mail",
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 3, bottom: 4, top: 8),
                      child: Text(
                        "E-mail",
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(), isDense: true),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                          left: 3,
                          bottom: 4,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Senha",
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.w700),
                            ),
                            GestureDetector(
                              child: Text(
                                "Esqueceu sua senha?",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.blue),
                              ),
                              onTap: () {},
                            )
                          ],
                        )),
                    TextField(
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(), isDense: true),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 40,
                      margin: const EdgeInsets.only(top: 20, bottom: 20),
                      child: RaisedButton(
                        color: Colors.yellow,
                        onPressed: () {},
                        child: Text("ENTRAR"),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    Divider(color: Colors.black),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: <Widget>[
                          const Text(
                            "Não tem uma conta? ",
                            style: TextStyle(fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => SignUpScreen()));
                            },
                            child: Text(
                              "Cadastra-se",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.blue,
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
