function price () {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    const addTaxPriceValue = itemPrice.value * 0.1;
    const priceValue = itemPrice.value - addTaxPriceValue;
    addTaxPrice.innerHTML = addTaxPriceValue;
    profit.innerHTML = priceValue;
  });
};

window.addEventListener('load', price);