import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:manutencao_parse/screen/signup/components/field_title.dart';
import 'package:manutencao_parse/stores/signup_store.dart';

class SignUpScreen extends StatelessWidget {
  final SignupStore signupStore = SignupStore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cadastrar",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: 16),
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
                      FieldTitle("Nome", "Como aparecerá em suas manutenções."),
                      Observer(builder: (_) {
                        return TextField(
                          enabled: !signupStore.loading,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Exemplo: Paulo R.",
                              isDense: true,
                              errorText: signupStore.nameError),
                          onChanged: signupStore.setName,
                        );
                      }),
                      const SizedBox(
                        height: 15,
                      ),
                      FieldTitle(
                          "E-mail", "Enviaremos um e-mail de confirmação."),
                      Observer(builder: (_) {
                        return TextField(
                          enabled: !signupStore.loading,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Exemplo: paulo@gmail.com',
                              isDense: true,
                              errorText: signupStore.emailError),
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          onChanged: signupStore.setEmail,
                        );
                      }),
                      const SizedBox(
                        height: 15,
                      ),
                      FieldTitle("Celular", "Deixe um número para contato."),
                      Observer(builder: (_) {
                        return TextField(
                          enabled: !signupStore.loading,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: '(69) 99999-9999',
                              isDense: true,
                              errorText: signupStore.phoneError),
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            TelefoneInputFormatter()
                          ],
                          onChanged: signupStore.setPhone,
                        );
                      }),
                      const SizedBox(
                        height: 15,
                      ),
                      FieldTitle("Senha",
                          "Use letras, números e caracteres especiais."),
                      Observer(builder: (_) {
                        return TextField(
                          enabled: !signupStore.loading,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                              errorText: signupStore.pass1Error),
                          obscureText: true,
                          onChanged: signupStore.setPass1,
                        );
                      }),
                      const SizedBox(
                        height: 15,
                      ),
                      FieldTitle("Confirmar Senha", "Repita a senha."),
                      Observer(
                        builder: (_) {
                          return TextField(
                            enabled: !signupStore.loading,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                isDense: true,
                                errorText: signupStore.pass2Error),
                            obscureText: true,
                            onChanged: signupStore.setPass2,
                          );
                        },
                      ),
                      Observer(
                        builder: (_) {
                          return Container(
                            height: 40,
                            margin: const EdgeInsets.only(top: 20, bottom: 20),
                            child: RaisedButton(
                              color: Colors.yellow,
                              disabledColor: Colors.yellow[200],
                              onPressed: signupStore.signupPressed,
                              child: signupStore.loading
                                  ? CircularProgressIndicator(
                                      valueColor:
                                          AlwaysStoppedAnimation(Colors.black),
                                    )
                                  : Text("CADASTRAR"),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          );
                        },
                      ),
                      Divider(color: Colors.black),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: <Widget>[
                            const Text(
                              "Já tem conta? ",
                              style: TextStyle(fontSize: 16),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "Entrar",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.blue,
                                    fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
