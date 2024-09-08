import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Horário 2ªIM01-SGT',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HorarioScreen(),
    );
  }
}

class HorarioScreen extends StatefulWidget {
  @override
  _HorarioScreenState createState() => _HorarioScreenState();
}

class _HorarioScreenState extends State<HorarioScreen> {
  // Definir o horário das aulas para cada dia da semana
  final Map<String, List<Map<String, String>>> horarioAulas = {
    "Monday": [
      {"aula": "Português (13)", "horario": "07:00 - 07:50"},
      {"aula": "História (10)", "horario": "07:50 - 08:40"},
      {"aula": "Aline (10)", "horario": "08:40 - 09:25"},
      {"aula": "Intervalo", "horario": "09:30 - 09:50"},
      {"aula": "Eletiva", "horario": "09:50 - 10:40"},
      {"aula": "Eletiva", "horario": "10:40 - 11:30"},
      {"aula": "Almoço", "horario": "11: - 12:20"},
      {"aula": "Psicologia (04)", "horario": "12:20 - 13:10"},
      {"aula": "Psicologia (04)", "horario": "13:10 - 14:00"}
    ],
    "Tuesday": [
      {"aula": "Física (03)", "horario": "07:00 - 07:50"},
      {"aula": "Aline (13)", "horario": "07:50 - 08:40"},
      {"aula": "Português (13)", "horario": "08:40 - 09:30"},
      {"aula": "Intervalo", "horario": "09:25 - 09:50"},
      {"aula": "Português (13)", "horario": "09:50 - 10:40"},
      {"aula": "Matemática (02)", "horario": "10:40 - 11:30"},
      {"aula": "Almoço", "horario": "11:25 - 12:20"},
      {"aula": "Biologia (13)", "horario": "12:20 - 13:10"},
      {"aula": "Química (10)", "horario": "13:10 - 14:00"}
    ],
    "Wednesday": [
      {"aula": "Geografia (11)", "horario": "07:00 - 07:50"},
      {"aula": "IPISEG (04)", "horario": "07:50 - 08:40"},
      {"aula": "IPISEG (04)", "horario": "08:40 - 09:30"},
      {"aula": "Intervalo", "horario": "09:25 - 09:50"},
      {"aula": "Estudo Orientado (03)", "horario": "09:50 - 10:40"},
      {"aula": "Geografia (11)", "horario": "10:40 - 11:30"},
      {"aula": "Almoço", "horario": "11:25 - 12:20"},
      {"aula": "Ergonomia (04)", "horario": "12:20 - 13:10"},
      {"aula": "Ergonomia (04)", "horario": "13:10 - 14:00"}
    ],
    "Thursday": [
      {"aula": "Cultura Digital (05)", "horario": "07:00 - 07:50"},
      {"aula": "Cultura Digital (05)", "horario": "07:50 - 08:40"},
      {"aula": "Matemática (02)", "horario": "08:40 - 09:30"},
      {"aula": "Intervalo", "horario": "09:25 - 09:50"},
      {"aula": "Matemática (02)", "horario": "09:50 - 10:40"},
      {"aula": "Física (03)", "horario": "10:40 - 11:30"},
      {"aula": "Almoço", "horario": "11:25 - 12:20"},
      {"aula": "Praticas Exp (Lab)", "horario": "12:20 - 13:10"},
      {"aula": "Química (06)", "horario": "13:10 - 14:00"}
    ],
    "Friday": [
      {"aula": "Matemática (02)", "horario": "07:00 - 07:50"},
      {"aula": "Saúde Ocupacional (12)", "horario": "07:50 - 08:40"},
      {"aula": "Saúde Ocupacional (12)", "horario": "08:40 - 09:30"},
      {"aula": "Intervalo", "horario": "09:25 - 09:50"},
      {"aula": "História (10)", "horario": "09:50 - 10:40"},
      {"aula": "Biologia (14)", "horario": "10:40 - 11:30"},
      {"aula": "Almoço", "horario": "11:25 - 12:20"},
      {"aula": "Português (13)", "horario": "12:20 - 13:10"},
      {"aula": "Projeto de Vida (01)", "horario": "13:10 - 14:00"}
    ]
  };

  // Pega o dia atual
  DateTime currentDate = DateTime.now();

  // Função para avançar um dia
  void nextDay() {
    setState(() {
      currentDate = currentDate.add(Duration(days: 1));
    });
  }

  // Função para voltar um dia
  void previousDay() {
    setState(() {
      currentDate = currentDate.subtract(Duration(days: 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    // Formatar o dia da semana
    String diaAtual = DateFormat('EEEE').format(currentDate);

    // Obter as aulas do dia atual
    List<Map<String, String>>? aulasDoDia = horarioAulas[diaAtual];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Horário de Aulas - $diaAtual',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: previousDay,
                  icon: Icon(Icons.arrow_back),
                  label: Text('Dia Anterior'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    onPrimary: Colors.white,
                    textStyle: TextStyle(fontSize: 16),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: nextDay,
                  icon: Icon(Icons.arrow_forward),
                  label: Text('Próximo Dia'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    onPrimary: Colors.white,
                    textStyle: TextStyle(fontSize: 16),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: aulasDoDia != null
                ? ListView.builder(
                    itemCount: aulasDoDia.length,
                    itemBuilder: (context, index) {
                      var aula = aulasDoDia[index];
                      return Card(
                        elevation: 4,
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text(
                              "${index + 1}",
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.teal,
                          ),
                          title: Text(
                            aula['aula']!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          subtitle: Text(
                            "Horário: ${aula['horario']}",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                          ),
                          trailing: Icon(Icons.schedule, color: Colors.teal),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text(
                      'Não tem aula hoje!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}