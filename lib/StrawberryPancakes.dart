import 'package:flutter/material.dart';

class StrawberryPancakes extends StatefulWidget {
  const StrawberryPancakes({Key? key}) : super(key: key);

  @override
  _StrawberryPancakesState createState() => _StrawberryPancakesState();
}

class _StrawberryPancakesState extends State<StrawberryPancakes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1b1b1b),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xffdddddd),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, top: 10.0, bottom: 15.0),
                    child: Text(
                      'Strawberry Pancakes',
                      style: TextStyle(
                        fontSize: 50.0,
                        color: Color(0xffdddddd),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.description,
                      color: Color(0xffdddddd),
                    ),
                    title: Text(
                      'Easy',
                      style: TextStyle(
                        color: Color(0xffdddddd),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.schedule,
                      color: Color(0xffdddddd),
                    ),
                    title: Text(
                      '20 min',
                      style: TextStyle(
                        color: Color(0xffdddddd),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.whatshot_outlined,
                      color: Color(0xffdddddd),
                    ),
                    title: Text(
                      '150 calories',
                      style: TextStyle(
                        color: Color(0xffdddddd),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0, left: 15.0),
                    child: Text(
                      'Ingredients',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Color(0xffdddddd),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Transform(
                            transform:
                            Matrix4.translationValues(30.0, 0.0, 0.0),
                            child: IngredientsTile(
                              ingredientText: '2 eggs',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Transform(
                            transform:
                            Matrix4.translationValues(-30.0, 0.0, 0.0),
                            child: IngredientsTile(
                                ingredientText: '4 Strawberries'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Transform(
                            transform:
                            Matrix4.translationValues(30.0, 0.0, 0.0),
                            child:
                            IngredientsTile(ingredientText: '250 g flour'),
                          ),
                        ),
                        Expanded(
                          child: Transform(
                            transform:
                            Matrix4.translationValues(-30.0, 0.0, 0.0),
                            child:
                            IngredientsTile(ingredientText: '3 tbsp sugar'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, left: 15.0),
                    child: Text(
                      'Instructions',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Color(0xffdddddd),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, left: 15.0),
                    child: Column(
                      children: [
                        InstructionTile(
                            text:
                            'Mix flour, sugar, salt, baking powder and baking soda in a large mixing bowl.'),
                        InstructionTile(
                            text:
                            'In another bowl, whisk milk and egg together. Add butter and whisk until combined.'),
                        InstructionTile(
                            text:
                            'Add milk mixture to dry mixture and add vanilla. Whisk together until combined and most of the lumps are gone. Stir in strawberries.'),
                        InstructionTile(
                            text:
                            'Heat griddle to medium heat. Spray with cooking spray and pour batter on hot griddle. Flip and cook through. Repeat and enjoy!'),
                      ],),),],
              ),
              Positioned(
                top: 130.0,
                left: 215.0,
                child: ClipPath(
                  clipper: new CustomHalfCircleClipper(),
                  child: new Container(
                    height: 330.0,
                    width: 330.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(200.0),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1597699401474-e8714c1b7879?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHBhbmNha2VzfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80'),
                        fit: BoxFit.cover,
                      ),),
                  ),),),],
          ),),),);
  }
}

class CustomHalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = new Path();
    path.lineTo(size.width / 1.5, 0.0);
    path.lineTo(size.width / 1.5, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class InstructionTile extends StatefulWidget {
  final String text;
  const InstructionTile({required this.text});

  @override
  _InstructionTileState createState() => _InstructionTileState();
}

class _InstructionTileState extends State<InstructionTile> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 8.0),
      child: ListTile(
        leading: IconButton(
          icon: Icon(
              isPressed == false ? Icons.favorite_border : Icons.favorite,
              size: 18.0,
              color: Color(0xfffeb800)),
          onPressed: () {
            setState(() {
              isPressed = !isPressed;
            });
          },
        ),
        title: Text(
          '${widget.text}',
          style: TextStyle(
            color: Color(0xffdddddd),
            height: 1.5,
          ),
        ),
        minLeadingWidth: 10.0,
      ),);
  }
}

class IngredientsTile extends StatefulWidget {
  final String ingredientText;
  const IngredientsTile({required this.ingredientText});

  @override
  _IngredientsTileState createState() => _IngredientsTileState();
}

class _IngredientsTileState extends State<IngredientsTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.circle,
        color: Color(0xfffeb800),
        size: 10.0,
      ),
      title: Transform(
        transform: Matrix4.translationValues(0.0, -5.0, 0.0),
        child: Text(
          '${widget.ingredientText}',
          style: TextStyle(
            color: Color(0xffdddddd),
          ),),),
      minLeadingWidth: 10.0,
    );
  }
}


