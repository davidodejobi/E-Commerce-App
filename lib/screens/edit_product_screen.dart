import 'package:flutter/material.dart';

import '/widgets/widgets.dart';
import '../constant.dart';
import '../models/models.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({Key? key}) : super(key: key);

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _imageUrlController = TextEditingController();
  final _imageFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editedProduct = Product(
    id: DateTime.now().toString(),
    title: '',
    price: 0,
    description: '',
    imageUrl: '',
  );

  @override
  void dispose() {
    _imageUrlController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _imageFocusNode.addListener(() {
      _updateImageUrl();
    });
    super.initState();
  }

  void _updateImageUrl() {
    if (!_imageFocusNode.hasFocus) {
      setState(() {});
    }
  }

  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    print(_editedProduct.title);
    print(_editedProduct.description);
    print(_editedProduct.price);
    print(_editedProduct.imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
          ),
          child: Column(
            children: [
              const PopCustomAppBar(
                title: Text('Your Products'),
                leading: SizedBox(),
              ),
              Form(
                key: _form,
                child: Expanded(
                  child: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Product Title',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(height: kDefaultPadding / 2),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter Product Title',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.shade800,
                                  width: 1,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            cursorColor: Colors.black,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            onFieldSubmitted: (_) {},
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a title';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _editedProduct = Product(
                                id: _editedProduct.id,
                                title: value,
                                description: _editedProduct.description,
                                price: _editedProduct.price,
                                imageUrl: _editedProduct.imageUrl,
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: kDefaultPadding),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Product Price',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(height: kDefaultPadding / 2),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter Product Price',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.shade800,
                                  width: 1,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {},
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please provide a price.';
                              }
                              if (double.tryParse(value) == null) {
                                return 'Please enter a valid number.';
                              }
                              if (double.parse(value) <= 0) {
                                return 'Please enter a number greater than zero.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _editedProduct = Product(
                                id: _editedProduct.id,
                                title: _editedProduct.title,
                                description: _editedProduct.description,
                                price: double.parse(value!),
                                imageUrl: _editedProduct.imageUrl,
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: kDefaultPadding),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Product Description',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(height: kDefaultPadding / 2),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter Product Description',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.shade800,
                                  width: 1,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            cursorColor: Colors.black,
                            maxLines: 3,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {},
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please provide a description.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _editedProduct = Product(
                                id: _editedProduct.id,
                                title: _editedProduct.title,
                                description: value,
                                price: _editedProduct.price,
                                imageUrl: _editedProduct.imageUrl,
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: kDefaultPadding),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Product Image Url',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(height: kDefaultPadding / 2),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: _imageUrlController.text.isEmpty
                                    ? const Center(
                                        child: Text(
                                          'Enter Image Url',
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      )
                                    : Image.network(
                                        _imageUrlController.text,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                              const SizedBox(
                                width: kDefaultPadding,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: _imageUrlController,
                                  decoration: InputDecoration(
                                    hintText: 'Enter Product Image Url',
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  focusNode: _imageFocusNode,
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.url,
                                  textInputAction: TextInputAction.next,
                                  onFieldSubmitted: (_) {
                                    _saveForm();
                                    setState(() {});
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please provide a image url.';
                                    }
                                    if (!value.startsWith('http') &&
                                        !value.startsWith('https')) {
                                      return 'Please provide a valid image url.';
                                    }
                                    if (!value.endsWith('.png') &&
                                        !value.endsWith('.jpg') &&
                                        !value.endsWith('.jpeg')) {
                                      return 'Please provide a valid image url.';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _editedProduct = Product(
                                      id: _editedProduct.id,
                                      title: _editedProduct.title,
                                      description: _editedProduct.description,
                                      price: _editedProduct.price,
                                      imageUrl: value,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: kDefaultPadding),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  _saveForm();
                },
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding,
                  ),
                  decoration: BoxDecoration(
                    gradient: kDefaultGradient,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Done',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: kDefaultPadding),
            ],
          ),
        ),
      ),
    );
  }
}
