// import 'package:ecommerseproject/features/shop/model/banner_model.dart';
// import 'package:ecommerseproject/features/shop/model/brand_model.dart';
// import 'package:ecommerseproject/features/shop/model/product_attribute_model.dart';
// import 'package:ecommerseproject/features/shop/model/product_model.dart';
// import 'package:ecommerseproject/features/shop/model/product_variation_model.dart';
// import 'package:ecommerseproject/routes/routes.dart';
// import 'package:ecommerseproject/utils/constants/image_strings.dart';

// import '../model/category_model.dart';

// class TDummyData {
//   static final List<BannerModel> banners = [
//     BannerModel(
//         active: true,
//         imageUrl: TImages.promoBanner1,
//         targetScreen: TRoutes.orders),
//     BannerModel(
//         active: false,
//         imageUrl: TImages.promoBanner2,
//         targetScreen: TRoutes.cart),
//     BannerModel(
//         active: true,
//         imageUrl: TImages.promoBanner3,
//         targetScreen: TRoutes.checkout),
//     BannerModel(
//         active: true,
//         imageUrl: TImages.promoBanner1,
//         targetScreen: TRoutes.checkout),
//     BannerModel(
//         active: true,
//         imageUrl: TImages.promoBanner2,
//         targetScreen: TRoutes.checkout),
//     BannerModel(
//         active: true,
//         imageUrl: TImages.promoBanner3,
//         targetScreen: TRoutes.checkout),
//   ];
//     // ✅ ADD THIS
//   static final List<CategoryModel> categories = [
//     CategoryModel(id: '1', name: 'Sports',      image: TImages.sportIcon,       isFeatured: true),
//     CategoryModel(id: '2', name: 'Furniture',   image: TImages.furnitureIcon,   isFeatured: true),
//     CategoryModel(id: '3', name: 'Electronics', image: TImages.electronicsIcon, isFeatured: true),
//     CategoryModel(id: '4', name: 'Clothes',     image: TImages.clothIcon,       isFeatured: true),
//     CategoryModel(id: '5', name: 'Animals',     image: TImages.animalIcon,      isFeatured: true),
//     CategoryModel(id: '6', name: 'Shoes',       image: TImages.shoeIcon,        isFeatured: true),
//     CategoryModel(id: '7', name: 'Cosmetics',   image: TImages.cosmeticsIcon,   isFeatured: false),
//     CategoryModel(id: '8',  name: 'Running Shoes', image: TImages.shoeIcon, parentId: '6', isFeatured: false),
//     CategoryModel(id: '9',  name: 'Formal Shoes',  image: TImages.shoeIcon, parentId: '6', isFeatured: false),
//     CategoryModel(id: '10', name: 'Sports Shirts',  image: TImages.clothIcon, parentId: '1', isFeatured: false),
//   ];


//   static final List<ProductModel> products = [
//   // ── Product 001 ──────────────────────────────────────────────
//   ProductModel(
//     id: '001',
//     title: 'Green Nike Sports Shoe',
//     stock: 15,
//     price: 135,
//     salePrice: 0,
//     isFeatured: true,
//     thumbnail: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
//     description: 'This is a Product description for Green Nike sports shoe.',
//     sku: '',
//     categoryID: '1',
//     productType: 'ProductType.variable',
//     brand: BrandModel(
//       id: '1',
//       name: 'Nike',
//       image: 'https://upload.wikimedia.org/wikipedia/commons/a/a6/Logo_NIKE.svg',
//     ),
//     images: [
//       'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
//       'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=400',
//     ],
//     productAttributes: [
//       ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
//       ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
//     ],
//     productVariations: [
//       ProductVariationModel(
//         id: '1',
//         stock: 34,
//         price: 134,
//         salePrice: 122.6,
//         sku: '',
//         image: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
//         description: 'This is a Product description for Green Nike sports shoe.',
//         attributesValues: {'Color': 'Green', 'Size': 'EU 30'},
//       ),
//       ProductVariationModel(
//         id: '2',
//         stock: 0,
//         price: 132,
//         salePrice: 0,
//         sku: '',
//         image: 'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=400',
//         description: '',
//         attributesValues: {'Color': 'Black', 'Size': 'EU 32'},
//       ),
//       ProductVariationModel(
//         id: '3',
//         stock: 0,
//         price: 234,
//         salePrice: 0,
//         sku: '',
//         image: 'https://images.unsplash.com/photo-1608231387042-66d1773070a5?w=400',
//         description: '',
//         attributesValues: {'Color': 'Black', 'Size': 'EU 34'},
//       ),
//       ProductVariationModel(
//         id: '4',
//         stock: 0,
//         price: 334,
//         salePrice: 0,
//         sku: '',
//         image: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
//         description: '',
//         attributesValues: {'Color': 'Red', 'Size': 'EU 34'},
//       ),
//       ProductVariationModel(
//         id: '5',
//         stock: 0,
//         price: 334,
//         salePrice: 0,
//         sku: '',
//         image: 'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=400',
//         description: '',
//         attributesValues: {'Color': 'Red', 'Size': 'EU 34'},
//       ),
//       ProductVariationModel(
//         id: '6',
//         stock: 11,
//         price: 332,
//         salePrice: 0,
//         sku: '',
//         image: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
//         description: '',
//         attributesValues: {'Color': 'Red', 'Size': 'EU 32'},
//       ),
//     ],
//   ),

//   // ── Product 002 ──────────────────────────────────────────────
//   ProductModel(
//     id: '002',
//     title: 'Adidas Ultraboost 21',
//     stock: 20,
//     price: 180,
//     salePrice: 150,
//     isFeatured: true,
//     thumbnail: 'https://images.unsplash.com/photo-1608231387042-66d1773070a5?w=400',
//     description: 'The Adidas Ultraboost 21 delivers responsive cushioning and a sock-like fit.',
//     sku: 'ADU21F',
//     categoryID: '1',
//     productType: 'ProductType.variable',
//     brand: BrandModel(
//       id: '2',
//       name: 'Adidas',
//       image: 'https://upload.wikimedia.org/wikipedia/commons/2/20/Adidas_Logo.svg',
//     ),
//     images: [
//       'https://images.unsplash.com/photo-1608231387042-66d1773070a5?w=400',
//       'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
//     ],
//     productAttributes: [
//       ProductAttributeModel(name: 'Color', values: ['White', 'Black', 'Grey']),
//       ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
//     ],
//     productVariations: [
//       ProductVariationModel(
//         id: '1',
//         stock: 10,
//         price: 180,
//         salePrice: 150,
//         sku: '',
//         image: 'https://images.unsplash.com/photo-1608231387042-66d1773070a5?w=400',
//         description: 'White EU 30',
//         attributesValues: {'Color': 'White', 'Size': 'EU 30'},
//       ),
//       ProductVariationModel(
//         id: '2',
//         stock: 5,
//         price: 175,
//         salePrice: 140,
//         sku: '',
//         image: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
//         description: 'Black EU 32',
//         attributesValues: {'Color': 'Black', 'Size': 'EU 32'},
//       ),
//     ],
//   ),

//   // ── Product 003 ──────────────────────────────────────────────
//   ProductModel(
//     id: '003',
//     title: 'Puma RS-X3',
//     stock: 20,
//     price: 110,
//     salePrice: 90,
//     isFeatured: true,
//     thumbnail: 'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=400',
//     description: 'The Puma RS-X3 combines bold design with comfort and performance.',
//     sku: 'PRSX3F',
//     categoryID: '1',
//     productType: 'ProductType.single',
//     brand: BrandModel(
//       id: '3',
//       name: 'Puma',
//       image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Puma_Logo.svg/200px-Puma_Logo.svg.png',
//     ),
//     images: [
//       'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=400',
//       'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
//     ],
//     productAttributes: [
//       ProductAttributeModel(name: 'Color', values: ['Red', 'Blue', 'Green']),
//       ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
//     ],
//   ),

//   // product 4 
//    ProductModel(
//     id: '004',
//     title: 'Green Nike Sports Shoe',
//     stock: 15,
//     price: 135,
//     salePrice: 0,
//     isFeatured: true,
//     thumbnail: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
//     description: 'This is a Product description for Green Nike sports shoe.',
//     sku: '',
//     categoryID: '1',
//     productType: 'ProductType.variable',
//     brand: BrandModel(
//       id: '1',
//       name: 'Nike',
//       image: 'https://upload.wikimedia.org/wikipedia/commons/a/a6/Logo_NIKE.svg',
//     ),
//     images: [
//       'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
//       'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=400',
//     ],
//     productAttributes: [
//       ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
//       ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
//     ],
//     productVariations: [
//       ProductVariationModel(
//         id: '1',
//         stock: 34,
//         price: 134,
//         salePrice: 122.6,
//         sku: '',
//         image: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
//         description: 'This is a Product description for Green Nike sports shoe.',
//         attributesValues: {'Color': 'Green', 'Size': 'EU 30'},
//       ),
//       ProductVariationModel(
//         id: '2',
//         stock: 0,
//         price: 132,
//         salePrice: 0,
//         sku: '',
//         image: 'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=400',
//         description: '',
//         attributesValues: {'Color': 'Black', 'Size': 'EU 32'},
//       ),
//       ProductVariationModel(
//         id: '3',
//         stock: 0,
//         price: 234,
//         salePrice: 0,
//         sku: '',
//         image: 'https://images.unsplash.com/photo-1608231387042-66d1773070a5?w=400',
//         description: '',
//         attributesValues: {'Color': 'Black', 'Size': 'EU 34'},
//       ),
//       ProductVariationModel(
//         id: '4',
//         stock: 0,
//         price: 334,
//         salePrice: 0,
//         sku: '',
//         image: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
//         description: '',
//         attributesValues: {'Color': 'Red', 'Size': 'EU 34'},
//       ),
//       ProductVariationModel(
//         id: '5',
//         stock: 0,
//         price: 334,
//         salePrice: 0,
//         sku: '',
//         image: 'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=400',
//         description: '',
//         attributesValues: {'Color': 'Red', 'Size': 'EU 34'},
//       ),
//       ProductVariationModel(
//         id: '6',
//         stock: 11,
//         price: 332,
//         salePrice: 0,
//         sku: '',
//         image: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
//         description: '',
//         attributesValues: {'Color': 'Red', 'Size': 'EU 32'},
//       ),
//     ],
//   ),
// ];

// }






import 'package:ecommerseproject/features/shop/model/banner_model.dart';
import 'package:ecommerseproject/features/shop/model/brand_model.dart';
import 'package:ecommerseproject/features/shop/model/category_model.dart';
import 'package:ecommerseproject/features/shop/model/product_attribute_model.dart';
import 'package:ecommerseproject/features/shop/model/product_model.dart';
import 'package:ecommerseproject/features/shop/model/product_variation_model.dart';
import 'package:ecommerseproject/routes/routes.dart';
import 'package:ecommerseproject/utils/constants/image_strings.dart';

class TDummyData {
  // ─────────────────────────────────────────────────────────────
  // BANNERS
  // ─────────────────────────────────────────────────────────────
  static final List<BannerModel> banners = [
    BannerModel(active: true,  imageUrl: TImages.promoBanner1, targetScreen: TRoutes.orders),
    BannerModel(active: true,  imageUrl: TImages.promoBanner2, targetScreen: TRoutes.cart),
    BannerModel(active: true,  imageUrl: TImages.promoBanner3, targetScreen: TRoutes.checkout),
    BannerModel(active: false, imageUrl: TImages.promoBanner1, targetScreen: TRoutes.checkout),
    BannerModel(active: true,  imageUrl: TImages.promoBanner2, targetScreen: TRoutes.checkout),
    BannerModel(active: true,  imageUrl: TImages.promoBanner3, targetScreen: TRoutes.checkout),
  ];

  // ─────────────────────────────────────────────────────────────
  // CATEGORIES
  // id  matches CategoryID used in products below
  // ─────────────────────────────────────────────────────────────
  static final List<CategoryModel> categories = [
    // ── Featured (parent) categories ──────────────────────────
    CategoryModel(id: 'CAT1', name: 'Sports',      image: TImages.sportIcon,       isFeatured: true),
    CategoryModel(id: 'CAT2', name: 'Clothes',     image: TImages.clothIcon,       isFeatured: true),
    CategoryModel(id: 'CAT3', name: 'Electronics', image: TImages.electronicsIcon, isFeatured: true),
    CategoryModel(id: 'CAT4', name: 'Furniture',   image: TImages.furnitureIcon,   isFeatured: true),
    CategoryModel(id: 'CAT5', name: 'Jewellery',   image: TImages.jwelaryIcon,     isFeatured: true),
    CategoryModel(id: 'CAT6', name: 'Cosmetics',   image: TImages.cosmeticsIcon,   isFeatured: true),
    // ── Sub-categories ────────────────────────────────────────
    CategoryModel(id: 'CAT7',  name: 'Running Shoes',   image: TImages.shoeIcon,   parentId: 'CAT1', isFeatured: false),
    CategoryModel(id: 'CAT8',  name: 'Sports Shirts',   image: TImages.clothIcon,  parentId: 'CAT1', isFeatured: false),
    CategoryModel(id: 'CAT9',  name: 'Casual Shirts',   image: TImages.clothIcon,  parentId: 'CAT2', isFeatured: false),
    CategoryModel(id: 'CAT10', name: 'Dresses',         image: TImages.clothIcon,  parentId: 'CAT2', isFeatured: false),
    CategoryModel(id: 'CAT11', name: 'Smartphones',     image: TImages.electronicsIcon, parentId: 'CAT3', isFeatured: false),
    CategoryModel(id: 'CAT12', name: 'Laptops',         image: TImages.electronicsIcon, parentId: 'CAT3', isFeatured: false),
  ];

  // ─────────────────────────────────────────────────────────────
  // BRANDS  (reused inside products)
  // ─────────────────────────────────────────────────────────────
  static final _nike = BrandModel(
    id: 'B1', name: 'Nike',
    image: 'https://upload.wikimedia.org/wikipedia/commons/a/a6/Logo_NIKE.svg',
  );
  static final _adidas = BrandModel(
    id: 'B2', name: 'Adidas',
    image: 'https://upload.wikimedia.org/wikipedia/commons/2/20/Adidas_Logo.svg',
  );
  static final _puma = BrandModel(
    id: 'B3', name: 'Puma',
    image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Puma_Logo.svg/200px-Puma_Logo.svg.png',
  );
  static final _zara = BrandModel(
    id: 'B4', name: 'Zara',
    image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Zara_Logo.svg/500px-Zara_Logo.svg.png',
  );
  static final _hm = BrandModel(
    id: 'B5', name: 'H&M',
    image: 'https://upload.wikimedia.org/wikipedia/commons/5/53/H%26M-Logo.svg',
  );
  static final _samsung = BrandModel(
    id: 'B6', name: 'Samsung',
    image: 'https://upload.wikimedia.org/wikipedia/commons/2/24/Samsung_Logo.svg',
  );
  static final _apple = BrandModel(
    id: 'B7', name: 'Apple',
    image: 'https://upload.wikimedia.org/wikipedia/commons/f/fa/Apple_logo_black.svg',
  );
  static final _ikea = BrandModel(
    id: 'B8', name: 'IKEA',
    image: 'https://upload.wikimedia.org/wikipedia/commons/c/c5/Ikea_logo.svg',
  );

  // ─────────────────────────────────────────────────────────────
  // PRODUCTS
  // CategoryID links each product to the category above
  // ─────────────────────────────────────────────────────────────
  static final List<ProductModel> products = [

    // ══════════════════════════════════════════════════════════
    // CAT1 — SPORTS
    // ══════════════════════════════════════════════════════════

    ProductModel(
      id: 'P001',
      title: 'Nike Air Max 270',
      stock: 50,
      price: 150,
      salePrice: 120,
      isFeatured: true,
      thumbnail: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
      description: 'Nike Air Max 270 features the biggest heel Air unit yet for a super-soft ride.',
      sku: 'NK-AM270',
      categoryID: 'CAT1',
      productType: 'ProductType.variable',
      brand: _nike,
      images: [
        'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
        'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=400',
        'https://images.unsplash.com/photo-1608231387042-66d1773070a5?w=400',
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Red', 'Black', 'White']),
        ProductAttributeModel(name: 'Size',  values: ['EU 40', 'EU 41', 'EU 42', 'EU 43']),
      ],
      productVariations: [
        ProductVariationModel(id: 'V1', stock: 10, price: 150, salePrice: 120, sku: 'NK-AM270-R40',
            image: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
            description: 'Red EU 40', attributesValues: {'Color': 'Red', 'Size': 'EU 40'}),
        ProductVariationModel(id: 'V2', stock: 8,  price: 150, salePrice: 120, sku: 'NK-AM270-B41',
            image: 'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=400',
            description: 'Black EU 41', attributesValues: {'Color': 'Black', 'Size': 'EU 41'}),
        ProductVariationModel(id: 'V3', stock: 5,  price: 155, salePrice: 125, sku: 'NK-AM270-W42',
            image: 'https://images.unsplash.com/photo-1608231387042-66d1773070a5?w=400',
            description: 'White EU 42', attributesValues: {'Color': 'White', 'Size': 'EU 42'}),
        ProductVariationModel(id: 'V4', stock: 0,  price: 155, salePrice: 0, sku: 'NK-AM270-R43',
            image: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
            description: 'Red EU 43 - Out of Stock', attributesValues: {'Color': 'Red', 'Size': 'EU 43'}),
      ],
    ),

    ProductModel(
      id: 'P002',
      title: 'Adidas Ultraboost 22',
      stock: 30,
      price: 180,
      salePrice: 150,
      isFeatured: true,
      thumbnail: 'https://images.unsplash.com/photo-1608231387042-66d1773070a5?w=400',
      description: 'Ultraboost 22 delivers incredible energy return and a sock-like fit.',
      sku: 'AD-UB22',
      categoryID: 'CAT1',
      productType: 'ProductType.variable',
      brand: _adidas,
      images: [
        'https://images.unsplash.com/photo-1608231387042-66d1773070a5?w=400',
        'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['White', 'Grey', 'Navy']),
        ProductAttributeModel(name: 'Size',  values: ['EU 40', 'EU 41', 'EU 42']),
      ],
      productVariations: [
        ProductVariationModel(id: 'V1', stock: 12, price: 180, salePrice: 150, sku: 'AD-UB22-W40',
            image: 'https://images.unsplash.com/photo-1608231387042-66d1773070a5?w=400',
            description: 'White EU 40', attributesValues: {'Color': 'White', 'Size': 'EU 40'}),
        ProductVariationModel(id: 'V2', stock: 10, price: 180, salePrice: 150, sku: 'AD-UB22-G41',
            image: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
            description: 'Grey EU 41', attributesValues: {'Color': 'Grey', 'Size': 'EU 41'}),
        ProductVariationModel(id: 'V3', stock: 8,  price: 185, salePrice: 155, sku: 'AD-UB22-N42',
            image: 'https://images.unsplash.com/photo-1608231387042-66d1773070a5?w=400',
            description: 'Navy EU 42', attributesValues: {'Color': 'Navy', 'Size': 'EU 42'}),
      ],
    ),

    ProductModel(
      id: 'P003',
      title: 'Puma RS-X3 Sneaker',
      stock: 20,
      price: 110,
      salePrice: 90,
      isFeatured: false,
      thumbnail: 'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=400',
      description: 'Puma RS-X3 combines retro looks with modern comfort technology.',
      sku: 'PM-RSX3',
      categoryID: 'CAT1',
      productType: 'ProductType.single',
      brand: _puma,
      images: [
        'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=400',
        'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Blue', 'Red', 'Green']),
        ProductAttributeModel(name: 'Size',  values: ['EU 39', 'EU 40', 'EU 41']),
      ],
    ),

    ProductModel(
      id: 'P004',
      title: 'Nike Dri-FIT Sports Shirt',
      stock: 40,
      price: 55,
      salePrice: 45,
      isFeatured: true,
      thumbnail: 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400',
      description: 'Nike Dri-FIT technology keeps you dry and comfortable during workouts.',
      sku: 'NK-DRI-SS',
      categoryID: 'CAT1',
      productType: 'ProductType.variable',
      brand: _nike,
      images: [
        'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400',
        'https://images.unsplash.com/photo-1576566588028-4147f3842f27?w=400',
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Black', 'White', 'Blue']),
        ProductAttributeModel(name: 'Size',  values: ['S', 'M', 'L', 'XL']),
      ],
      productVariations: [
        ProductVariationModel(id: 'V1', stock: 15, price: 55, salePrice: 45, sku: 'NK-DRI-BK-M',
            image: 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400',
            description: 'Black M', attributesValues: {'Color': 'Black', 'Size': 'M'}),
        ProductVariationModel(id: 'V2', stock: 10, price: 55, salePrice: 45, sku: 'NK-DRI-WH-L',
            image: 'https://images.unsplash.com/photo-1576566588028-4147f3842f27?w=400',
            description: 'White L', attributesValues: {'Color': 'White', 'Size': 'L'}),
        ProductVariationModel(id: 'V3', stock: 5,  price: 55, salePrice: 45, sku: 'NK-DRI-BL-XL',
            image: 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400',
            description: 'Blue XL', attributesValues: {'Color': 'Blue', 'Size': 'XL'}),
      ],
    ),

    // ══════════════════════════════════════════════════════════
    // CAT2 — CLOTHES
    // ══════════════════════════════════════════════════════════

    ProductModel(
      id: 'P005',
      title: 'Zara Slim Fit Casual Shirt',
      stock: 60,
      price: 49,
      salePrice: 35,
      isFeatured: true,
      thumbnail: 'https://images.unsplash.com/photo-1596755094514-f87e34085b2c?w=400',
      description: 'Slim-fit casual shirt made from breathable cotton blend.',
      sku: 'ZR-SFC01',
      categoryID: 'CAT2',
      productType: 'ProductType.variable',
      brand: _zara,
      images: [
        'https://images.unsplash.com/photo-1596755094514-f87e34085b2c?w=400',
        'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400',
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['White', 'Light Blue', 'Pink']),
        ProductAttributeModel(name: 'Size',  values: ['S', 'M', 'L', 'XL', 'XXL']),
      ],
      productVariations: [
        ProductVariationModel(id: 'V1', stock: 20, price: 49, salePrice: 35, sku: 'ZR-SFC-WH-M',
            image: 'https://images.unsplash.com/photo-1596755094514-f87e34085b2c?w=400',
            description: 'White M', attributesValues: {'Color': 'White', 'Size': 'M'}),
        ProductVariationModel(id: 'V2', stock: 15, price: 49, salePrice: 35, sku: 'ZR-SFC-LB-L',
            image: 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400',
            description: 'Light Blue L', attributesValues: {'Color': 'Light Blue', 'Size': 'L'}),
        ProductVariationModel(id: 'V3', stock: 10, price: 49, salePrice: 35, sku: 'ZR-SFC-PK-S',
            image: 'https://images.unsplash.com/photo-1596755094514-f87e34085b2c?w=400',
            description: 'Pink S', attributesValues: {'Color': 'Pink', 'Size': 'S'}),
      ],
    ),

    ProductModel(
      id: 'P006',
      title: 'H&M Floral Summer Dress',
      stock: 25,
      price: 65,
      salePrice: 50,
      isFeatured: true,
      thumbnail: 'https://images.unsplash.com/photo-1572804013309-59a88b7e92f1?w=400',
      description: 'Lightweight floral summer dress perfect for warm days.',
      sku: 'HM-FSD01',
      categoryID: 'CAT2',
      productType: 'ProductType.variable',
      brand: _hm,
      images: [
        'https://images.unsplash.com/photo-1572804013309-59a88b7e92f1?w=400',
        'https://images.unsplash.com/photo-1496747611176-843222e1e57c?w=400',
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Red Floral', 'Blue Floral', 'Yellow Floral']),
        ProductAttributeModel(name: 'Size',  values: ['XS', 'S', 'M', 'L']),
      ],
      productVariations: [
        ProductVariationModel(id: 'V1', stock: 8, price: 65, salePrice: 50, sku: 'HM-FSD-RF-S',
            image: 'https://images.unsplash.com/photo-1572804013309-59a88b7e92f1?w=400',
            description: 'Red Floral S', attributesValues: {'Color': 'Red Floral', 'Size': 'S'}),
        ProductVariationModel(id: 'V2', stock: 9, price: 65, salePrice: 50, sku: 'HM-FSD-BF-M',
            image: 'https://images.unsplash.com/photo-1496747611176-843222e1e57c?w=400',
            description: 'Blue Floral M', attributesValues: {'Color': 'Blue Floral', 'Size': 'M'}),
        ProductVariationModel(id: 'V3', stock: 4, price: 65, salePrice: 50, sku: 'HM-FSD-YF-L',
            image: 'https://images.unsplash.com/photo-1572804013309-59a88b7e92f1?w=400',
            description: 'Yellow Floral L', attributesValues: {'Color': 'Yellow Floral', 'Size': 'L'}),
      ],
    ),

    ProductModel(
      id: 'P007',
      title: 'Zara Slim Chinos',
      stock: 35,
      price: 70,
      salePrice: 0,
      isFeatured: false,
      thumbnail: 'https://images.unsplash.com/photo-1473966968600-fa801b869a1a?w=400',
      description: 'Smart slim-fit chinos in stretch fabric for all-day comfort.',
      sku: 'ZR-SCH01',
      categoryID: 'CAT2',
      productType: 'ProductType.variable',
      brand: _zara,
      images: [
        'https://images.unsplash.com/photo-1473966968600-fa801b869a1a?w=400',
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Beige', 'Olive', 'Navy']),
        ProductAttributeModel(name: 'Size',  values: ['30x30', '32x30', '34x32', '36x32']),
      ],
      productVariations: [
        ProductVariationModel(id: 'V1', stock: 12, price: 70, salePrice: 0, sku: 'ZR-SCH-BE-32',
            image: 'https://images.unsplash.com/photo-1473966968600-fa801b869a1a?w=400',
            description: 'Beige 32x30', attributesValues: {'Color': 'Beige', 'Size': '32x30'}),
        ProductVariationModel(id: 'V2', stock: 10, price: 70, salePrice: 0, sku: 'ZR-SCH-OL-34',
            image: 'https://images.unsplash.com/photo-1473966968600-fa801b869a1a?w=400',
            description: 'Olive 34x32', attributesValues: {'Color': 'Olive', 'Size': '34x32'}),
      ],
    ),

    ProductModel(
      id: 'P008',
      title: 'H&M Basic Cotton T-Shirt',
      stock: 100,
      price: 15,
      salePrice: 0,
      isFeatured: false,
      thumbnail: 'https://images.unsplash.com/photo-1581655353564-df123a1eb820?w=400',
      description: 'Simple, soft cotton T-shirt, a wardrobe essential.',
      sku: 'HM-BCT01',
      categoryID: 'CAT2',
      productType: 'ProductType.single',
      brand: _hm,
      images: [
        'https://images.unsplash.com/photo-1581655353564-df123a1eb820?w=400',
        'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400',
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Black', 'White', 'Grey', 'Navy']),
        ProductAttributeModel(name: 'Size',  values: ['S', 'M', 'L', 'XL']),
      ],
    ),

    // ══════════════════════════════════════════════════════════
    // CAT3 — ELECTRONICS
    // ══════════════════════════════════════════════════════════

    ProductModel(
      id: 'P009',
      title: 'Samsung Galaxy S24',
      stock: 20,
      price: 999,
      salePrice: 899,
      isFeatured: true,
      thumbnail: 'https://images.unsplash.com/photo-1610945415295-d9bbf067e59c?w=400',
      description: 'Samsung Galaxy S24 with advanced AI camera and all-day battery life.',
      sku: 'SG-S24-128',
      categoryID: 'CAT3',
      productType: 'ProductType.variable',
      brand: _samsung,
      images: [
        'https://images.unsplash.com/photo-1610945415295-d9bbf067e59c?w=400',
        'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=400',
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Color',   values: ['Phantom Black', 'Cream', 'Violet']),
        ProductAttributeModel(name: 'Storage', values: ['128GB', '256GB', '512GB']),
      ],
      productVariations: [
        ProductVariationModel(id: 'V1', stock: 8, price: 999,  salePrice: 899, sku: 'SG-S24-PB-128',
            image: 'https://images.unsplash.com/photo-1610945415295-d9bbf067e59c?w=400',
            description: 'Phantom Black 128GB', attributesValues: {'Color': 'Phantom Black', 'Storage': '128GB'}),
        ProductVariationModel(id: 'V2', stock: 5, price: 1099, salePrice: 999, sku: 'SG-S24-CR-256',
            image: 'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=400',
            description: 'Cream 256GB', attributesValues: {'Color': 'Cream', 'Storage': '256GB'}),
        ProductVariationModel(id: 'V3', stock: 3, price: 1299, salePrice: 1149, sku: 'SG-S24-VL-512',
            image: 'https://images.unsplash.com/photo-1610945415295-d9bbf067e59c?w=400',
            description: 'Violet 512GB', attributesValues: {'Color': 'Violet', 'Storage': '512GB'}),
      ],
    ),

    ProductModel(
      id: 'P010',
      title: 'Apple MacBook Air M2',
      stock: 10,
      price: 1299,
      salePrice: 1199,
      isFeatured: true,
      thumbnail: 'https://images.unsplash.com/photo-1611186871525-2b5e0f07e0e0?w=400',
      description: 'MacBook Air with Apple M2 chip — superfast, super thin, all day battery.',
      sku: 'AP-MBA-M2',
      categoryID: 'CAT3',
      productType: 'ProductType.variable',
      brand: _apple,
      images: [
        'https://images.unsplash.com/photo-1611186871525-2b5e0f07e0e0?w=400',
        'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=400',
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Color',   values: ['Midnight', 'Starlight', 'Space Grey']),
        ProductAttributeModel(name: 'Storage', values: ['256GB', '512GB', '1TB']),
      ],
      productVariations: [
        ProductVariationModel(id: 'V1', stock: 4, price: 1299, salePrice: 1199, sku: 'AP-MBA-MN-256',
            image: 'https://images.unsplash.com/photo-1611186871525-2b5e0f07e0e0?w=400',
            description: 'Midnight 256GB', attributesValues: {'Color': 'Midnight', 'Storage': '256GB'}),
        ProductVariationModel(id: 'V2', stock: 3, price: 1499, salePrice: 1399, sku: 'AP-MBA-SL-512',
            image: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=400',
            description: 'Starlight 512GB', attributesValues: {'Color': 'Starlight', 'Storage': '512GB'}),
        ProductVariationModel(id: 'V3', stock: 2, price: 1799, salePrice: 1699, sku: 'AP-MBA-SG-1TB',
            image: 'https://images.unsplash.com/photo-1611186871525-2b5e0f07e0e0?w=400',
            description: 'Space Grey 1TB', attributesValues: {'Color': 'Space Grey', 'Storage': '1TB'}),
      ],
    ),

    ProductModel(
      id: 'P011',
      title: 'Samsung 65" QLED TV',
      stock: 8,
      price: 1200,
      salePrice: 999,
      isFeatured: false,
      thumbnail: 'https://images.unsplash.com/photo-1593784991095-a205069533cd?w=400',
      description: '65-inch QLED 4K Smart TV with Quantum Dot technology for vivid colours.',
      sku: 'SG-TV-65Q',
      categoryID: 'CAT3',
      productType: 'ProductType.single',
      brand: _samsung,
      images: [
        'https://images.unsplash.com/photo-1593784991095-a205069533cd?w=400',
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['55"', '65"', '75"']),
      ],
    ),

    // ══════════════════════════════════════════════════════════
    // CAT4 — FURNITURE
    // ══════════════════════════════════════════════════════════

    ProductModel(
      id: 'P012',
      title: 'IKEA KALLAX Shelf Unit',
      stock: 15,
      price: 120,
      salePrice: 99,
      isFeatured: true,
      thumbnail: 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=400',
      description: 'Versatile shelf unit that can be used as a room divider or storage.',
      sku: 'IK-KLX-4X4',
      categoryID: 'CAT4',
      productType: 'ProductType.variable',
      brand: _ikea,
      images: [
        'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=400',
        'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400',
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['White', 'Black-Brown', 'Birch']),
        ProductAttributeModel(name: 'Size',  values: ['2x2', '4x4', '2x4']),
      ],
      productVariations: [
        ProductVariationModel(id: 'V1', stock: 6, price: 120, salePrice: 99,  sku: 'IK-KLX-WH-4X4',
            image: 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=400',
            description: 'White 4x4', attributesValues: {'Color': 'White', 'Size': '4x4'}),
        ProductVariationModel(id: 'V2', stock: 5, price: 120, salePrice: 99,  sku: 'IK-KLX-BB-4X4',
            image: 'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400',
            description: 'Black-Brown 4x4', attributesValues: {'Color': 'Black-Brown', 'Size': '4x4'}),
        ProductVariationModel(id: 'V3', stock: 4, price: 80,  salePrice: 65,  sku: 'IK-KLX-WH-2X2',
            image: 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=400',
            description: 'White 2x2', attributesValues: {'Color': 'White', 'Size': '2x2'}),
      ],
    ),

    ProductModel(
      id: 'P013',
      title: 'IKEA POÄNG Armchair',
      stock: 10,
      price: 200,
      salePrice: 169,
      isFeatured: true,
      thumbnail: 'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400',
      description: 'Classic armchair with birch veneer frame and comfortable cushion.',
      sku: 'IK-PON-ARM',
      categoryID: 'CAT4',
      productType: 'ProductType.variable',
      brand: _ikea,
      images: [
        'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400',
        'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=400',
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Cover Color', values: ['Beige', 'Dark Grey', 'Blue']),
      ],
      productVariations: [
        ProductVariationModel(id: 'V1', stock: 4, price: 200, salePrice: 169, sku: 'IK-PON-BE',
            image: 'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400',
            description: 'Beige cover', attributesValues: {'Cover Color': 'Beige'}),
        ProductVariationModel(id: 'V2', stock: 4, price: 200, salePrice: 169, sku: 'IK-PON-DG',
            image: 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=400',
            description: 'Dark Grey cover', attributesValues: {'Cover Color': 'Dark Grey'}),
        ProductVariationModel(id: 'V3', stock: 2, price: 200, salePrice: 169, sku: 'IK-PON-BL',
            image: 'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400',
            description: 'Blue cover', attributesValues: {'Cover Color': 'Blue'}),
      ],
    ),

    // ══════════════════════════════════════════════════════════
    // CAT5 — JEWELLERY
    // ══════════════════════════════════════════════════════════

    ProductModel(
      id: 'P014',
      title: 'Gold Diamond Ring',
      stock: 12,
      price: 350,
      salePrice: 299,
      isFeatured: true,
      thumbnail: 'https://images.unsplash.com/photo-1605100804763-247f67b3557e?w=400',
      description: 'Elegant 18K gold ring with a solitaire diamond centrepiece.',
      sku: 'JW-GDR-18K',
      categoryID: 'CAT5',
      productType: 'ProductType.variable',
      brand: BrandModel(id: 'B9', name: 'Luxe',
          image: 'https://upload.wikimedia.org/wikipedia/commons/a/a6/Logo_NIKE.svg'),
      images: [
        'https://images.unsplash.com/photo-1605100804763-247f67b3557e?w=400',
        'https://images.unsplash.com/photo-1599643478518-a784e5dc4c8f?w=400',
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Size',   values: ['5', '6', '7', '8']),
        ProductAttributeModel(name: 'Metal',  values: ['Yellow Gold', 'White Gold', 'Rose Gold']),
      ],
      productVariations: [
        ProductVariationModel(id: 'V1', stock: 4, price: 350, salePrice: 299, sku: 'JW-GDR-YG-6',
            image: 'https://images.unsplash.com/photo-1605100804763-247f67b3557e?w=400',
            description: 'Yellow Gold Size 6', attributesValues: {'Size': '6', 'Metal': 'Yellow Gold'}),
        ProductVariationModel(id: 'V2', stock: 4, price: 370, salePrice: 319, sku: 'JW-GDR-WG-7',
            image: 'https://images.unsplash.com/photo-1599643478518-a784e5dc4c8f?w=400',
            description: 'White Gold Size 7', attributesValues: {'Size': '7', 'Metal': 'White Gold'}),
        ProductVariationModel(id: 'V3', stock: 4, price: 360, salePrice: 309, sku: 'JW-GDR-RG-6',
            image: 'https://images.unsplash.com/photo-1605100804763-247f67b3557e?w=400',
            description: 'Rose Gold Size 6', attributesValues: {'Size': '6', 'Metal': 'Rose Gold'}),
      ],
    ),

    ProductModel(
      id: 'P015',
      title: 'Pearl Necklace Set',
      stock: 18,
      price: 180,
      salePrice: 149,
      isFeatured: false,
      thumbnail: 'https://images.unsplash.com/photo-1599643478518-a784e5dc4c8f?w=400',
      description: 'Classic freshwater pearl necklace and earring set.',
      sku: 'JW-PNS-01',
      categoryID: 'CAT5',
      productType: 'ProductType.single',
      brand: BrandModel(id: 'B9', name: 'Luxe',
          image: 'https://upload.wikimedia.org/wikipedia/commons/a/a6/Logo_NIKE.svg'),
      images: [
        'https://images.unsplash.com/photo-1599643478518-a784e5dc4c8f?w=400',
        'https://images.unsplash.com/photo-1605100804763-247f67b3557e?w=400',
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['White Pearl', 'Pink Pearl', 'Black Pearl']),
      ],
    ),

    // ══════════════════════════════════════════════════════════
    // CAT6 — COSMETICS
    // ══════════════════════════════════════════════════════════

    ProductModel(
      id: 'P016',
      title: 'Hydrating Face Serum',
      stock: 45,
      price: 55,
      salePrice: 44,
      isFeatured: true,
      thumbnail: 'https://images.unsplash.com/photo-1620916566398-39f1143ab7be?w=400',
      description: 'Vitamin C and hyaluronic acid serum for brighter, hydrated skin.',
      sku: 'CS-HFS-50ML',
      categoryID: 'CAT6',
      productType: 'ProductType.variable',
      brand: BrandModel(id: 'B10', name: 'GlowLab',
          image: 'https://upload.wikimedia.org/wikipedia/commons/a/a6/Logo_NIKE.svg'),
      images: [
        'https://images.unsplash.com/photo-1620916566398-39f1143ab7be?w=400',
        'https://images.unsplash.com/photo-1556228578-8c89e6adf883?w=400',
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['30ml', '50ml', '100ml']),
      ],
      productVariations: [
        ProductVariationModel(id: 'V1', stock: 20, price: 35, salePrice: 28, sku: 'CS-HFS-30ML',
            image: 'https://images.unsplash.com/photo-1620916566398-39f1143ab7be?w=400',
            description: '30ml bottle', attributesValues: {'Size': '30ml'}),
        ProductVariationModel(id: 'V2', stock: 15, price: 55, salePrice: 44, sku: 'CS-HFS-50ML',
            image: 'https://images.unsplash.com/photo-1556228578-8c89e6adf883?w=400',
            description: '50ml bottle', attributesValues: {'Size': '50ml'}),
        ProductVariationModel(id: 'V3', stock: 10, price: 90, salePrice: 75, sku: 'CS-HFS-100ML',
            image: 'https://images.unsplash.com/photo-1620916566398-39f1143ab7be?w=400',
            description: '100ml bottle', attributesValues: {'Size': '100ml'}),
      ],
    ),

    ProductModel(
      id: 'P017',
      title: 'Matte Lipstick Collection',
      stock: 60,
      price: 22,
      salePrice: 18,
      isFeatured: true,
      thumbnail: 'https://images.unsplash.com/photo-1586495777744-4e6232cc0b77?w=400',
      description: 'Long-lasting matte lipstick with rich pigment and moisturising formula.',
      sku: 'CS-MLC-01',
      categoryID: 'CAT6',
      productType: 'ProductType.variable',
      brand: BrandModel(id: 'B10', name: 'GlowLab',
          image: 'https://upload.wikimedia.org/wikipedia/commons/a/a6/Logo_NIKE.svg'),
      images: [
        'https://images.unsplash.com/photo-1586495777744-4e6232cc0b77?w=400',
        'https://images.unsplash.com/photo-1620916566398-39f1143ab7be?w=400',
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Shade', values: ['Ruby Red', 'Nude Pink', 'Berry', 'Coral']),
      ],
      productVariations: [
        ProductVariationModel(id: 'V1', stock: 20, price: 22, salePrice: 18, sku: 'CS-MLC-RR',
            image: 'https://images.unsplash.com/photo-1586495777744-4e6232cc0b77?w=400',
            description: 'Ruby Red', attributesValues: {'Shade': 'Ruby Red'}),
        ProductVariationModel(id: 'V2', stock: 15, price: 22, salePrice: 18, sku: 'CS-MLC-NP',
            image: 'https://images.unsplash.com/photo-1620916566398-39f1143ab7be?w=400',
            description: 'Nude Pink', attributesValues: {'Shade': 'Nude Pink'}),
        ProductVariationModel(id: 'V3', stock: 15, price: 22, salePrice: 18, sku: 'CS-MLC-BR',
            image: 'https://images.unsplash.com/photo-1586495777744-4e6232cc0b77?w=400',
            description: 'Berry', attributesValues: {'Shade': 'Berry'}),
        ProductVariationModel(id: 'V4', stock: 10, price: 22, salePrice: 18, sku: 'CS-MLC-CO',
            image: 'https://images.unsplash.com/photo-1620916566398-39f1143ab7be?w=400',
            description: 'Coral', attributesValues: {'Shade': 'Coral'}),
      ],
    ),

    ProductModel(
      id: 'P018',
      title: 'Daily SPF50 Sunscreen',
      stock: 80,
      price: 30,
      salePrice: 0,
      isFeatured: false,
      thumbnail: 'https://images.unsplash.com/photo-1556228578-8c89e6adf883?w=400',
      description: 'Lightweight daily sunscreen with SPF50 and broad-spectrum UVA/UVB protection.',
      sku: 'CS-SPF50-75ML',
      categoryID: 'CAT6',
      productType: 'ProductType.single',
      brand: BrandModel(id: 'B10', name: 'GlowLab',
          image: 'https://upload.wikimedia.org/wikipedia/commons/a/a6/Logo_NIKE.svg'),
      images: [
        'https://images.unsplash.com/photo-1556228578-8c89e6adf883?w=400',
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['50ml', '75ml']),
      ],
    ),
  ];
}