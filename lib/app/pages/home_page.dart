import 'package:anima_app/app/pages/components/card_component.dart';
import 'package:anima_app/app/pages/home_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  String v;

  Widget _start() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Center(
        child: Text(
          "Faça uma pesquisa no campo de texto acima.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _success() {
    return Container(
      margin: EdgeInsets.all(8),
      child: ListView.builder(
        itemCount: controller.animeList.length,
        itemBuilder: (context, index) {
          var anime = controller.animeList[index];
          return CardComponent(
            title: anime.title,
            episodes: anime.episodes,
            description: anime.description,
            imageUrl: anime.imageUrl,
          );
        },
      ),
    );
  }

  Widget _loading() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _error() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          controller.search(v);
        },
        child: Text("Tentar novamente"),
      ),
    );
  }

  Widget _stateManeger(HomeState state) {
    switch (state) {
      case HomeState.start:
        return _start();
      case HomeState.loading:
        return _loading();
      case HomeState.success:
        return _success();
      case HomeState.error:
        return _error();
      default:
        return _start();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          textInputAction: TextInputAction.search,
          onFieldSubmitted: (v) {
            controller.search(v);
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.search),
            hintText: "Pesquisar por anime...",
            hintStyle: TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: controller.state,
            builder: (_, __, ___) {
              return Expanded(child: _stateManeger(controller.state.value));
            },
          )
        ],
      ),
    );
  }
}
