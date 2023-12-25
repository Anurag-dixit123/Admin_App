//
// import 'dart:io';
// import 'package:admin_app/Api_codes.dart';
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
//             child: Text('Add Banner List'),
//           ),
//           Expanded(
//             child: GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//               ),
//               itemCount: items.length,
//               itemBuilder: (context, index) {
//                 return ItemTile(
//                   item: items[index],
//                   onUpdate: () => _showUpdateItemDialog(context, index),
//                   onRemove: () => _removeItem(index),
//                 );
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
//     bool isSubmitButtonEnabled() {
//       return titleController.text.isNotEmpty && imagePath != null;
//     }
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Add Item'),
//           content: StatefulBuilder(
//             builder: (BuildContext context, StateSetter setState) {
//               return Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   TextField(
//                     controller: titleController,
//                     onChanged: (value) {
//                       setState(() {});
//                     },
//                     decoration: InputDecoration(labelText: 'Title'),
//                   ),
//                   SizedBox(height: 8.0),
//                   imagePath != null
//                       ? Image.file(
//                     File(imagePath),
//                     width: 100.0,
//                     height: 100.0,
//                   )
//                       : SizedBox.shrink(),
//                   ElevatedButton(
//                     onPressed: isSubmitButtonEnabled()
//                         ? () async {
//                       setState(() {
//                         items.add(Item(
//                           title: titleController.text,
//                           imagePath: imagePath ?? '',
//                         ));
//                       });
//                       Navigator.pop(context);
//                       // Call your API here
//                       AddSliderImagesApiClass.makeApiRequest(imagePath ?? '');
//                     }
//                         : null,
//                     child: Text('Submit'),
//                   ),
//                 ],
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
//
//
//   void _showUpdateItemDialog(BuildContext context, int index) async {
//     TextEditingController titleController = TextEditingController();
//     titleController.text = items[index].title;
//     String? imagePath = items[index].imagePath;
//
//     final picker = ImagePicker();
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Update Item'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: titleController,
//                 decoration: InputDecoration(labelText: 'Title'),
//               ),
//               SizedBox(height: 8.0),
//               imagePath != null
//                   ? Container(
//                 height: 100.0,
//                 width: 100.0,
//                 child: Image.file(
//                   File(imagePath!),
//                   fit: BoxFit.cover,
//                 ),
//               )
//                   : SizedBox.shrink(),
//               ElevatedButton(
//                 onPressed: () async {
//                   final pickedFile =
//                   await picker.pickImage(source: ImageSource.gallery);
//
//                   if (pickedFile != null) {
//                     setState(() {
//                       imagePath = pickedFile.path;
//                     });
//                   }
//                 },
//                 child: Text('Change Image'),
//               ),
//               SizedBox(height: 8.0),
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     items[index] = Item(
//                       title: titleController.text,
//                       imagePath: imagePath ?? '', // Use null-aware operator here
//                     );
//                   });
//                   Navigator.pop(context);
//                 },
//                 child: Text('Update'),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   void _removeItem(int index) {
//     setState(() {
//       items.removeAt(index);
//     });
//   }
// }
//
// class ItemTile extends StatelessWidget {
//   final Item item;
//   final VoidCallback onUpdate;
//   final VoidCallback onRemove;
//
//   ItemTile({
//     required this.item,
//     required this.onUpdate,
//     required this.onRemove,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Container(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch, // Ensure the column stretches horizontally
//
//           children: [
//             Center(
//               child: Text(
//                 item.title,
//                 style: TextStyle(fontSize: 20),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Expanded(
//               child: Container(
//                 child: Image.file(
//                   File(item.imagePath),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 ElevatedButton(
//                   onPressed: onUpdate,
//                   child: Text('Update'),
//                 ),
//                 ElevatedButton(
//                   onPressed: onRemove,
//                   child: Text('Remove'),
//                 ),
//               ],
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
import 'package:admin_app/Api_codes.dart';
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
        return _AddItemDialog(
          titleController: titleController,
          imagePath: imagePath,
          onSubmit: () {
            setState(() {
              items.add(Item(
                title: titleController.text,
                imagePath: imagePath ?? '',
              ));
            });
            Navigator.pop(context);
          },
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
                      imagePath: imagePath ?? '',
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

class _AddItemDialog extends StatefulWidget {
  final TextEditingController titleController;
  final String? imagePath;
  final VoidCallback onSubmit;

  _AddItemDialog({
    required this.titleController,
    required this.imagePath,
    required this.onSubmit,
  });

  @override
  __AddItemDialogState createState() => __AddItemDialogState();
}

class __AddItemDialogState extends State<_AddItemDialog> {
  @override
  Widget build(BuildContext context) {
    bool isSubmitButtonEnabled() {
      return widget.titleController.text.isNotEmpty && widget.imagePath != null;
    }
    return AlertDialog(
      title: Text('Add Item'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: widget.titleController,
            onChanged: (value) {
              setState(() {});
            },
            decoration: InputDecoration(labelText: 'Title'),
          ),
          SizedBox(height: 8.0),
          widget.imagePath != null
              ? Image.file(
            File(widget.imagePath!),
            width: 100.0,
            height: 100.0,
          )
              : SizedBox.shrink(),
          ElevatedButton(
            onPressed: isSubmitButtonEnabled()
                ? () async {
              widget.onSubmit();
              // Call your API here
              await AddSliderImagesApiClass.makeApiRequest(widget.imagePath ?? '');
            }
                : null,
            child: Text('Submit'),
          ),
        ],
      ),
    );
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
