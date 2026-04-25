import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'models/member.dart';
import 'package:kelompok_12_app/pages/rumus/luas_segitiga.dart';
import 'package:kelompok_12_app/pages/rumus/isi_tabung.dart';
import 'package:kelompok_12_app/pages/rumus/luas_kotak.dart';
import 'package:kelompok_12_app/pages/rumus/luas_lingkaran.dart';
import 'package:kelompok_12_app/pages/quiz/quiz_single.dart';
import 'package:kelompok_12_app/pages/quiz/quiz_multi.dart';
import 'package:kelompok_12_app/pages/poll/polling_page.dart';
import 'package:kelompok_12_app/pages/branching/if_max_min.dart';
import 'package:kelompok_12_app/pages/branching/nested_if_diskon.dart';
import 'package:kelompok_12_app/pages/branching/switch_case_diskon.dart';

void main() {
  runApp(const Kelompok12App());
}

class Kelompok12App extends StatelessWidget {
  const Kelompok12App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kelompok 12 Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const MemberListScreen(),
    );
  }
}

class MemberListScreen extends StatelessWidget {
  const MemberListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.indigo],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    FontAwesomeIcons.graduationCap,
                    color: Colors.white,
                    size: 40,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Kelompok 12',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'IF24H - UAI',
                    style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.school, color: Colors.indigo),
              title: const Text('Universitas Al Azhar Indonesia'),
              subtitle: const Text('Teknik Informatika'),
              onTap: () {},
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Built with:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(),

            ExpansionTile(
              leading: Icon(Icons.calculate, color: Colors.deepPurple),
              title: Text("Fitur Rumus"),
              children: [
                ListTile(
                  title: Text("Luas Segitiga"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => LuasSegitigaPage()),
                    );
                  },
                ),
                ListTile(
                  title: Text("Isi Tabung"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => IsiTabungPage()),
                    );
                  },
                ),
                ListTile(
                  title: Text("Luas Kotak"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => LuasKotakPage()),
                    );
                  },
                ),
                ListTile(
                  title: Text("Luas Lingkaran"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => LuasLingkaranPage()),
                    );
                  },
                ),
              ],
            ),

            ExpansionTile(
              leading: Icon(Icons.quiz, color: Colors.orange),
              title: Text("Fitur Quiz & Poll"),
              children: [
                ListTile(
                  title: Text("Quiz Single"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => QuizSinglePage()),
                    );
                  },
                ),
                ListTile(
                  title: Text("Quiz Multiple"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => QuizMultiPage()),
                    );
                  },
                ),
                ListTile(
                  title: Text("Polling Hobby"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => PollingPage()),
                    );
                  },
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Wrap(
                spacing: 6,
                children: [
                  _buildTechBadge('Flutter'),
                  _buildTechBadge('Dart'),
                  _buildTechBadge('.NET Core'),
                  _buildTechBadge('Video Player'),
                ],
              ),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Kelompok 12',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.deepPurple, Colors.indigo],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Icon(
                    FontAwesomeIcons.users,
                    size: 60,
                    color: Colors.white.withAlpha(128),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Quick Features',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    children: [
                      _buildMenuCard(
                        context,
                        'Rumus',
                        Icons.calculate,
                        Colors.deepPurple,
                        () => _showRumusMenu(context),
                      ),
                      _buildMenuCard(
                        context,
                        'Quiz',
                        Icons.quiz,
                        Colors.orange,
                        () => _showQuizMenu(context),
                      ),
                      _buildMenuCard(
                        context,
                        'Polling',
                        Icons.poll,
                        Colors.blue,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => PollingPage()),
                        ),
                      ),
                      _buildMenuCard(
                        context,
                        'Pencabangan',
                        Icons.account_tree,
                        Colors.teal,
                        () => _showBranchingMenu(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Our Team',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final member = groupMembers[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MemberDetailScreen(member: member),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Hero(
                            tag: 'avatar_${member.name}',
                            child: CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.grey[200],
                              child: ClipOval(
                                child: Image.asset(
                                  member.imagePath,
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(Icons.person, size: 35),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  member.name,
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  member.role,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  member.nim,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }, childCount: groupMembers.length),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showRumusMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Pilih Rumus',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.architecture, color: Colors.deepPurple),
                title: const Text('Luas Segitiga'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const LuasSegitigaPage()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.opacity, color: Colors.deepPurple),
                title: const Text('Isi Tabung'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const IsiTabungPage()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.square_foot, color: Colors.deepPurple),
                title: const Text('Luas Kotak'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const LuasKotakPage()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.circle_outlined, color: Colors.deepPurple),
                title: const Text('Luas Lingkaran'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const LuasLingkaranPage()));
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showQuizMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Pilih Quiz',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.looks_one, color: Colors.orange),
                title: const Text('Quiz Single Choice'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => QuizSinglePage()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.looks_two, color: Colors.orange),
                title: const Text('Quiz Multiple Choice'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => QuizMultiPage()));
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showBranchingMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Fitur Pencabangan',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.compare_arrows, color: Colors.teal),
                title: const Text('Max & Min (IF)'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const IfMaxMinPage()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.shopping_bag, color: Colors.teal),
                title: const Text('Diskon (Nested IF)'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const NestedIfDiskonPage()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.confirmation_number, color: Colors.teal),
                title: const Text('Diskon (Switch Case)'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const SwitchCaseDiskonPage()));
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTechBadge(String text) {
    return Chip(
      label: Text(
        text,
        style: const TextStyle(fontSize: 10, color: Colors.indigo),
      ),
      backgroundColor: Colors.indigo.withAlpha(20),
      padding: EdgeInsets.zero,
      side: BorderSide.none,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}

class MemberDetailScreen extends StatefulWidget {
  final Member member;
  const MemberDetailScreen({super.key, required this.member});

  @override
  State<MemberDetailScreen> createState() => _MemberDetailScreenState();
}

class _MemberDetailScreenState extends State<MemberDetailScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() async {
    _videoPlayerController = VideoPlayerController.asset(
      widget.member.videoPath,
    );
    try {
      await _videoPlayerController.initialize();
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: false,
        looping: false,
        aspectRatio: _videoPlayerController.value.aspectRatio,
        errorBuilder: (context, errorMessage) => const Center(
          child: Text('Video not found', style: TextStyle(color: Colors.white)),
        ),
      );
      setState(() {});
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url)))
      throw Exception('Could not launch $url');
  }

  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Copied: $text')));
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.member.name,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 350,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.deepPurple, Colors.indigo],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  child: Hero(
                    tag: 'avatar_${widget.member.name}',
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 10),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.grey[200],
                        child: ClipOval(
                          child: Image.asset(
                            widget.member.imagePath,
                            width: 160,
                            height: 160,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.person, size: 80),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Text(
                          widget.member.name,
                          style: GoogleFonts.poppins(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          widget.member.role,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.indigo,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        GestureDetector(
                          onTap: () =>
                              _copyToClipboard(context, widget.member.nim),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'NIM: ${widget.member.nim}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(
                                  Icons.copy,
                                  size: 14,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          widget.member.motto,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                            color: Colors.deepPurple,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildIconButton(
                        FontAwesomeIcons.envelope,
                        () => _launchUrl('mailto:${widget.member.email}'),
                      ),
                      _buildIconButton(
                        FontAwesomeIcons.instagram,
                        () => _launchUrl(widget.member.instagramUrl),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  _buildSectionTitle('Contribution'),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green.withAlpha(10),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.green.withAlpha(30)),
                    ),
                    child: Text(
                      widget.member.contribution,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  _buildSectionTitle('About Me'),
                  const SizedBox(height: 8),
                  Text(
                    widget.member.bio,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.grey[800],
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 32),
                  _buildSectionTitle('Skills'),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.member.skills
                        .map(
                          (skill) => Chip(
                            label: Text(skill),
                            backgroundColor: Colors.indigo.withAlpha(20),
                            side: BorderSide.none,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 32),
                  _buildSectionTitle('Hobbies'),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.member.hobbies
                        .map(
                          (hobby) => Chip(
                            label: Text(hobby),
                            backgroundColor: Colors.green.withAlpha(20),
                            side: BorderSide.none,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        )
                        .toList(),
                  ),

                  const SizedBox(height: 32),
                  _buildSectionTitle('Introduction Video'),
                  const SizedBox(height: 16),
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child:
                          _chewieController != null &&
                              _chewieController!
                                  .videoPlayerController
                                  .value
                                  .isInitialized
                          ? Chewie(controller: _chewieController!)
                          : const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) => Text(
    title,
    style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
  );

  Widget _buildIconButton(IconData icon, VoidCallback onPressed) => Container(
    decoration: const BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
    ),
    child: IconButton(
      icon: Icon(icon, color: Colors.indigo),
      onPressed: onPressed,
    ),
  );
}
