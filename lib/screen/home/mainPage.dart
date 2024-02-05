import 'package:app_todo_list/screen/login/login.dart';
import 'package:app_todo_list/widget/perfil.dart';
import 'package:flutter/material.dart';

const data = [
  {
    "id": 1,
    "title": "Tarea 1",
    "description": "Descripcion de la tarea 1",
    "done": false
  },
  {
    "id": 2,
    "title": "Tarea 2",
    "description": "Descripcion de la tarea 2",
    "done": false
  },
  {
    "id": 3,
    "title": "Tarea 3",
    "description": "Descripcion de la tarea 3 ",
    "done": false
  },
  {
    "id": 4,
    "title": "Tarea 4",
    "description": "Descripcion de la tarea 4",
    "done": false
  },
  {
    "id": 5,
    "title": "Tarea 5",
    "description": "Descripcion de la tarea 5",
    "done": false
  },
  {
    "id": 6,
    "title": "Tarea 6",
    "description": "Descripcion de la tarea 6",
    "done": false
  },
  {
    "id": 7,
    "title": "Tarea 7",
    "description": "Descripcion de la tarea 7",
    "done": false
  },
  {
    "id": 8,
    "title": "Tarea 8",
    "description": "Descripcion de la tarea 8",
    "done": false
  },
  {
    "id": 9,
    "title": "Tarea 9",
    "description": "Descripcion de la tarea 9",
    "done": false
  },
  {
    "id": 10,
    "title": "Tarea 10",
    "description": "Descripcion de la tarea 10",
    "done": false
  },
  {
    "id": 11,
    "title": "Tarea 11",
    "description": "Descripcion de la tarea 11",
    "done": false
  },
  {
    "id": 12,
    "title": "Tarea 12",
    "description": "Descripcion de la tarea 12",
    "done": false
  },
];

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  Future obteniendoDatos() async {
    final tareas = await Future.delayed(const Duration(seconds: 2), () => data);
    return tareas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.menu),
            offset: const Offset(0, -40), // Adjust this value as needed
            onSelected: (value) {
              if (value == 'Perfil') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PerfilScreen()));
              } else if (value == 'Cerrar sesión') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Perfil',
                child: Text('Perfil'),
              ),
              const PopupMenuItem<String>(
                value: 'Cerrar sesión',
                child: Text('Cerrar sesión'),
              ),
            ],
          ),
        ],
        title: const Text(
          'Tareas',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor:
            const Color.fromARGB(255, 128, 186, 186).withOpacity(0.5),
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Opacity(
              opacity: 0.2,
              child: Image.asset(
                'assets/img/splash.png', // replace with your image path
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
              ),
            ),
            FutureBuilder(
              future: obteniendoDatos(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          title: Text(snapshot.data[index]['title'] ?? ''),
                          subtitle:
                              Text(snapshot.data[index]['description'] ?? ''),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(
                                  snapshot.data[index]['done']
                                      ? Icons.check_box
                                      : Icons.check_box_outline_blank,
                                  color: snapshot.data[index]['done']
                                      ? Colors.green
                                      : null,
                                ),
                                onPressed: () {
                                  // setState(() {
                                  //   data[index]['done'] = !snapshot.data[index]['done'];
                                  // });
                                },
                              ),
                              PopupMenuButton<String>(
                                offset: const Offset(
                                    0, -40), // Adjust this value as needed
                                onSelected: (value) {
                                  if (value == 'Editar') {
                                    // Implementar lógica de edición
                                  } else if (value == 'Eliminar') {
                                    // Implementar lógica de eliminación
                                  }
                                },
                                itemBuilder: (BuildContext context) =>
                                    <PopupMenuEntry<String>>[
                                  const PopupMenuItem<String>(
                                    value: 'Editar',
                                    child: Text('Editar'),
                                  ),
                                  const PopupMenuItem<String>(
                                    value: 'Eliminar',
                                    child: Text('Eliminar'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.white,
                title: const Text('Agregar nueva tarea'),
                content: const TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Tarea',
                    labelStyle:
                        TextStyle(color: Colors.black), // Color del label
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ), // Color del texto
                  // Guardar el valor del TextField
                  // Puedes usar un TextEditingController para esto
                ),
                actions: [
                  TextButton(
                    child: const Text('Cancelar',
                        style:
                            TextStyle(color: Colors.black)), // Color del texto
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('Agregar',
                        style:
                            TextStyle(color: Colors.black)), // Color del texto
                    onPressed: () {
                      // Implementar lógica para agregar la tarea
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        backgroundColor: const Color.fromARGB(255, 128, 186, 186),
        child: const Icon(Icons.add),
      ),
    );
  }
}
