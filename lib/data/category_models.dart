class CategoryModels {
  CategoryModels({
    required this.image,
    required this.text,
    required this.description,
    required this.price,
  });
  final String image;
  final String text;
  final String description;
  final String price;
}

CategoryModels margarita = CategoryModels(
    image: 'assets/margarita.webp',
    text: 'Маргарита',
    description:
        'Увеличенная порция моцареллы, \nтоматы, \nитальянские травы, \nтоматный соус',
    price: '445 c');
CategoryModels pepperoni = CategoryModels(
    image: 'assets/pepperoni.jpg',
    text: 'Пепперони',
    description:
        'Пепперони из цыпленка, \nувеличенная порция моцареллы, \nтоматный соус',
    price: '645 c');
CategoryModels aziat = CategoryModels(
    image: 'assets/aziat.jpg',
    text: 'Азиатская',
    description: '',
    price: '695 c');
CategoryModels fourcheese = CategoryModels(
    image: 'assets/4cheese.jpg',
    text: 'Четыре сыра',
    description: '',
    price: '695 c');
CategoryModels cezar = CategoryModels(
    image: 'assets/cezar.webp',
    text: 'Цезарь',
    description: '',
    price: '650 c');
CategoryModels mexico = CategoryModels(
    image: 'assets/mexico.jpg',
    text: 'Мексиканская',
    description: '',
    price: '675 c');

List<CategoryModels> categoryList = [
  margarita,
  pepperoni,
  aziat,
  fourcheese,
  cezar,
  mexico,
];
