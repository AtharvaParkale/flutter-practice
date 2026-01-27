import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_daily_practice/features/animations/animations_screen.dart';
import 'package:flutter_daily_practice/features/home/domain/entities/user.dart';
import 'package:flutter_daily_practice/features/home/presentation/bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController nameController = TextEditingController(text: "");
  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController idController = TextEditingController(text: "");

  final _formKey = GlobalKey<FormState>();

  String? name;
  String? email;
  int? id;

  List<User> users = [];

  // this is for pagination
  final ScrollController _controller = ScrollController();

  // this is for animation
  late AnimationController animationController;
  late Animation<Offset> listSlideAnimation;

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetUsersEvent());

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    listSlideAnimation = Tween(
      begin: Offset(-1, 1),
      end: Offset(0, 0),
    ).animate(animationController);

    animationController.forward();

    // _controller.addListener(() {
    //   if (_controller.position.pixels >=
    //       _controller.position.maxScrollExtent - 200) {
    //     context.read<HomeBloc>().add(GetUsersEvent());
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is SuccessState) {
          users.addAll(state.users);
        }
      },
      buildWhen: (prev, curr) =>
          curr is SuccessState || curr is LoadingState || curr is ErrorState,
      builder: (context, state) {
        if (state is SuccessState) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                await _buildNavigation(context);

                _buildPopUp(context);

                _buildSnackBar(context);
              },
            ),
            body: ListView.builder(
              controller: _controller,
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                final user = users[index];
                return SlideTransition(
                  position: listSlideAnimation,
                  child: ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.address?.geo?.lat ?? ""),
                    trailing: Text("Remove"),
                  ),
                );
              },
            ),
          );
        }
        if (state is ErrorState) {
          return Text("Error State");
        }
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }

  void _filteringSortingLogic() {
    List<User> filtered = users.where((user) {
      return user.name.contains('L');
    }).toList();

    users = filtered;

    users.sort((a, b) => b.id.compareTo(a.id));
  }

  Future<void> _buildNavigation(BuildContext context) async {
    final int? number = await Navigator.of(context).push<int>(
      MaterialPageRoute(
        builder: (BuildContext context) => const AnimationsScreen(),
      ),
    );

    print('number :: $number');
  }

  void _buildPopUp(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Text("Demo");
      },
    );
  }

  void _buildSnackBar(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);

    messenger
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('Demo'),
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 2),
          animation: CurvedAnimation(
            parent: AnimationController(
              vsync: Navigator.of(context),
              duration: const Duration(milliseconds: 300),
            ),
            curve: Curves.bounceInOut,
          ),
        ),
      );
  }

  Scaffold _formScreen() {
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

// body: Center(
//   child: Stack(
//     alignment: AlignmentDirectional.center,
//     clipBehavior: Clip.none,
//     children: [
//       Container(color: Colors.red, height: 300, width: 300),
//       Positioned(
//         top: -30,
//         child: Container(
//           color: Colors.yellow,
//           height: 200,
//           width: 200,
//         ),
//       ),
//       Container(color: Colors.green, height: 100, width: 100),
//       Positioned(
//         left: 30,
//         child: Container(
//           color: Colors.white,
//           height: 50,
//           width: 50,
//         ),
//       ),
//     ],
//   ),
// ),
