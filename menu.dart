import 'package:flutter/material.dart';
import 'item.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<MenuItem> allMenuItems = [
     MenuItem(
                    image: 'lib/images/saging.jpg',
                    title: 'Mac & Cheese Burger',
                    price: 'P109.00',
                    description:
                        'A popular dish consisting of a cooked patty of ground meat, typically beef, placed inside a sliced bun or bread roll, often with various toppings and condiments. ',
                    rating: 4.8,
                  ),
                  MenuItem(
                    image: 'lib/images/fries.jpeg',
                    title: 'Fries',
                    price: 'P59.00',
                    description:
                        'Crispy, golden-brown, and perfectly seasoned, our French fries are a classic comfort food, offering a satisfying crunch and savory flavor.',
                    rating: 4.7,
                  ),
                  MenuItem(
                    image: 'lib/images/hale.jpg',
                    title: 'Halo-halo',
                    price: 'P99.00',
                    description:
                        'A colorful and refreshing Filipino dessert, Halo-Halo is a mix of shaved ice, sweetened fruits, jellies, and beans, topped with leche flan, ube ice cream, and a drizzle of syrup. The ultimate sweet treat, perfect for cooling down on a warm day.',
                    rating: 4.8,
                  ),
                  MenuItem(
                    image: 'lib/images/adobo.jpg',
                    title: 'Adobong Manok',
                    price: 'P150.00',
                    description:
                        'A traditional Filipino dish, Adobong Manok features chicken simmered in a rich, tangy sauce of soy sauce, vinegar, garlic, and spices. Slow-cooked to perfection, this savory dish is an unforgettable classic that packs bold flavors.',
                    rating: 4.9,
                  ),
                  MenuItem(
                    image: 'lib/images/bbq.jpg',
                    title: 'Grilled chicken',
                    price: 'P125.00',
                    description:
                        'Tender, juicy chicken marinated in a flavorful blend of herbs and spices, then perfectly grilled to a golden finish. Served with a side of your choice, this dish is the perfect combination of smoky and savory.',
                    rating: 4.0,
                  ),
                  MenuItem(
                    image: 'lib/images/spaghetti.jpg',
                    title: 'Special Spaghetti',
                    price: 'P99.00',
                    description:
                        'A Filipino twist on the classic spaghetti, our Special Spaghetti is a delicious combination of sweet, savory sauce with ground meat, hotdog slices, and grated cheese. It’s a comforting, crowd-pleasing dish that brings a burst of flavor in every bite.',
                    rating: 4.6,
                  ),
                  MenuItem(
                    image: 'lib/images/bangus.jpg',
                    title: 'Fried BAngus',
                    price: 'P120.00',
                    description:
                        'Crispy fried milkfish, typically marinated in a blend of spices, vinegar, and soy sauce.',
                    rating: 5,
                  ),
                  MenuItem(
                    image: 'lib/images/buko.jpg',
                    title: 'Buko Salad',
                    price: 'P159.00',
                    description:
                        'A refreshing Filipino dessert made with young coconut (buko) strips, mixed with fruits like pineapple and nata de coco, and dressed in a sweet, creamy dressing. It’s a light, tropical treat.',
                    rating: 4.9,
                  ),
                  MenuItem(
                    image: 'lib/images/pizza.jpg',
                    title: 'Pizza Overload',
                    price: 'P350.00',
                    description:
                        ' A pizza with an extra generous topping of ingredients like cheese, meats, vegetables, and sauces, creating a flavor-packed, indulgent dish.',
                    rating: 4.8,
                  ),
                  MenuItem(
                    image: 'lib/images/lugaw.jpg',
                    title: 'Lugaw Overload',
                    price: 'P89.00',
                    description:
                        'A hearty and flavorful Filipino rice porridge topped with various savory ingredients like boiled egg, fried garlic, chicharrón (crispy pork skin), and sometimes even meats like chicken or pork, making it a filling meal.',
                    rating: 4.8,
                  ),
                   MenuItem(
                    image: 'lib/images/choco.jpeg',
                    title: 'Chocolate Cookies',
                    price: 'P249.00',
                    description:
                        'Soft, chewy cookies packed with rich, gooey chocolate for a delicious treat.',
                    rating: 5,
                  ),
                   MenuItem(
                    image: 'lib/images/leche.jpg',
                    title: 'Leche Flan',
                    price: 'P189.00',
                    description:
                        'A silky smooth, caramelized custard dessert thats creamy and melt-in-your-mouth delicious.',
                    rating: 4.7,
                  ),
                   MenuItem(
                    image: 'lib/images/cassava.jpg',
                    title: 'Cassava Cake',
                    price: 'P329.00',
                    description:
                        'A rich, sweet Filipino dessert made from grated cassava, coconut milk, and a creamy topping.',
                    rating: 4.7,
                  ),
                   MenuItem(
                    image: 'lib/images/footlong.jpg',
                    title: 'Footlong',
                    price: 'P99.00',
                    description:
                        ' A hearty, savory sandwich loaded with flavorful fillings, perfect for a satisfying meal.',
                    rating: 4.7,
                  ),
                  MenuItem(
                    image: 'lib/images/sisig.jpg',
                    title: 'Sisig',
                    price: 'P149.00',
                    description:
                        'A savory, tangy dish made from crispy pork, seasoned with onions, chili, and a hint of lime.',
                    rating: 4.9,
                  ),
                  MenuItem(
                    image: 'lib/images/crinkle.jpg',
                    title: 'Crinkle Cookies',
                    price: 'P210.00',
                    description:
                        'Powdered sugar-coated cookies with a crackly exterior and a soft, fudgy center.',
                    rating: 4.8,
                  ),
                  ];
   

  List<MenuItem> displayedMenuItems = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    displayedMenuItems = List.from(allMenuItems);
  }

  void filterMenuItems(String query) {
    setState(() {
      if (query.isEmpty) {
        displayedMenuItems = List.from(allMenuItems);
      } else {
        displayedMenuItems = allMenuItems
            .where((item) =>
                item.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Our menu",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Color(0xFFFFEBCC),
        automaticallyImplyLeading: false,
       
      ),
      backgroundColor: Color(0xFFFFEBCC),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: searchController,
              onChanged: filterMenuItems,
              decoration: InputDecoration(
                labelText: 'Search foods',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: displayedMenuItems,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String description;
  final double rating;

  MenuItem({
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetailsScreen(
              item: this, 
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFDE59),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(price),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.favorite_border),
              ),
            ),
          ],
        ),
      ),
    );
  }
}