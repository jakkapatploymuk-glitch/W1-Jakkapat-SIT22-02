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
        // Use a more modern and consistent color scheme
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/second': (context) => const SecondPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ข้อมูลส่วนตัว'),
        backgroundColor: Colors.amber,
      ),
      body: SafeArea(
        child: SingleChildScrollView( // Added SingleChildScrollView to prevent overflow
          child: Padding(
            padding: const EdgeInsets.all(16.0), // Added padding for the entire content
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch columns horizontally
              children: [
                // --- ส่วนหัวโปรไฟล์ (Profile Header) ---
                Container(
                  decoration: BoxDecoration(
                    color: Colors.amber.shade100, // Lighter amber background
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "ข้อมูลส่วนตัว",
                          style: TextStyle(
                            fontSize: 40, // Slightly reduced font size for better fit
                            fontWeight: FontWeight.w700,
                            color: Colors.blue.shade800, // Darker blue for contrast
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Profile Picture Container
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(80),
                            border: Border.all(color: Colors.blue.shade300, width: 4), // Added border
                          ),
                          child: ClipOval(
                            child: Image.network(
                              // Using the provided image URL
                              "https://e-sis.e-tech.ac.th/etech/Moduls/studentPhotos/photo/2567/6721619167324.jpg",
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Jakkapat Ploymuk",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "jakkapat.ploymuk@e-tech.ac.th",
                          style: TextStyle(
                            fontSize: 18, // Reduced email font size
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 25), // Spacing between profile header and info list

                // --- ส่วนรายการข้อมูลติดต่อ (Contact Info List) ---
                Column(
                  children: [
                    // Phone Row
                    _buildInfoRow(
                      icon: Icons.phone,
                      iconBgColor: const Color(0xFFE0F7FA), // Light Cyan
                      iconColor: const Color(0xFF00BCD4), // Cyan
                      label: "เบอร์",
                      value: "099-420-1084",
                    ),
                    const SizedBox(height: 15), // Spacing between rows

                    // Birthday Row
                    _buildInfoRow(
                      icon: Icons.cake,
                      iconBgColor: const Color(0xFFFCE4EC), // Light Pink
                      iconColor: const Color(0xFFE91E63), // Pink
                      label: "วันเกิด",
                      value: "7 พฤศจิกายน 2005",
                    ),
                    const SizedBox(height: 15),

                    // Location Row
                    _buildInfoRow(
                      icon: Icons.location_pin,
                      iconBgColor: const Color(0xFFFFF3E0), // Light Orange
                      iconColor: const Color(0xFFFF9800), // Orange
                      label: "ที่อยู่",
                      value: "ฉะเชิงเทรา",
                    ),
                    const SizedBox(height: 15),

                    // Education Row
                    _buildInfoRow(
                      icon: Icons.school,
                      iconBgColor: const Color(0xFFE3F2FD), // Light Blue
                      iconColor: const Color(0xFF2196F3), // Blue
                      label: "การศึกษา",
                      value: "วิทยาลัย(อี.เทค)",
                    ),

                    const SizedBox(height: 30),

                    // Navigation Button
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/second'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF7A00), // Orange color
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 5,
                      ),
                      child: const Text(
                        "ไปที่หน้า 2",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build a consistent information row
  Widget _buildInfoRow({
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: iconBgColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            size: 30, // Reduced icon size slightly
            color: iconColor,
          ),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// --- SecondPage is kept the same as it seems to be styled as a social media profile ---
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'MyApp',
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Profile Header
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Profile Picture
                const CircleAvatar(
                  radius: 42,
                  backgroundImage: NetworkImage(
                    'https://e-sis.e-tech.ac.th/etech/Moduls/studentPhotos/photo/2567/6721619167324.jpg',
                  ),
                ),
                const SizedBox(width: 16),
                // Stats
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
          // Name and Username
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
            child: Row(
              children: [
                const Icon(Icons.tiktok, size: 16),
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
          // Follow Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE62860),
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
          // Photo Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(2),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                childAspectRatio: 0.75,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
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