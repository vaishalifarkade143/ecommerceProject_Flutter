class TPricingCalculator {
  static double calculateTotalPrice(double productPrice, String location) {
    // Calculate tax amount
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    double shoppingCost = getShippingCost(location);

    double totalPrice = productPrice + taxAmount + shoppingCost;
    return totalPrice;
  }

//calculate tax rate based on location
  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

// Get tax rate based on location
  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location) {
    return 0.10;
  }

  static double getShippingCost(String location) {
    return 5.00; // Flat shipping cost for simplicity
  }

  //sum all cart values and return total amount
  // static double calculateCartTotal(CartModel cart) {
  //   return cart.item.map((e)=> e.price).fold(0,(previousPrice,currentPrice)=>
  //     previousPrice + currentPrice);
  // }
}
