import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/widgets/widgets.dart';
import '../constant.dart';
import '../provider/provider.dart';

class EditProductScreen extends StatefulWidget {
  final String? id;
  final bool? isFavorite;

  const EditProductScreen({
    this.id,
    this.isFavorite,
    Key? key,
  }) : super(key: key);

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _imageUrlController = TextEditingController();
  final _imageFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editedProduct = Product(
    id: null,
    title: '',
    price: 0,
    description: '',
    imageUrl: '',
  );
  bool _isLoading = false;

  var _initValues = {
    'id': '',
    'title': '',
    'description': '',
    'price': '',
    'imageUrl': '',
    'categories': Category,
  };

  SubCategory? _selectedCategory;

  @override
  void dispose() {
    _imageUrlController.dispose();
    super.dispose();
  }

  /// this method is called before build is excecuted like initState but it
  /// it checks if the id is null or not
  /// if it is null then it will set the state of the product to the edited product
  /// if it is not null then it will set the state of the product to the product with the id
  /// it also sets the selected category to the category of the product
  /// it also sets the image url to the image url of the product

  // @override
  // void didChangeDependencies() {
  //   if (widget.id != null) {
  //     _editedProduct =
  //         Provider.of<Products>(context, listen: false).findById(widget.id!);
  //     _imageUrlController.text = _editedProduct.imageUrl!;
  //     _selectedCategory = _editedProduct.subCategory;
  //   }
  //   super.didChangeDependencies();
  // }

  @override
  void initState() {
    if (widget.id != null) {
      _editedProduct =
          Provider.of<Products>(context, listen: false).findById(widget.id!);
      _initValues = {
        'id': _editedProduct.id!,
        'title': _editedProduct.title!,
        'description': _editedProduct.description!,
        'price': _editedProduct.price.toString(),
        'imageUrl': '',
      };
      _imageUrlController.text = _editedProduct.imageUrl!;
      _selectedCategory = _editedProduct.subCategory;
    }
    _imageFocusNode.addListener(() {
      _updateImageUrl();
    });
    super.initState();
  }

  void _updateImageUrl() {
    if (!_imageFocusNode.hasFocus) {
      if ((!_imageUrlController.text.startsWith('http') &&
              !_imageUrlController.text.startsWith('https')) ||
          (!_imageUrlController.text.endsWith('.png') &&
              !_imageUrlController.text.endsWith('.jpg') &&
              !_imageUrlController.text.endsWith('.jpeg'))) {
        return;
      }
      setState(() {});
    }
  }

  Future<void> _saveForm() async {
    setState(() {
      _isLoading = true;
    });
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    if (_editedProduct.id != null) {
      await Provider.of<Products>(context, listen: false).updateProduct(
          _editedProduct.id!,
          _editedProduct,
          _selectedCategory!,
          widget.isFavorite!);
    } else {
      try {
        await Provider.of<Products>(context, listen: false)
            .addProduct(_editedProduct, _selectedCategory!);
      } catch (error) {
        // ignore: prefer_void_to_null
        await showDialog<Null>(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: const Text('An error occured'),
                  content: const Text('Something went wrong'),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Okay'),
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                    )
                  ],
                ));
      }
      // finally {
      //   setState(() {
      //     _isLoading = false;
      //   });
      //   Navigator.of(context).pop();
      // }
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
  }

  /*
   void _saveForm() {
    setState(() {
      _isLoading = true;
    });
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    if (_editedProduct.id != null) {
      Provider.of<Products>(context, listen: false).updateProduct(
          _editedProduct.id!,
          _editedProduct,
          _selectedCategory!,
          widget.isFavorite!);
      setState(() {
        _isLoading = false;
      });
      Navigator.of(context).pop();
    } else {
      Provider.of<Products>(context, listen: false)
          .addProduct(_editedProduct, _selectedCategory!)
          .catchError((error) {
        return showDialog<Null>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('An error occured'),
            content: const Text('Something went wrong'),
            actions: <Widget>[
              TextButton(
                child: const Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
        );
      }).then((_) => {
                setState(() {
                  _isLoading = false;
                }),
                Navigator.of(context).pop(),
              });
    }
  }
  */

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
              PopCustomAppBar(
                icon: Icons.arrow_back_ios_rounded,
                onPressed: () {
                  Navigator.pop(context);
                },
                title: const Text('Your Products'),
                leading: const SizedBox(
                  height: 30,
                  width: 30,
                ),
              ),
              _isLoading
                  ? const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Form(
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
                                  initialValue: _initValues['title'] as String,
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
                                      isFavorite: _editedProduct.isFavorite,
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
                                  initialValue: _initValues['price'] as String,
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
                                      isFavorite: _editedProduct.isFavorite,
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
                                  initialValue:
                                      _initValues['description'] as String,
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
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please provide a description.';
                                    }
                                    if (value.length < 20) {
                                      return 'Should be at least 20 characters long.';
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
                                      isFavorite: _editedProduct.isFavorite,
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
                                  'Product Category',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                const SizedBox(height: kDefaultPadding / 2),
                                Wrap(
                                  spacing: 10.0,
                                  children: [
                                    ChoiceChip(
                                      selectedColor: kPrimaryColor,
                                      selected:
                                          _selectedCategory == SubCategory.men,
                                      label: const Text(
                                        'for men',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onSelected: (selected) {
                                        setState(() => _selectedCategory =
                                            SubCategory.men);
                                      },
                                    ),
                                    ChoiceChip(
                                      selectedColor: kPrimaryColor,
                                      selected: _selectedCategory ==
                                          SubCategory.women,
                                      label: const Text(
                                        'for women',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onSelected: (selected) {
                                        setState(() => _selectedCategory =
                                            SubCategory.women);
                                      },
                                    ),
                                    ChoiceChip(
                                      autofocus: true,
                                      selectedColor: kPrimaryColor,
                                      selected: _selectedCategory ==
                                          SubCategory.children,
                                      label: const Text(
                                        'for children',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onSelected: (selected) {
                                        setState(() => _selectedCategory =
                                            SubCategory.children);
                                      },
                                    ),
                                  ],
                                )
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
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.grey,
                                              width: 1,
                                            ),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                            description:
                                                _editedProduct.description,
                                            price: _editedProduct.price,
                                            imageUrl: value,
                                            isFavorite:
                                                _editedProduct.isFavorite,
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
