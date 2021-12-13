# category
Category.create!(name: "Category 1")
20.times do |n|
  nameCategory = "Category #{n+1}"
  parent_idCate = n
  Category.create!(name: nameCategory)
end
  
# product
20.times do |n|
  category_idProduct = rand(1..20)
  nameProduct = "Product #{n}"
  imageProduct= "/assets/ao-dai-nu-ad109-mau-cam-in-hoa-tiet-lg"
  priceProduct = n*12300
  create_date_Product="2021-12-10"
  quantityProduct = n*10
  residual = n*10
  Product.create!(
    category_id: category_idProduct,
    name: nameProduct,
    image: imageProduct,
    price: priceProduct,
    create_date: create_date_Product,
    quantity: quantityProduct,
    residual: residual
    )
end
