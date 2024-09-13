import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klontong_management/feature/domain/entity/category.dart';
import 'package:klontong_management/feature/presentation/bloc/klontong_category_bloc.dart';
import 'package:klontong_management/feature/presentation/bloc/klontong_category_event.dart';
import 'package:klontong_management/feature/presentation/bloc/klontong_category_state.dart';
import 'package:klontong_management/feature/presentation/bloc/klontong_product_bloc.dart';
import 'package:klontong_management/feature/presentation/bloc/klontong_product_event.dart';
import 'package:klontong_management/feature/presentation/bloc/klontong_product_list_bloc.dart';
import 'package:klontong_management/feature/presentation/bloc/klontong_product_list_event.dart';
import 'package:klontong_management/feature/presentation/bloc/klontong_product_state.dart'
    as productState;

class DetailScreen extends StatefulWidget {
  final String id;
  const DetailScreen({super.key, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _skuController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _widthController = TextEditingController();
  final TextEditingController _lengthController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();

  KlontongCategory? _selectedCategory;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<KlontongProductBloc>(context)
        .add(GetKlontongProductById(widget.id));
  }

  @override
  void dispose() {
    _skuController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    _weightController.dispose();
    _widthController.dispose();
    _lengthController.dispose();
    _heightController.dispose();
    _imageController.dispose();
    _hargaController.dispose();
    super.dispose();
  }

  // Function to create new category
  void _createNewCategory() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final TextEditingController newCategoryNameController =
            TextEditingController();

        return AlertDialog(
          title: const Text('Create New Category'),
          content: TextFormField(
            controller: newCategoryNameController,
            decoration: const InputDecoration(labelText: 'Category Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Category Name';
              }
              return null;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (newCategoryNameController.text.isNotEmpty) {
                  BlocProvider.of<KlontongCategoryBloc>(context).add(
                      CreateKlontongCategory(newCategoryNameController.text));

                  Navigator.of(context).pop();
                }
              },
              child: const Text('Create'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Klontong Management System"),
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<KlontongProductBloc>(context)
                    .add(DeleteKlontongProduct(widget.id));
                Navigator.pop(context);
              },
              icon: const Icon(Icons.delete))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.all(20),
        child: TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                BlocProvider.of<KlontongProductListBloc>(context).add(
                  CreateKlontongProduct(
                    categoryId: _selectedCategory?.id ?? "",
                    categoryName: _selectedCategory?.categoryName ?? "",
                    sku: _skuController.text,
                    name: _nameController.text,
                    description: _descriptionController.text,
                    weight: double.parse(_weightController.text),
                    width: double.parse(_widthController.text),
                    length: double.parse(_lengthController.text),
                    height: double.parse(_heightController.text),
                    image: _imageController.text,
                    harga: double.parse(_hargaController.text),
                  ),
                );

                Navigator.of(context).pop();
              }
            },
            child: const Text("Save")),
      ),
      body: BlocBuilder<KlontongProductBloc, productState.KlontongProductState>(
          builder: (context, state) {
        if (state is productState.Loaded) {
          _skuController.text = state.product.sku;
          _nameController.text = state.product.name;
          _descriptionController.text = state.product.description;
          _weightController.text = state.product.weight.toString();
          _widthController.text = state.product.width.toString();
          _lengthController.text = state.product.length.toString();
          _heightController.text = state.product.height.toString();
          _imageController.text = state.product.image;
          _hargaController.text = state.product.harga.toString();
          setState(() {
            _selectedCategory = KlontongCategory(
                id: state.product.categoryId,
                categoryName: state.product.categoryName);
          });
        }
        return SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocBuilder<KlontongCategoryBloc, KlontongCategoryState>(
                  builder: (context, state) {
                    // Category Dropdown
                    return DropdownButtonFormField<KlontongCategory>(
                      value: _selectedCategory,
                      hint: const Text('Select Category'),
                      onChanged: (value) {
                        if (value != null && value.id == "create") {
                          _createNewCategory();
                        } else {
                          setState(() {
                            _selectedCategory = value;
                          });
                        }
                      },
                      items: [
                        if (state is Loaded)
                          ...state.category.map((category) {
                            return DropdownMenuItem(
                              value: category,
                              child: Text(category.categoryName),
                            );
                          }),
                        const DropdownMenuItem(
                          value:
                              KlontongCategory(id: "create", categoryName: ""),
                          child: Text('Create New Category'),
                        ),
                      ],
                      validator: (value) =>
                          value == null ? 'Please select a category' : null,
                    );
                  },
                ),

                // SKU Field
                TextFormField(
                  controller: _skuController,
                  decoration: const InputDecoration(labelText: 'SKU'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter SKU';
                    }
                    return null;
                  },
                ),
                // Name Field
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Name';
                    }
                    return null;
                  },
                ),
                // Description Field
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Description';
                    }
                    return null;
                  },
                ),
                // Weight Field
                TextFormField(
                  controller: _weightController,
                  decoration: const InputDecoration(labelText: 'Weight'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Weight';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                // Width Field
                TextFormField(
                  controller: _widthController,
                  decoration: const InputDecoration(labelText: 'Width'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Width';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                // Length Field
                TextFormField(
                  controller: _lengthController,
                  decoration: const InputDecoration(labelText: 'Length'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Length';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                // Height Field
                TextFormField(
                  controller: _heightController,
                  decoration: const InputDecoration(labelText: 'Height'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Height';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                // Image URL Field
                TextFormField(
                  controller: _imageController,
                  decoration: const InputDecoration(labelText: 'Image URL'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Image URL';
                    }
                    return null;
                  },
                ),
                // Price (Harga) Field
                TextFormField(
                  controller: _hargaController,
                  decoration: const InputDecoration(labelText: 'Price (Harga)'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Price';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid integer';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
