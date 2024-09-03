import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jodo da Memória Bíblico',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Jodo da Memória - 10 Mandamentos'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> commandments = [
    'Não terás outros Deuses',
    'Não farás para ti imagem de escultura',
    'Não dirás o nome de Deus em vão',
    'Lembra-te do dia de sábado',
    'Honra teu pai e tua mãe',
    'Não matarás',
    'Não adulterarás',
    'Não furtarás',
    'Não dirás falso testemunho',
    'Não cobiçarás',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 8.0,
            runSpacing: 8.0,
            children: commandments.map((comm){return CardCommandment(commandment: comm);}).toList(),
          ),
        ),
      ),
    );
  }
}

class CardCommandment extends StatefulWidget {
  const CardCommandment({super.key, required this.commandment});
  final String commandment;

  @override
  State<CardCommandment> createState() => _CardCommandmentState();
}

class _CardCommandmentState extends State<CardCommandment> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: AnimatedContainer(
        width: selected ? 90  : 90,
        height: selected ? 120 : 120,
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: Colors.lightGreen, width: 2.0),
          color: selected ? Colors.white : Colors.green.shade900,
        ),
        // color: selected ? Colors.amber : Colors.white,
        duration: const Duration(milliseconds: 100),
        child: Center(
          child: Text(
            selected ? widget.commandment : '',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
