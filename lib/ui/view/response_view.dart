import 'package:flutter/material.dart';
import 'package:interview/api/api.dart';
import 'package:interview/objects/todo_object.dart';
import 'package:interview/response/api_response.dart';

class ResponseView extends StatefulWidget {
  const ResponseView({Key? key}) : super(key: key);

  @override
  State<ResponseView> createState() => _ResponseViewState();
}

class _ResponseViewState extends State<ResponseView> {
  late bool _loading;
  late bool _isError;
  // String? _error;

  List<TodoObject> _todos = [];
  @override
  void initState() {
    super.initState();
    _loading = false;
    _isError = false;
    _getTask();
  }

  void _getTask() async {
    _loading = true;
    final _res = await Api().getTodos();
    setState(() {
      _loading = false;
      if (_res.error != null && _res.error!.isNotEmpty) {
        _isError = true;
        // _error = _res.error;
      } else {
        _todos = _res.todo;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Center(
            child: CircularProgressIndicator.adaptive(),
          )
        : _isError
            ? Center(
                child: TextButton.icon(
                  onPressed: _getTask,
                  icon: Icon(Icons.refresh),
                  label: Text("Retry"),
                ),
              )
            : ListView.builder(
                itemCount: _todos.length,
                itemBuilder: (_, i) => Card(
                  child: ListTile(
                    title: Text(_todos[i].title),
                    subtitle: Row(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Complete"),
                        Icon(
                          Icons.check_circle,
                          color:
                              _todos[i].completed ? Colors.green : Colors.grey,
                        )
                      ],
                    ),
                  ),
                ),
              );
  }
}
