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
      // กำหนดธีมสีหลัก
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // กำหนดเส้นทางเริ่มต้นของแอป
      initialRoute: '/',
      // กำหนดแผนที่เส้นทางสำหรับนำทาง
      routes: {
        '/': (context) => const MyHomePage(), // หน้าจอหลัก
        '/second': (context) => const SecondPage(), // หน้าจอที่สอง
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // องค์ประกอบหลักของหน้าจอ
      body: SafeArea(
        // ทำให้เนื้อหาอยู่ภายในขอบเขตที่ปลอดภัย
        child: Column(
          // จัดเรียงวิดเจ็ตในแนวตั้ง
          children: [
            // === ส่วนหัว: ข้อมูลส่วนตัว ===
            Container(
              decoration: BoxDecoration(
                color: Colors.amberAccent, // สีพื้นหลัง
                borderRadius: BorderRadius.circular(20), // ขอบโค้งมน
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
                    // กรอบรูปโปรไฟล์
                    Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(80),
                      ),
                      child: ClipOval(
                        // ตัดรูปให้เป็นวงกลม
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
            // === ส่วนรายละเอียด: เบอร์, วันเกิด, ที่อยู่, การศึกษา ===
            Container(
              padding: EdgeInsets.all(16.0), // เพิ่มระยะห่างรอบนอก
              child: Column(
                // รายละเอียดแต่ละรายการจัดใน Column ย่อย
                children: [
                  // รายการที่ 1: เบอร์โทรศัพท์
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
                        children: [const Text("เบอร์"), const Text("099-420-1084")],
                      ),
                    ],
                  ),
                  SizedBox(height: 10), // เพิ่มระยะห่างระหว่างรายการ
                  // รายการที่ 2: วันเกิด
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xFFE18EBB),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.cake,
                          size: 50,
                          color: Color(0xFFB3009E),
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [const Text("วันเกิด"), const Text("7 พฤศจิกายน 2005")],
                      ),
                    ],
                  ),
                  SizedBox(height: 10), // เพิ่มระยะห่างระหว่างรายการ
                  // รายการที่ 3: ที่อยู่
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xFFF6B1A2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.location_pin,
                          size: 50,
                          color: Color(0xFFDC5200),
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [const Text("ที่อยู่า"), const Text("ฉะเชิงเทรา")],
                      ),
                    ],
                  ),
                  SizedBox(height: 10), // เพิ่มระยะห่างระหว่างรายการ
                  // รายการที่ 4: การศึกษา
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xFF7AA2ED),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.school,
                          size: 50,
                          color: Color(0xFF0006DC),
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [const Text("การศึกษา"), const Text("วิทยาลัยเทคโนโลยีภาคตะวันออก(อี.เทค)")],
                      ),
                    ],
                  ),
                  SizedBox(height: 20), // เพิ่มระยะห่างก่อนปุ่ม
                  // ปุ่มนำทางไปหน้า 2
                  ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/second'), // นำทางไป '/second'
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF7A00),
                      foregroundColor: const Color(0xFFFFFFFF),
                    ),
                    child: const Text("ไปที่หน้า 2"),
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
    return Scaffold(
      backgroundColor: Colors.white,
      // AppBar ด้านบน
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // ปุ่มย้อนกลับ
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context), // กลับไปหน้าจอก่อนหน้า
        ),
        title: const Text(
          'MyApp',
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // === ส่วนหัวโปรไฟล์และสถิติ ===
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // รูปโปรไฟล์
                const CircleAvatar(
                  radius: 42,
                  backgroundImage: NetworkImage(
                    'https://e-sis.e-tech.ac.th/etech/Moduls/studentPhotos/photo/2567/6721619167324.jpg',
                  ),
                ),
                const SizedBox(width: 16),
                // สถิติ: กำลังติดตาม, ผู้ติดตาม, ถูกใจ
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatColumn('108', 'กำลังติดตาม'),
                      _buildStatColumn('34.2 K', 'ผู้ติดตาม'),
                      _buildStatColumn('20', 'ถูกใจเฉลี่ยต่อวัน'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // ชื่อและ Username
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text(
                  'Jakkapat2548',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 4),
              ],
            ),
          ),
          // ชื่อบัญชีโซเชียลมีเดีย
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
            child: Row(
              children: [
                const Icon(Icons.tiktok, size: 16), // จำลองไอคอน
                const SizedBox(width: 4),
                Text(
                  'jakkaphatpee2548',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.arrow_drop_down, size: 16),
              ],
            ),
          ),
          // === ปุ่ม 'ติดตาม' และ 'แชร์' ===
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE62860), // สีปุ่มติดตาม
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: const Text(
                      'ติดตาม',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.share_outlined),
                  style: IconButton.styleFrom(
                    side: BorderSide(color: Colors.grey[300]!),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // === ส่วนตารางรูปภาพ (Photo Grid) ===
          Expanded(
            // ทำให้ GridView กินพื้นที่ที่เหลือทั้งหมด
            child: GridView.builder(
              padding: const EdgeInsets.all(2),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 คอลัมน์
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                childAspectRatio: 0.75, // อัตราส่วนความกว้างต่อความสูงของรายการ
              ),
              itemCount: 6, // จำนวนรายการในตาราง
              itemBuilder: (context, index) {
                // รายการ URL รูปภาพ
                final imageUrls = [
                  'https://cdn.pixabay.com/photo/2019/11/18/00/38/dog-4633734_1280.jpg',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcBRUZcqmG04M_DZU0rpKdqHrgsTeXx5KVYA&s',
                  'https://www.novotelbkk.com/wp-content/uploads/sites/62/2016/11/Destination-Temple-of-the-Dawn.jpg',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmaoQC7sp_k03unaETFclRCe6AiolUVHsXoQ&s',
                  'https://cdn.pixabay.com/photo/2023/07/04/08/31/cats-8105667_960_720.jpg',
                  'https://i.natgeofe.com/n/0e2905b8-76a1-431e-9bd7-2d9f65b4eb90/DXB720.jpg',
                ];

                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(
                      imageUrls[index],
                      fit: BoxFit.cover,
                      // แสดงผลเมื่อโหลดรูปภาพล้มเหลว
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.error_outline, color: Colors.grey[400]),
                              const SizedBox(height: 8),
                              Text(
                                'Image failed to load',
                                style: TextStyle(color: Colors.grey[600], fontSize: 12),
                              ),
                            ],
                          ),
                        );
                      },
                      // แสดงผลเมื่อกำลังโหลดรูปภาพ
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // วิดเจ็ตตัวช่วยสำหรับสร้างคอลัมน์สถิติ (ใช้ซ้ำได้)
  Widget _buildStatColumn(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}