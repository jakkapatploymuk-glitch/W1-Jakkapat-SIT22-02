import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => const MyHomePage(),
        '/second' : (context) => const SecondPage()
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.amberAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "ข้อมูลส่วนตัว",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue[400],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(80),
                      ),
                      child: ClipOval(
                        child: Image.network(
                          "https://e-sis.e-tech.ac.th/etech/Moduls/studentPhotos/photo/2567/6721619167324.jpg",
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Text("Jakkapat Ploymuk", style: TextStyle(fontSize: 28)),
                    Text(
                      "jakkapat.ploymuk@e-tech.ac.th",
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xFF5EFF5E),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.phone,
                          size: 50,
                          color: Color(0xFF00B700),
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text("เบอร์"), Text("099-420-1084")],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/second'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF7A00),
                      foregroundColor: Color(0xFFFFFFFF),
                    ),
                    child: Text("Change Page"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("SecondPage")));
  }
}
