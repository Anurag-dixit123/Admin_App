// //
// // import 'dart:io';
// // import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';
// //
// // void main() {
// //   runApp(MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: BannerScreen(),
// //     );
// //   }
// // }
// //
// // class BannerScreen extends StatefulWidget {
// //   @override
// //   _BannerScreenState createState() => _BannerScreenState();
// // }
// //
// // class _BannerScreenState extends State<BannerScreen> {
// //   List<Item> items = [];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Center(child: Text('Item List')),
// //       ),
// //       body: Column(
// //         children: [
// //           ElevatedButton(
// //             onPressed: () {
// //               _showAddItemDialog(context);
// //             },
// //             style: ElevatedButton.styleFrom(
// //               backgroundColor: Colors.red,
// //
// //             ),
// //             child: Text('Add Item'),
// //           ),
// //           Expanded(
// //             child: ListView.builder(
// //               itemCount: items.length,
// //               itemBuilder: (context, index) {
// //                 return SingleChildScrollView(
// //                   child: Row(
// //                     children: [
// //                       Column(
// //                         children: [
// //                           Text(
// //                             items[index].title,
// //                             style: TextStyle(fontSize: 20),
// //                           ),
// //                           SizedBox(
// //                             height: 10,
// //                           ),
// //                           Container(
// //                             height: 300,
// //                             width: 200,
// //                             child: Image.file(
// //                               File(items[index].imagePath),
// //                             ),
// //                           ),
// //                           SizedBox(
// //                             height: 20,
// //                           ),
// //                         ],
// //                       )
// //                     ],
// //                   ),
// //                 );
// //
// //                 //   ListTile(
// //                 //   title: Text(items[index].title),
// //                 //   leading: Image.file(
// //                 //     File(items[index].imagePath),
// //                 //     width: 50.0,
// //                 //     height: 50.0,
// //                 //     fit: BoxFit.cover,
// //                 //   ),
// //                 // );
// //               },
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   void _showAddItemDialog(BuildContext context) async {
// //     TextEditingController titleController = TextEditingController();
// //     String? imagePath;
// //
// //     final picker = ImagePicker();
// //
// //     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
// //
// //     if (pickedFile != null) {
// //       imagePath = pickedFile.path;
// //     }
// //
// //     showDialog(
// //       context: context,
// //       builder: (context) {
// //         return AlertDialog(
// //           title: Text('Add Item'),
// //           content: Column(
// //             mainAxisSize: MainAxisSize.min,
// //             children: [
// //               TextField(
// //                 controller: titleController,
// //                 decoration: InputDecoration(labelText: 'Title'),
// //               ),
// //               SizedBox(height: 8.0),
// //               imagePath != null
// //                   ? Image.file(
// //                       File(imagePath),
// //                       width: 100.0,
// //                       height: 100.0,
// //                       fit: BoxFit.cover,
// //                     )
// //                   : SizedBox.shrink(),
// //               ElevatedButton(
// //                 onPressed: () {
// //                   setState(() {
// //                     items.add(Item(
// //                       title: titleController.text,
// //                       imagePath: imagePath ?? '',
// //                     ));
// //                   });
// //                   Navigator.pop(context);
// //                 },
// //                 child: Text('Add'),
// //               ),
// //             ],
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }
// //
// // class Item {
// //   final String title;
// //   final String imagePath;
// //
// //   Item({required this.title, required this.imagePath});
// // }
//
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: BannerScreen(),
//     );
//   }
// }
//
// class BannerScreen extends StatefulWidget {
//   @override
//   _BannerScreenState createState() => _BannerScreenState();
// }
//
// class _BannerScreenState extends State<BannerScreen> {
//   List<Item> items = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text('Item List')),
//       ),
//       body: Column(
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               _showAddItemDialog(context);
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.red,
//             ),
//             child: Text('Add Item'),
//           ),
//           Expanded(
//             child: GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2, // Set the number of columns in the grid
//               ),
//               itemCount: items.length,
//               itemBuilder: (context, index) {
//                 return ItemTile(item: items[index]);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _showAddItemDialog(BuildContext context) async {
//     TextEditingController titleController = TextEditingController();
//     String? imagePath;
//
//     final picker = ImagePicker();
//
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//
//     if (pickedFile != null) {
//       imagePath = pickedFile.path;
//     }
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Add Item'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: titleController,
//                 decoration: InputDecoration(labelText: 'Title'),
//               ),
//               SizedBox(height: 8.0),
//               imagePath != null
//                   ? Image.file(
//                 File(imagePath),
//                 width: 100.0,
//                 height: 100.0,
//                 fit: BoxFit.cover,
//               )
//                   : SizedBox.shrink(),
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     items.add(Item(
//                       title: titleController.text,
//                       imagePath: imagePath ?? '',
//                     ));
//                   });
//                   Navigator.pop(context);
//                 },
//                 child: Text('Add'),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
//
// class ItemTile extends StatelessWidget {
//   final Item item;
//
//   ItemTile({required this.item});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             Text(
//               item.title,
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               height: 200, // Adjust the height as needed
//               width: double.infinity,
//               child: Image.file(
//                 File(item.imagePath),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class Item {
//   final String title;
//   final String imagePath;
//
//   Item({required this.title, required this.imagePath});
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BannerScreen(),
    );
  }
}

class BannerScreen extends StatefulWidget {
  @override
  _BannerScreenState createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  List<Item> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Item List')),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _showAddItemDialog(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: Text('Add Banner List'),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ItemTile(
                  item: items[index],
                  onUpdate: () => _showUpdateItemDialog(context, index),
                  onRemove: () => _removeItem(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showAddItemDialog(BuildContext context) async {
    TextEditingController titleController = TextEditingController();
    String? imagePath;

    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imagePath = pickedFile.path;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              SizedBox(height: 8.0),
              imagePath != null
                  ? Image.file(
                File(imagePath),
                width: 100.0,
                height: 100.0,
              )
                  : SizedBox.shrink(),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    items.add(Item(
                      title: titleController.text,
                      imagePath: imagePath ?? '',
                    ));
                  });
                  Navigator.pop(context);
                },
                child: Text('Add'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showUpdateItemDialog(BuildContext context, int index) async {
    TextEditingController titleController = TextEditingController();
    titleController.text = items[index].title;
    String? imagePath = items[index].imagePath;

    final picker = ImagePicker();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Update Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              SizedBox(height: 8.0),
              imagePath != null
                  ? Container(
                height: 100.0,
                width: 100.0,
                child: Image.file(
                  File(imagePath!),
                  fit: BoxFit.cover,
                ),
              )
                  : SizedBox.shrink(),
              ElevatedButton(
                onPressed: () async {
                  final pickedFile =
                  await picker.pickImage(source: ImageSource.gallery);

                  if (pickedFile != null) {
                    setState(() {
                      imagePath = pickedFile.path;
                    });
                  }
                },
                child: Text('Change Image'),
              ),
              SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    items[index] = Item(
                      title: titleController.text,
                      imagePath: imagePath ?? '', // Use null-aware operator here
                    );
                  });
                  Navigator.pop(context);
                },
                child: Text('Update'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _removeItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }
}

class ItemTile extends StatelessWidget {
  final Item item;
  final VoidCallback onUpdate;
  final VoidCallback onRemove;

  ItemTile({
    required this.item,
    required this.onUpdate,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Ensure the column stretches horizontally

          children: [
            Center(
              child: Text(
                item.title,
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                child: Image.file(
                  File(item.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: onUpdate,
                  child: Text('Update'),
                ),
                ElevatedButton(
                  onPressed: onRemove,
                  child: Text('Remove'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Item {
  final String title;
  final String imagePath;

  Item({required this.title, required this.imagePath});
}
