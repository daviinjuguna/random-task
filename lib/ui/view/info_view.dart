import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:interview/objects/user_object.dart';
import 'package:interview/routes/app_router.dart';
import 'package:interview/ui/view/design_view.dart';

class InfoView extends StatefulWidget {
  const InfoView({Key? key}) : super(key: key);

  @override
  State<InfoView> createState() => _InfoViewState();
}

const EMAIL_REGEX =
    r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
const NAME_REGEX = r"^[a-zA-Z]{2,30}$";
const PHONE_REGEX = r'^0(6|7|1)[0-9]{8}$';

class _InfoViewState extends State<InfoView> {
  late final _nameController = TextEditingController();
  late final _emailController = TextEditingController();
  late final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
  }

  void _login() {
    if (_formKey.currentState?.validate() == true) {
      print("Valid");
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            duration: Duration(seconds: 3),
            backgroundColor: Theme.of(context).colorScheme.primary,
            content: Container(
              // clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "LOADING",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Please wait...",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      )
                    ],
                  ),
                  CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation(
                      Theme.of(context).colorScheme.onPrimary,
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
            ),
          ),
        );
      Future.delayed(Duration(seconds: 3), () {
        context.tabsRouter.navigate(DesignViewRoute(
            user: UserObject(
          name: _nameController.text.trim(),
          email: _emailController.text.trim(),
          phone: _phoneController.text.trim(),
        )));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "WELCOME",
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter your information to create account",
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              TextFormField(
                validator: (value) {
                  if (!RegExp(NAME_REGEX).hasMatch(value!.trim()))
                    return "name must be valid";

                  if (value.isEmpty) return "first name required";
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _nameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "Name", hintText: "Enter your name",
                  // prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                validator: (value) {
                  if (!RegExp(EMAIL_REGEX)
                      .hasMatch(value!.trim().toLowerCase()))
                    return "email must be valid";
                  if (value.isEmpty) return "email is required";
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email", hintText: "Enter your email",
                  // prefixIcon: Icon(Icons.mail),
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                validator: (value) {
                  if (!RegExp(PHONE_REGEX)
                      .hasMatch((value!.trim().toLowerCase())))
                    return "phone number must be valid";

                  if (value.isEmpty) return "number required";
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                onFieldSubmitted: (value) {
                  _login();
                },
                decoration: InputDecoration(
                  labelText: "Phone",
                  hintText: "07...",
                ),
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: _login,
                  child: Text("SUBMIT"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
