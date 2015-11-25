Image.create!([
  {product_id: 1, image_url: "https://s3.amazonaws.com/rapgenius/filepicker%2F5xex6o6kQKG64PNtjNtB_cabernet_sauvignon.jpg"},
  {product_id: 2, image_url: "https://img.thewhiskyexchange.com/540/macob.12yo.jpg"},
  {product_id: 3, image_url: "http://schlafly.com/uploads/2014/05/23/summerlager.png"},
  {product_id: 4, image_url: "http://ei.isnooth.com/multimedia/0/5/c/image_94965.jpeg"},
  {product_id: 5, image_url: "http://assets-s3.mensjournal.com/img/essential/a-syrah-to-fall-for/298_398_a-syrah-to-fall-for.jpg"},
  {product_id: 6, image_url: "http://www.yardsbrewing.com/sites/default/files/images/IPA_B%2BD.png"},
  {product_id: 7, image_url: "http://cognacwiki.com/wp-content/uploads/R%C3%A9my-Martin-Coeur-de-Cognac.jpg"},
  {product_id: 1, image_url: "http://www.cakebread.com/system/uploads/wine/small_bottle_image/9/Sized_CS_bottleSmall.png"},
  {product_id: 8, image_url: "http://www.jackdaniels.com/sites/default/files/MD1_small.png"},
  {product_id: 9, image_url: "http://www.fooduniversity.com/foodu/seafood_c/resources/shellfish/crab/StoneCrab.gif"}
])
Order.create!([
  {user_id: nil, product_id: nil, quantity: 4564564, subtotal: nil, tax: nil, total: nil},
  {user_id: nil, product_id: nil, quantity: 4564564, subtotal: nil, tax: nil, total: nil},
  {user_id: nil, product_id: nil, quantity: 666, subtotal: nil, tax: nil, total: nil},
  {user_id: nil, product_id: nil, quantity: 666, subtotal: nil, tax: nil, total: nil},
  {user_id: nil, product_id: nil, quantity: 666, subtotal: nil, tax: nil, total: nil},
  {user_id: nil, product_id: nil, quantity: 666, subtotal: nil, tax: nil, total: nil},
  {user_id: nil, product_id: nil, quantity: 666, subtotal: nil, tax: nil, total: nil},
  {user_id: nil, product_id: nil, quantity: 666, subtotal: nil, tax: nil, total: nil},
  {user_id: nil, product_id: nil, quantity: 666, subtotal: nil, tax: nil, total: nil},
  {user_id: nil, product_id: nil, quantity: 434, subtotal: nil, tax: nil, total: nil},
  {user_id: nil, product_id: nil, quantity: 5, subtotal: nil, tax: nil, total: nil},
  {user_id: nil, product_id: nil, quantity: 3, subtotal: nil, tax: nil, total: nil},
  {user_id: nil, product_id: nil, quantity: 5, subtotal: nil, tax: nil, total: nil},
  {user_id: nil, product_id: nil, quantity: 2, subtotal: nil, tax: nil, total: nil}
])
Product.create!([
  {item: "Red Wine", description: "Cabernet", size: "750", price: "25.0", in_stock: true, supplier_id: 1, user_id: 1},
  {item: "Whiskey", description: "McCallan", size: "750", price: "65.0", in_stock: true, supplier_id: 3, user_id: 1},
  {item: "Beer", description: "Lager", size: "375", price: "7.0", in_stock: true, supplier_id: 1, user_id: 1},
  {item: "White Wine", description: "Chardonnay", size: "750", price: "20.0", in_stock: true, supplier_id: 2, user_id: 1},
  {item: "Red Wine", description: "Syrah", size: "750", price: "90.0", in_stock: true, supplier_id: 2, user_id: 1},
  {item: "Beer", description: "IPA", size: "375", price: "10.0", in_stock: true, supplier_id: 2, user_id: 1},
  {item: "Cognac", description: "Remy Martin", size: "75", price: "80.0", in_stock: true, supplier_id: 1, user_id: 1},
  {item: "Whiskey", description: "Jack Daniels", size: "700", price: "40.0", in_stock: true, supplier_id: 3, user_id: 1}
])
Supplier.create!([
  {name: "Robert Sinskey", email: "rs@gmail.com", phone: "232-989-5433"},
  {name: "Beringer", email: "ber@yahoo.com", phone: "989-787-6567"},
  {name: "McCallan", email: "mc@gmail.com", phone: "323-688-0909"}
])
