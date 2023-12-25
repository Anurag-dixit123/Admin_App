//
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// void main() {
//   runApp(MyApp());
//
// }
//
// class Product {
//   String name;
//   double price;
//   double offerPrice;
//   String size;
//   String brand;
//   String category;
//   String image;
//
//   Product({
//     required this.name,
//     required this.price,
//     required this.offerPrice,
//     required this.size,
//     required this.brand,
//     required this.category,
//     required this.image,
//   });
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: AddProductScreen(),
//     );
//   }
// }
//
// class AddProductScreen extends StatefulWidget {
//   @override
//   _AddProductScreenState createState() => _AddProductScreenState();
// }
//
// class _AddProductScreenState extends State<AddProductScreen> {
//   List<Product> products = [];
//   TextEditingController nameController = TextEditingController();
//   TextEditingController priceController = TextEditingController();
//   TextEditingController offerPriceController = TextEditingController();
//   TextEditingController sizeController = TextEditingController();
//   String? selectedBrand;
//   String? selectedCategory;
//   String? imagePath;
//
//   bool isSubmitButtonEnabled() {
//     return nameController.text.isNotEmpty &&
//         priceController.text.isNotEmpty &&
//         offerPriceController.text.isNotEmpty &&
//         sizeController.text.isNotEmpty &&
//         selectedBrand != null &&
//         selectedCategory != null &&
//         imagePath != null &&
//         imagePath!.isNotEmpty;
//   }
//
//   Future<void> _showImagePickerDialog() async {
//     final ImagePicker _picker = ImagePicker();
//
//     final XFile? pickedFile =
//     await _picker.pickImage(source: ImageSource.gallery);
//
//     if (pickedFile != null) {
//       setState(() {
//         imagePath = pickedFile.path;
//       });
//     }
//   }
//
//   void _showAddProductPopup() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return StatefulBuilder(
//           builder: (BuildContext context, StateSetter setState) {
//             return AlertDialog(
//               title: Center(child: Text('Enter Product Details')),
//               content: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     // Dropdown for Brand
//                     DropdownButton<String>(
//                       value: selectedBrand,
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           selectedBrand = newValue;
//                         });
//                       },
//                       items: ['Brand A', 'Brand B', 'Brand C', 'Brand D',]
//                           .map<DropdownMenuItem<String>>(
//                             (String value) {
//                           return DropdownMenuItem<String>(
//                             value: value,
//                             child: Text(value),
//                           );
//                         },
//                       ).toList(),
//                       hint: Text('Select Brand'),
//                     ),
//
//                     // Dropdown for Category
//                     DropdownButton<String>(
//                       value: selectedCategory,
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           selectedCategory = newValue;
//                         });
//                       },
//                       items: ['Category V', 'Category X', 'Category Y', 'Category Z']
//                           .map<DropdownMenuItem<String>>(
//                             (String value) {
//                           return DropdownMenuItem<String>(
//                             value: value,
//                             child: Text(value),
//                           );
//                         },
//                       ).toList(),
//                       hint: Text('Select Category'),
//                     ),
//
//                     TextField(
//                       controller: nameController,
//                       decoration: InputDecoration(labelText: 'Product Name'),
//                     ),
//                     TextField(
//                       controller: priceController,
//                       decoration: InputDecoration(labelText: 'Price'),
//                       keyboardType: TextInputType.number,
//                     ),
//                     TextField(
//                       controller: offerPriceController,
//                       decoration: InputDecoration(labelText: 'Offer Price'),
//                       keyboardType: TextInputType.number,
//                     ),
//                     TextField(
//                       controller: sizeController,
//                       decoration: InputDecoration(labelText: 'Product Size'),
//                     ),
//
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Text(
//                       ' * Please choose image after filling above details',
//                       style: TextStyle(color: Colors.red),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                       height: 100,
//                       width: 100,
//                       child: (imagePath != null)
//                           ? Image.file(
//                         File(imagePath!),
//                         height: 100,
//                         width: 100,
//                         fit: BoxFit.cover,
//                       )
//                           : ElevatedButton(
//                         onPressed: () async {
//                           await _showImagePickerDialog();
//                           setState(() {});
//                         },
//                         child: Text('Choose Image'),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               actions: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: Text('Cancel'),
//                 ),
//                 SizedBox(
//                   width: 80,
//                 ),
//                 ElevatedButton(
//                   onPressed: isSubmitButtonEnabled() ? _submitProduct : null,
//                   child: Text('Submit'),
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     ).then((_) {
//       setState(() {
//         selectedBrand = null;
//         selectedCategory = null;
//         imagePath = null;
//       });
//     });
//   }
//
//   void _submitProduct() {
//     if (isSubmitButtonEnabled()) {
//       int serialNumber = products.length + 1;
//
//       Product newProduct = Product(
//         name: nameController.text,
//         price: double.parse(priceController.text),
//         offerPrice: double.parse(offerPriceController.text),
//         size: sizeController.text,
//         brand: selectedBrand!,
//         category: selectedCategory!,
//         image: imagePath!,
//       );
//
//       products.add(newProduct);
//
//       nameController.clear();
//       priceController.clear();
//       offerPriceController.clear();
//       sizeController.clear();
//
//       Navigator.of(context).pop();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Product'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ElevatedButton(
//               onPressed: _showAddProductPopup,
//               child: Center(child: Text('Add Product')),
//             ),
//             SizedBox(height: 20),
//             Text('Product List:'),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: products.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text('${index + 1}. ${products[index].name}'),
//                     subtitle: Text('Price: ${products[index].price}'),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:admin_app/Api_codes.dart';
void main() {
  runApp(MyApp());
}

class Product {
  String name;
  double price;
  double offerPrice;
  String size;
  String brand;
  String category;
  String image;

  Product({
    required this.name,
    required this.price,
    required this.offerPrice,
    required this.size,
    required this.brand,
    required this.category,
    required this.image,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddProductScreen(),
    );
  }
}

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  List<Product> products = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController offerPriceController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  String? selectedBrand;
  String? selectedCategory;
  String? imagePath;

  List<String> brandOptions = ['Brand A', 'Brand B', 'Brand C', 'Brand D'];
  Map<String, List<String>> categoryOptions = {
    'Brand A': ['Category V', 'Category W'],
    'Brand B': ['Category X', 'Category Y'],
    'Brand C': ['Category Z', 'Category Z1'],
    'Brand D': ['Category Z2', 'Category Z3'],
  };

  bool isSubmitButtonEnabled() {
    return nameController.text.isNotEmpty &&
        priceController.text.isNotEmpty &&
        offerPriceController.text.isNotEmpty &&
        sizeController.text.isNotEmpty &&
        selectedBrand != null &&
        selectedCategory != null &&
        imagePath != null &&
        imagePath!.isNotEmpty;
  }

  Future<void> _showImagePickerDialog() async {
    final ImagePicker _picker = ImagePicker();

    final XFile? pickedFile =
    await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imagePath = pickedFile.path;
      });
    }
  }

  void _showOptionsListView(List<String> options, String title,
      Function(String) onSelect) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: options.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(options[index]),
              onTap: () {
                onSelect(options[index]);
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }

  void _showBrandOptions() {
    _showOptionsListView(brandOptions, 'Select Brand', (String selectedBrand) {
      setState(() {
        this.selectedBrand = selectedBrand;
        // Clear selected category when brand changes
        selectedCategory = null;
      });
    });
  }

  void _showCategoryOptions() {
    if (selectedBrand != null) {
      _showOptionsListView(
          categoryOptions[selectedBrand!] ?? [], 'Select Category',
              (String selectedCategory) {
            setState(() {
              this.selectedCategory = selectedCategory;
            });
          });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please select a brand first.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void _showAddProductPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Center(child: Text('Enter Product Details')),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    // Dropdown for Brand
                    DropdownButton<String>(
                      value: selectedBrand,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedBrand = newValue;
                          // Clear selected category when brand changes
                          selectedCategory = null;
                        });
                      },
                      items: brandOptions
                          .map<DropdownMenuItem<String>>(
                            (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        },
                      ).toList(),
                      hint: Text('Select Brand'),
                    ),

                    // Dropdown for Category
                    DropdownButton<String>(
                      value: selectedCategory,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCategory = newValue;
                        });
                      },
                      items: categoryOptions[selectedBrand ?? '']
                          ?.map<DropdownMenuItem<String>>(
                            (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        },
                      )
                          .toList() ??
                          [],
                      hint: Text('Select Category'),
                    ),

                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(labelText: 'Product Name'),
                    ),
                    TextField(
                      controller: priceController,
                      decoration: InputDecoration(labelText: 'Price'),
                      keyboardType: TextInputType.number,
                    ),
                    TextField(
                      controller: offerPriceController,
                      decoration: InputDecoration(labelText: 'Offer Price'),
                      keyboardType: TextInputType.number,
                    ),
                    TextField(
                      controller: sizeController,
                      decoration: InputDecoration(labelText: 'Product Size'),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      ' * Please choose image after filling above details',
                      style: TextStyle(color: Colors.red),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      child: (imagePath != null)
                          ? Image.file(
                        File(imagePath!),
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      )
                          : ElevatedButton(
                        onPressed: () async {
                          await _showImagePickerDialog();
                          setState(() {});
                        },
                        child: Text('Choose Image'),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                SizedBox(
                  width: 80,
                ),
                ElevatedButton(
                  onPressed: isSubmitButtonEnabled() ? _submitProduct : null,
                  child: Text('Submit'),
                ),
              ],
            );
          },
        );
      },
    ).then((_) {
      setState(() {
        selectedBrand = null;
        selectedCategory = null;
        imagePath = null;
      });
    });
  }

  void _submitProduct() async {
    if (isSubmitButtonEnabled()) {
      Product newProduct = Product(
        name: nameController.text,
        price: double.parse(priceController.text),
        offerPrice: double.parse(offerPriceController.text),
        size: sizeController.text,
        brand: selectedBrand!,
        category: selectedCategory!,
        image: imagePath!,
      );

      // Call the API to add the product
      await AddProductApiClass.makeApiRequest(imagePath!);

      // Add the product to the local list
      products.add(newProduct);

      // Clear the form fields
      nameController.clear();
      priceController.clear();
      offerPriceController.clear();
      sizeController.clear();

      // Clear the selected options
      selectedBrand = null;
      selectedCategory = null;
      imagePath = null;

      // Close the popup
      Navigator.of(context).pop();
    }
  }

  void _editProduct(int index) {
    Product editedProduct = products[index];
    nameController.text = editedProduct.name;
    priceController.text = editedProduct.price.toString();
    offerPriceController.text = editedProduct.offerPrice.toString();
    sizeController.text = editedProduct.size;
    selectedBrand = editedProduct.brand;
    selectedCategory = editedProduct.category;
    imagePath = editedProduct.image;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Center(child: Text('Edit Product Details')),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    // Dropdown for Brand
                    DropdownButton<String>(
                      value: selectedBrand,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedBrand = newValue;
                          // Clear selected category when brand changes
                          selectedCategory = null;
                        });
                      },
                      items: brandOptions
                          .map<DropdownMenuItem<String>>(
                            (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        },
                      ).toList(),
                      hint: Text('Select Brand'),
                    ),

                    // Dropdown for Category
                    DropdownButton<String>(
                      value: selectedCategory,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCategory = newValue;
                        });
                      },
                      items: categoryOptions[selectedBrand ?? '']
                          ?.map<DropdownMenuItem<String>>(
                            (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        },
                      )
                          .toList() ??
                          [],
                      hint: Text('Select Category'),
                    ),

                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(labelText: 'Product Name'),
                    ),
                    TextField(
                      controller: priceController,
                      decoration: InputDecoration(labelText: 'Price'),
                      keyboardType: TextInputType.number,
                    ),
                    TextField(
                      controller: offerPriceController,
                      decoration: InputDecoration(labelText: 'Offer Price'),
                      keyboardType: TextInputType.number,
                    ),
                    TextField(
                      controller: sizeController,
                      decoration: InputDecoration(labelText: 'Product Size'),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      ' * Please choose image after filling above details',
                      style: TextStyle(color: Colors.red),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      child: (imagePath != null)
                          ? Image.file(
                        File(imagePath!),
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      )
                          : ElevatedButton(
                        onPressed: () async {
                          await _showImagePickerDialog();
                          setState(() {});
                        },
                        child: Text('Choose Image'),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await _showImagePickerDialog();
                        setState(() {});
                      },
                      child: Text('Change Image'),
                    ),
                  ],
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                SizedBox(
                  width: 80,
                ),
                ElevatedButton(
                  onPressed: () {
                    _updateProduct(index);
                  },
                  child: Text('Update'),
                ),
              ],
            );
          },
        );
      },
    );
  }


  void _updateProduct(int index) {
      Product updatedProduct = Product(
        name: nameController.text,
        price: double.parse(priceController.text),
        offerPrice: double.parse(offerPriceController.text),
        size: sizeController.text,
        brand: selectedBrand!,
        category: selectedCategory!,
        image: imagePath!,
      );

      // Update the product in the list
      setState(() {
        products[index] = updatedProduct;
      });

      nameController.clear();
      priceController.clear();
      offerPriceController.clear();
      sizeController.clear();
      selectedBrand = null;
      selectedCategory = null;
      imagePath = null;

      Navigator.of(context).pop();

  }


  void _deleteProduct(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text('Are you sure you want to delete this product?'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _confirmDeleteProduct(index);
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _confirmDeleteProduct(int index) {
    setState(() {
      products.removeAt(index);
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Add Product')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: _showAddProductPopup,
              child: Center(child: Text('Add Product')),
            ),
            SizedBox(height: 20),
            Text('Product List:'),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(' ${index + 1}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Name: ${products[index].name}'),
                          Text('Price: ${products[index].price}'),
                          Text('Offer Price: ${products[index].offerPrice}'),
                          Text('Size: ${products[index].size}'),
                          Text('Brand: ${products[index].brand}'),
                          Text('Category: ${products[index].category}'),
                        ],
                      ),
                      leading: Image.file(
                        File(products[index].image),
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              _editProduct(index);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _deleteProduct(index);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
