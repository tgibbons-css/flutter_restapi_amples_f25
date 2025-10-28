# flutter_restapi_amples_f25

Here is a completed sample flutter_restapi_test_f23  that uses data from

Sample JSON data: jsonplaceholder.typicode.com
MLB Baseball Team data: statsapi.mlb.com
Pokemon Card data: api.pokemontcg.io

Each API has its own data model class that was created with QuickType.io and the http restful calls are collected in the MyRestAPI.

In main.dart, the API calls are made in initState() and this Futures are then stored. The Futures are processed in widgets for each.  To display different data, uncomment the widget in the Scaffold--Only one widget can be displayed at a time.

home: Scaffold(
appBar: AppBar(
title: const Text('Fetch Data Example'),
),
body:
albumFutureBuilder(),
//PokemonCardWidget(),
//BaseballTeamWidget(),
),