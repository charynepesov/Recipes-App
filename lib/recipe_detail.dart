import 'package:flutter/material.dart';
import 'package:recipes/recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetail({super.key, required this.recipe});

  @override
  State<RecipeDetail> createState() {
    return _RecipeDetailState();
  }
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.recipe.imageUrl),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.recipe.label,
              style: const TextStyle(fontSize: 18),
            ),
            Expanded(
                child: ListView.builder(
              padding: const EdgeInsets.all(7.0),
              itemCount: widget.recipe.ingredients.length,
              itemBuilder: (context, index) {
                final ingredient = widget.recipe.ingredients[index];
                return Text(
                    '${ingredient.quantity * _sliderValue} ${ingredient.measure} ${ingredient.name}');
              },
            )),
            Slider.adaptive(
              activeColor: Colors.green,
              divisions: 9,
              inactiveColor: Colors.black,
              label: '${_sliderValue * widget.recipe.servings} servings',
              max: 10,
              min: 1,
              value: _sliderValue.toDouble(),
              onChanged: (value) {
                setState(() {
                  _sliderValue = value.round();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
