import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:manutencao_parse/stores/edit_account_store.dart';
import 'package:toggle_switch/toggle_switch.dart';

class EditAccountScreen extends StatelessWidget {
  final EditAccountStore store = EditAccountStore();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue[900],
            Colors.blue[200],
          ],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Editar Conta"),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              margin: const EdgeInsets.symmetric(horizontal: 32),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LayoutBuilder(builder: (_, constraints) {
                      return ToggleSwitch(
                        minWidth: constraints.biggest.width / 2.01,
                        labels: ["Técnico", "Administrativo"],
                        cornerRadius: 16,
                        inactiveBgColor: Colors.blue[200],
                        inactiveFgColor: Colors.white,
                        onToggle: store.setUserType,
                      );
                    }),
                    const SizedBox(height: 8),
                    Observer(builder: (_) {
                      return TextFormField(
                          onChanged: store.setName,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                              labelText: "Nome:",
                              errorText: store.nameError));
                    }),
                    const SizedBox(height: 8),
                    Observer(builder: (_) {
                      return TextFormField(
                        onChanged: store.setPhone,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            labelText: "Telefone:",
                            errorText: store.phoneError),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter(),
                        ],
                        keyboardType: TextInputType.phone,
                      );
                    }),
                    const SizedBox(height: 8),
                    TextFormField(
                      onChanged: store.setPass1,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          isDense: true,
                          labelText: "Nova Senha:"),
                      obscureText: true,
                    ),
                    const SizedBox(height: 8),
                    Observer(builder: (_) {
                      return TextFormField(
                        onChanged: store.setPass2,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            labelText: "Confirmar Senha:",
                            errorText: store.passError),
                        obscureText: true,
                      );
                    }),
                    const SizedBox(height: 15),
                    Observer(builder: (_) {
                      return SizedBox(
                        height: 40,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          onPressed: store.isFormValid ? () {} : null,
                          color: Colors.blue,
                          elevation: 8,
                          child: Text(
                            "Salvar",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 40,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        onPressed: () {},
                        color: Colors.blue[200],
                        elevation: 8,
                        child: Text(
                          "Sair",
                          style: TextStyle(color: Colors.white),
                        ),
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
