import 'package:flutter/material.dart';

import 'package:interview/objects/user_object.dart';

class DesignView extends StatefulWidget {
  const DesignView({
    Key? key,
    this.user,
  }) : super(key: key);
  final UserObject? user;

  @override
  State<DesignView> createState() => _DesignViewState();
}

class _DesignViewState extends State<DesignView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // if(widget.user!=null)
          SizedBox(height: 25),
          Center(
            child: CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.person,
                size: 100,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text("${widget.user?.name ?? "Not logged in"}"),
          SizedBox(height: 5),
          Text("${widget.user?.email ?? "Not logged in"}"),
          SizedBox(height: 5),
          Text("${widget.user?.phone ?? "Not logged in"}"),
          SizedBox(height: 20),
          Expanded(
            child: GridView(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              children: [
                Card(
                  child: GridTile(
                    child: Icon(
                      Icons.notifications,
                      size: 40,
                    ),
                  ),
                ),
                Card(
                  child: GridTile(
                    child: Icon(
                      Icons.settings,
                      size: 40,
                    ),
                  ),
                ),
                Card(
                  child: GridTile(
                    child: Icon(
                      Icons.info,
                      size: 40,
                    ),
                  ),
                ),
                Card(
                  child: GridTile(
                    child: Icon(
                      Icons.exit_to_app,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
