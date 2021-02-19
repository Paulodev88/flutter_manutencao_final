import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:toggle_switch/toggle_switch.dart';

class EditAccountScreen extends StatelessWidget {
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
                        onToggle: (i) {},
                      );
                    }),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          isDense: true,
                          labelText: "Nome:"),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          isDense: true,
                          labelText: "Telefone:"),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        TelefoneInputFormatter(),
                      ],
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          isDense: true,
                          labelText: "Nova Senha:"),
                      obscureText: true,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          isDense: true,
                          labelText: "Confirmar Senha:"),
                      obscureText: true,
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 40,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        onPressed: () {},
                        color: Colors.blue,
                        elevation: 8,
                        child: Text(
                          "Salvar",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 40,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        onPressed: () {},
                        color: Colors.grey,
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
