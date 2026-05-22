import 'package:ecommerseproject/features/shop/model/banner_model.dart';
import 'package:ecommerseproject/features/shop/model/brand_model.dart';
import 'package:ecommerseproject/features/shop/model/product_attribute_model.dart';
import 'package:ecommerseproject/features/shop/model/product_model.dart';
import 'package:ecommerseproject/features/shop/model/product_variation_model.dart';
import 'package:ecommerseproject/routes/routes.dart';
import 'package:ecommerseproject/utils/constants/image_strings.dart';

import '../model/category_model.dart';

class TDummyData {
  static final List<BannerModel> banners = [
    BannerModel(
        active: true,
        imageUrl: TImages.promoBanner1,
        targetScreen: TRoutes.orders),
    BannerModel(
        active: false,
        imageUrl: TImages.promoBanner2,
        targetScreen: TRoutes.cart),
    BannerModel(
        active: true,
        imageUrl: TImages.promoBanner3,
        targetScreen: TRoutes.checkout),
    BannerModel(
        active: true,
        imageUrl: TImages.promoBanner1,
        targetScreen: TRoutes.checkout),
    BannerModel(
        active: true,
        imageUrl: TImages.promoBanner2,
        targetScreen: TRoutes.checkout),
    BannerModel(
        active: true,
        imageUrl: TImages.promoBanner3,
        targetScreen: TRoutes.checkout),
  ];
    // ✅ ADD THIS
  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', name: 'Sports',      image: TImages.sportIcon,       isFeatured: true),
    CategoryModel(id: '2', name: 'Furniture',   image: TImages.furnitureIcon,   isFeatured: true),
    CategoryModel(id: '3', name: 'Electronics', image: TImages.electronicsIcon, isFeatured: true),
    CategoryModel(id: '4', name: 'Clothes',     image: TImages.clothIcon,       isFeatured: true),
    CategoryModel(id: '5', name: 'Animals',     image: TImages.animalIcon,      isFeatured: true),
    CategoryModel(id: '6', name: 'Shoes',       image: TImages.shoeIcon,        isFeatured: true),
    CategoryModel(id: '7', name: 'Cosmetics',   image: TImages.cosmeticsIcon,   isFeatured: false),
    // Sub-categories (parentId links to parent category id)
    CategoryModel(id: '8',  name: 'Running Shoes', image: TImages.shoeIcon, parentId: '6', isFeatured: false),
    CategoryModel(id: '9',  name: 'Formal Shoes',  image: TImages.shoeIcon, parentId: '6', isFeatured: false),
    CategoryModel(id: '10', name: 'Sports Shirts',  image: TImages.clothIcon, parentId: '1', isFeatured: false),
  ];

  // static final List<ProductModel> products = [
  //   ProductModel(
  //       id: '001',
  //       title: 'Nike Air Max 270',
  //       stock: 10,
  //       price: 150.0,
  //       isFeatured: true,
  //       thumbnail: TImages.productImage1,
  //       description:
  //           'The Nike Air Max 270 features Nike\'s biggest heel Air unit yet for a super-soft ride that feels as impossible as it looks.',
  //       brand : BrandModel(id : '1',name: 'Nike', image: TImages.shoeIcon),
  //       images: [TImages.productImage1, TImages.productImage2],
  //        salePrice: 120.0,
  //       sku: 'EGT34F',
  //       categoryID: '1',
  //       productAttributes: [
  //         ProductAttributeModel(
  //             name: 'Color', values: ['Red', 'Blue', 'Black']),
  //         ProductAttributeModel(
  //             name: 'Size', values: ['6', '7', '8', '9', '10'])
  //       ],
  //       ),
  //   ProductModel(
  //     id: '002',
  //       title: 'Adidas Ultraboost 21',
  //       stock: 15,
  //       price: 180.0,
  //       isFeatured: true,
  //       thumbnail: TImages.productImage2,
  //       description:
  //           'The Adidas Ultraboost 21 delivers responsive cushioning and a sock-like fit for a comfortable run.',
  //       brand : BrandModel(id : '2',name: 'Adidas', image: TImages.shoeIcon),
  //       images: [TImages.productImage4, TImages.productImage4],
  //        salePrice: 150.0,
  //       sku: 'ADU21F',
  //       categoryID: '1',
  //       productAttributes: [
  //         ProductAttributeModel(
  //             name: 'Color', values: ['White', 'Black', 'Grey']),
  //         ProductAttributeModel(
  //             name: 'Size', values: ['6', '7', '8', '9', '10'])
  //       ],
  //         productVariations: [
  //           ProductVariationModel(
  //               id: '1',
  //               stock: 5,
  //               price: 180.0,
  //               salePrice: 150.0,
  //               image: TImages.productImage5,
  //               description: 'Variation 1 description',
  //               attributesValues: {
  //                 'Color': 'White',
  //                 'Size': '9'
  //               }
  //               ),
  //           ProductVariationModel(
  //               id: '2',
  //               stock: 3,
  //               price: 130.0,
  //               salePrice: 150.0,
  //               image: TImages.productImage6,
  //               description: 'Variation 1 description',
  //               attributesValues: {
  //                 'Color': 'Red',
  //                 'Size': '9'
  //               }
  //               ), 
  //           ProductVariationModel(
  //               id: '3',
  //               stock: 2,
  //               price: 190.0,
  //               salePrice: 150.0,
  //               image: TImages.productImage7,
  //               description: 'Variation 1 description',
  //               attributesValues: {
  //                 'Color': 'Pink',
  //                 'Size': '9'
  //               }
  //           ),
  //         ] 
  //        ),
  //   ProductModel(
  //     id: '003',
  //       title: 'Puma RS-X3',
  //       stock: 20,
  //       price: 110.0,
  //       isFeatured: false,
  //       thumbnail: TImages.productImage3,
  //       description:
  //           'The Puma RS-X3 combines bold design with comfort and performance for a standout sneaker.',
  //       brand : BrandModel(id : '3',name: 'Puma', image: TImages.shoeIcon),
  //       images: [TImages.productImage8, TImages.productImage9],
  //        salePrice: 90.0,
  //       sku: 'PRSX3F',
  //       categoryID: '1',
  //       productAttributes: [
  //         ProductAttributeModel(
  //             name: 'Color', values: ['Red', 'Blue', 'Green']),
  //         ProductAttributeModel(
  //             name: 'Size', values: ['6', '7', '8', '9', '10'])
  //       ],
  //        productVariations: [
  //           ProductVariationModel(
  //               id: '1',
  //               stock: 5,
  //               price: 180.0,
  //               salePrice: 150.0,
  //               image: TImages.productImage10,
  //               description: 'Variation 1 description',
  //               attributesValues: {
  //                 'Color': 'White',
  //                 'Size': '9'
  //               }
  //               ),
  //           ProductVariationModel(
  //               id: '2',
  //               stock: 3,
  //               price: 130.0,
  //               salePrice: 150.0,
  //               image: TImages.productImage11,
  //               description: 'Variation 1 description',
  //               attributesValues: {
  //                 'Color': 'Red',
  //                 'Size': '9'
  //               }
  //               ), 
  //           ProductVariationModel(
  //               id: '3',
  //               stock: 2,
  //               price: 190.0,
  //               salePrice: 150.0,
  //               image: TImages.productImage12,
  //               description: 'Variation 1 description',
  //               attributesValues: {
  //                 'Color': 'Pink',
  //                 'Size': '9'
  //               }
  //           ),
  //         ] 
  //        ),
  // ];

  static final List<ProductModel> products = [
  // ── Product 001 ──────────────────────────────────────────────
  ProductModel(
    id: '001',
    title: 'Green Nike Sports Shoe',
    stock: 15,
    price: 135,
    salePrice: 0,
    isFeatured: true,
    thumbnail: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
    description: 'This is a Product description for Green Nike sports shoe.',
    sku: '',
    categoryID: '1',
    productType: 'ProductType.variable',
    brand: BrandModel(
      id: '1',
      name: 'Nike',
      image: 'https://upload.wikimedia.org/wikipedia/commons/a/a6/Logo_NIKE.svg',
    ),
    images: [
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
      'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=400',
    ],
    productAttributes: [
      ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
      ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
    ],
    productVariations: [
      ProductVariationModel(
        id: '1',
        stock: 34,
        price: 134,
        salePrice: 122.6,
        sku: '',
        image: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
        description: 'This is a Product description for Green Nike sports shoe.',
        attributesValues: {'Color': 'Green', 'Size': 'EU 30'},
      ),
      ProductVariationModel(
        id: '2',
        stock: 0,
        price: 132,
        salePrice: 0,
        sku: '',
        image: 'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=400',
        description: '',
        attributesValues: {'Color': 'Black', 'Size': 'EU 32'},
      ),
      ProductVariationModel(
        id: '3',
        stock: 0,
        price: 234,
        salePrice: 0,
        sku: '',
        image: 'https://images.unsplash.com/photo-1608231387042-66d1773070a5?w=400',
        description: '',
        attributesValues: {'Color': 'Black', 'Size': 'EU 34'},
      ),
      ProductVariationModel(
        id: '4',
        stock: 0,
        price: 334,
        salePrice: 0,
        sku: '',
        image: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
        description: '',
        attributesValues: {'Color': 'Red', 'Size': 'EU 34'},
      ),
      ProductVariationModel(
        id: '5',
        stock: 0,
        price: 334,
        salePrice: 0,
        sku: '',
        image: 'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=400',
        description: '',
        attributesValues: {'Color': 'Red', 'Size': 'EU 34'},
      ),
      ProductVariationModel(
        id: '6',
        stock: 11,
        price: 332,
        salePrice: 0,
        sku: '',
        image: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
        description: '',
        attributesValues: {'Color': 'Red', 'Size': 'EU 32'},
      ),
    ],
  ),

  // ── Product 002 ──────────────────────────────────────────────
  ProductModel(
    id: '002',
    title: 'Adidas Ultraboost 21',
    stock: 20,
    price: 180,
    salePrice: 150,
    isFeatured: true,
    thumbnail: 'https://images.unsplash.com/photo-1608231387042-66d1773070a5?w=400',
    description: 'The Adidas Ultraboost 21 delivers responsive cushioning and a sock-like fit.',
    sku: 'ADU21F',
    categoryID: '1',
    productType: 'ProductType.variable',
    brand: BrandModel(
      id: '2',
      name: 'Adidas',
      image: 'https://upload.wikimedia.org/wikipedia/commons/2/20/Adidas_Logo.svg',
    ),
    images: [
      'https://images.unsplash.com/photo-1608231387042-66d1773070a5?w=400',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
    ],
    productAttributes: [
      ProductAttributeModel(name: 'Color', values: ['White', 'Black', 'Grey']),
      ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
    ],
    productVariations: [
      ProductVariationModel(
        id: '1',
        stock: 10,
        price: 180,
        salePrice: 150,
        sku: '',
        image: 'https://images.unsplash.com/photo-1608231387042-66d1773070a5?w=400',
        description: 'White EU 30',
        attributesValues: {'Color': 'White', 'Size': 'EU 30'},
      ),
      ProductVariationModel(
        id: '2',
        stock: 5,
        price: 175,
        salePrice: 140,
        sku: '',
        image: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
        description: 'Black EU 32',
        attributesValues: {'Color': 'Black', 'Size': 'EU 32'},
      ),
    ],
  ),

  // ── Product 003 ──────────────────────────────────────────────
  ProductModel(
    id: '003',
    title: 'Puma RS-X3',
    stock: 20,
    price: 110,
    salePrice: 90,
    isFeatured: false,
    thumbnail: 'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=400',
    description: 'The Puma RS-X3 combines bold design with comfort and performance.',
    sku: 'PRSX3F',
    categoryID: '1',
    productType: 'ProductType.single',
    brand: BrandModel(
      id: '3',
      name: 'Puma',
      image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Puma_Logo.svg/200px-Puma_Logo.svg.png',
    ),
    images: [
      'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=400',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
    ],
    productAttributes: [
      ProductAttributeModel(name: 'Color', values: ['Red', 'Blue', 'Green']),
      ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
    ],
  ),
];

}
