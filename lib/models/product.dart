import 'package:e_commerce_app/models/category.dart';

enum SubCategory {
  women,
  men,
  children,
}

class Product {
  final String? id;
  final List<ProductCategory>? categories;
  final String? title;
  final String? description;
  final double? price;
  final String? imageUrl;
  final SubCategory? subCategory;
  bool? isFavorite;

  Product({
    required this.id,
    this.categories,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.subCategory,
    this.isFavorite = false,
  });
}

List<Product> items = [
  Product(
    id: 'p1',
    categories: [
      ProductCategory.all,
      ProductCategory.popular,
      ProductCategory.recent,
      ProductCategory.recommended,
    ],
    subCategory: SubCategory.women,
    title: 'Cool Suit',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    price: 29.99,
    imageUrl:
        'https://ae01.alicdn.com/kf/HTB1lXYCSFXXXXc3aXXXq6xXFXXXK/Spring-Summer-Formal-Elegant-Pink-Blazers-Women-Business-Suits-With-Pants-and-Jackets-Professional-Pants-Suits.jpg',
  ),
  Product(
    id: 'p2',
    categories: [
      ProductCategory.all,
      ProductCategory.recent,
    ],
    subCategory: SubCategory.women,
    title: 'Great Suit',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    price: 59.99,
    imageUrl:
        'https://i.pinimg.com/564x/30/c1/dd/30c1dd771c36a5c43b677d894fd796c3.jpg',
  ),
  Product(
    id: 'p3',
    categories: [
      ProductCategory.all,
      ProductCategory.popular,
    ],
    subCategory: SubCategory.women,
    title: 'Cool Suit',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    price: 19.99,
    imageUrl:
        'https://i.pinimg.com/564x/8b/47/09/8b4709bafacb81e07b1e5b577ef3573a.jpg',
  ),
  Product(
    id: 'p4',
    categories: [
      ProductCategory.all,
      ProductCategory.recommended,
    ],
    subCategory: SubCategory.women,
    title: 'Cool Suit',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    price: 49.99,
    imageUrl:
        'https://i.pinimg.com/564x/ef/b3/58/efb3586bbdf7414b3fc9f234fab4a711.jpg',
  ),
  Product(
    id: 'p5',
    categories: [
      ProductCategory.all,
      ProductCategory.popular,
      ProductCategory.recent,
    ],
    subCategory: SubCategory.women,
    title: 'Cool Suit',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    price: 30.99,
    imageUrl:
        'https://i.pinimg.com/originals/d1/2a/22/d12a2205f9f0f227ae6dbfbe1333a721.jpg',
  ),
  Product(
    id: 'p6',
    categories: [
      ProductCategory.all,
      ProductCategory.popular,
      ProductCategory.recommended,
    ],
    subCategory: SubCategory.women,
    title: 'Cool cool suit',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    price: 23.49,
    imageUrl: 'https://photo.venus.com/im/19380980.jpg?preset=s',
  ),
  Product(
    id: 'p7',
    categories: [
      ProductCategory.all,
      ProductCategory.recent,
    ],
    subCategory: SubCategory.women,
    title: 'Pinket Suit',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    price: 22.99,
    imageUrl:
        'https://i.pinimg.com/originals/35/c9/00/35c9004351fa35cb2585546c17c00394.jpg',
  ),
  Product(
    id: 'p8',
    categories: [
      ProductCategory.all,
      ProductCategory.popular,
    ],
    subCategory: SubCategory.women,
    title: 'Pink Suit',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    price: 6.99,
    imageUrl:
        'https://latestblazer.com/wp-content/uploads/2020/01/Women-Blazer-Suits-Pink-Blazers.jpg',
  ),
  Product(
    id: 'p9',
    categories: [
      ProductCategory.all,
      ProductCategory.popular,
      ProductCategory.recommended,
    ],
    subCategory: SubCategory.women,
    title: 'Lovely Suit',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    price: 89.99,
    imageUrl:
        'https://ae01.alicdn.com/kf/HTB18jVfaouF3KVjSZK9q6zVtXXar/Women-s-suits-2019-autumn-new-women-s-temperament-double-breasted-pink-large-size-suit-jacket.jpg',
  ),
  Product(
    id: 'p10',
    categories: [
      ProductCategory.all,
      ProductCategory.recommended,
    ],
    subCategory: SubCategory.women,
    title: 'Suit',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    price: 99.99,
    imageUrl:
        'https://i.pinimg.com/originals/d1/2a/22/d12a2205f9f0f227ae6dbfbe1333a721.jpg',
  ),
];
