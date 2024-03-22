import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../State/MyAppState.dart';
import '../../Widgets/SmallCard.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var appState = context.watch<MyAppState>();
    var favorites = appState.favorites;

    return Scaffold(
        appBar: AppBar(
            title: Title(color: theme.primaryColor, child: Text("Favorites"))),
        body: favorites.isEmpty
            ? Center(
                child: Text(
                "No Words",
                style: theme.textTheme.bodyLarge,
              ))
            : ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        print("Selected Index: $index");
                        appState.removeFavorite(index);
                      },
                      child: Center(child: SmallCard(pair: favorites[index])));
                }));
  }
}
