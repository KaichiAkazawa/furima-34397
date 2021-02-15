function price () {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const addTaxPrice = document.getElementById("add-tax-price");
    const addTaxPriceValue = Math.floor(itemPrice.value * 0.1);
    const profit = document.getElementById("profit");
    const profitValue = itemPrice.value - addTaxPriceValue;
    addTaxPrice.innerHTML = addTaxPriceValue;
    profit.innerHTML = profitValue;
  });
};

window.addEventListener('load', price);