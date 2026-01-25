import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController nameController = TextEditingController(text: "");
  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController idController = TextEditingController(text: "");

  final _formKey = GlobalKey<FormState>();

  String? name;
  String? email;
  int? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [buildForm()],
      ),
    );
  }

  Container buildForm() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Column(
            children: [
              Text("Name : ${name ?? "Empty name"}"),
              Text("Email : ${email ?? "Empty email"}"),
              Text("Id : ${id ?? "Empty ID"}"),
            ],
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                //Text field
                TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    setState(() {
                      nameController.text = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Name cannot be empty !";
                    }
                    return null;
                  },
                ),
                //Text field
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    setState(() {
                      emailController.text = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email cannot be empty !";
                    }

                    if (!value.contains('@')) {
                      return "Invalid email";
                    }

                    return null;
                  },
                ),
                //Text field,
                TextFormField(
                  controller: idController,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      idController.text = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Id cannot be empty !";
                    }
                    return null;
                  },
                ),

                // Button
                OutlinedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        name = nameController.text;
                        email = emailController.text;
                        id = int.tryParse(idController.text) ?? -1;
                      });
                    }
                  },
                  child: Text('Click'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
