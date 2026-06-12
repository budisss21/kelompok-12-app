import 'dart:ui';
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
import 'package:kelompok_12_app/pages/sorting/sorting_page.dart';
import 'package:kelompok_12_app/pages/bilangan/bilangan_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
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
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF818CF8),
          brightness: Brightness.dark,
          background: const Color(0xFF0F172A),
          surface: const Color(0xFF1E293B),
        ),
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
      ),
      home: const MemberListScreen(),
    );
  }
}

class GlassCard extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final List<Color>? gradient;

  const GlassCard({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: padding ?? const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: gradient ??
                    [
                      Colors.white.withOpacity(0.08),
                      Colors.white.withOpacity(0.03),
                    ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: Colors.white.withOpacity(0.1),
                width: 1.5,
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

class MemberListScreen extends StatelessWidget {
  const MemberListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const ModernDrawer(),
      body: Stack(
        children: [
          // Background Gradient Orbs
          Positioned(
            top: -100,
            right: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF818CF8).withOpacity(0.15),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
                child: Container(),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: -50,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF38BDF8).withOpacity(0.1),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
                child: Container(),
              ),
            ),
          ),

          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                expandedHeight: 240,
                floating: false,
                pinned: true,
                backgroundColor: const Color(0xFF0F172A),
                elevation: 0,
                leading: Builder(builder: (context) {
                  return IconButton(
                    icon: const Icon(Icons.menu_rounded, color: Colors.white),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  );
                }),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    'KELOMPOK 12',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      letterSpacing: 2,
                      color: Colors.white,
                    ),
                  ),
                  background: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: 0.3,
                        child: Icon(
                          FontAwesomeIcons.cubes,
                          size: 150,
                          color: const Color(0xFF818CF8).withOpacity(0.5),
                        ),
                      ),
                      Positioned(
                        bottom: 40,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFF818CF8).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color:
                                    const Color(0xFF818CF8).withOpacity(0.3)),
                          ),
                          child: Text(
                            'IF24H - Informatics',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFA5B4FC),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Quick Features',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Swipe right →',
                            style: GoogleFonts.poppins(
                              fontSize: 11,
                              color: Colors.white38,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 120,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildModernMenuCard(
                              context,
                              'Formula',
                              Icons.calculate_rounded,
                              const [Color(0xFF6366F1), Color(0xFF4338CA)],
                              () => _showRumusMenu(context),
                            ),
                            _buildModernMenuCard(
                              context,
                              'Quiz',
                              Icons.bolt_rounded,
                              const [Color(0xFFF59E0B), Color(0xFFD97706)],
                              () => _showQuizMenu(context),
                            ),
                            _buildModernMenuCard(
                              context,
                              'Poll',
                              Icons.bar_chart_rounded,
                              const [Color(0xFF3B82F6), Color(0xFF2563EB)],
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => PollingPage()),
                              ),
                            ),
                            _buildModernMenuCard(
                              context,
                              'Logic',
                              Icons.account_tree_rounded,
                              const [Color(0xFF10B981), Color(0xFF059669)],
                              () => _showBranchingMenu(context),
                            ),
                            _buildModernMenuCard(
                              context,
                              'Sorting',
                              Icons.sort_rounded,
                              const [Color(0xFFF43F5E), Color(0xFFE11D48)],
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const SortingPage()),
                              ),
                            ),
                            _buildModernMenuCard(
                              context,
                              'Numbers',
                              Icons.format_list_numbered_rounded,
                              const [Color(0xFF8B5CF6), Color(0xFF7C3AED)],
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const BilanganPage()),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'Team Members',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'The creative minds behind this project',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.white38,
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final member = groupMembers[index];
                    return _buildModernMemberCard(context, member);
                  }, childCount: groupMembers.length),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildModernMenuCard(
    BuildContext context,
    String title,
    IconData icon,
    List<Color> gradientColors,
    VoidCallback onTap,
  ) {
    return Container(
      width: 105,
      margin: const EdgeInsets.only(right: 14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: gradientColors[0].withOpacity(0.3),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 32),
              const SizedBox(height: 10),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModernMemberCard(BuildContext context, Member member) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MemberDetailScreen(member: member),
            ),
          );
        },
        borderRadius: BorderRadius.circular(24),
        child: GlassCard(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Hero(
                tag: 'avatar_${member.name}',
                child: Container(
                  width: 85,
                  height: 85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(member.imagePath),
                      fit: BoxFit.cover,
                      onError: (e, s) => const Icon(Icons.person, size: 40),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      member.name,
                      style: GoogleFonts.poppins(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      member.role,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: const Color(0xFF818CF8),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.badge_outlined,
                              size: 12, color: Colors.white.withOpacity(0.5)),
                          const SizedBox(width: 6),
                          Text(
                            member.nim,
                            style: GoogleFonts.jetBrainsMono(
                              fontSize: 11,
                              color: Colors.white70,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: Colors.white.withOpacity(0.3),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showRumusMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => ModernBottomSheet(
        title: 'Geometric Formula',
        items: [
          _BottomSheetItem(
              'Luas Segitiga', Icons.change_history_rounded, const LuasSegitigaPage()),
          _BottomSheetItem(
              'Isi Tabung', Icons.view_column_rounded, const IsiTabungPage()),
          _BottomSheetItem(
              'Luas Kotak', Icons.square_rounded, const LuasKotakPage()),
          _BottomSheetItem(
              'Luas Lingkaran', Icons.circle_rounded, const LuasLingkaranPage()),
        ],
      ),
    );
  }

  void _showQuizMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => ModernBottomSheet(
        title: 'Quiz Challenges',
        items: [
          _BottomSheetItem('Single Choice', Icons.looks_one_rounded, QuizSinglePage()),
          _BottomSheetItem('Multiple Choice', Icons.looks_two_rounded, QuizMultiPage()),
        ],
      ),
    );
  }

  void _showBranchingMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => ModernBottomSheet(
        title: 'Programming Logic',
        items: [
          _BottomSheetItem('Max & Min (IF)', Icons.compare_arrows_rounded, const IfMaxMinPage()),
          _BottomSheetItem('Nested IF (Discount)', Icons.shopping_cart_rounded, const NestedIfDiskonPage()),
          _BottomSheetItem('Switch Case (Discount)', Icons.shuffle_rounded, const SwitchCaseDiskonPage()),
        ],
      ),
    );
  }
}

class ModernDrawer extends StatelessWidget {
  const ModernDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF0F172A),
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF4F46E5), Color(0xFF818CF8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(FontAwesomeIcons.graduationCap,
                      color: Colors.white, size: 48),
                  const SizedBox(height: 16),
                  Text(
                    'KELOMPOK 12',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerTile(Icons.home_rounded, 'Dashboard', () => Navigator.pop(context)),
                _buildDrawerTile(Icons.sort_rounded, 'Sorting Algorithms', () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const SortingPage()));
                }),
                _buildDrawerTile(Icons.format_list_numbered_rounded, 'Number Sequences', () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const BilanganPage()));
                }),
                const Divider(color: Colors.white12, indent: 20, endIndent: 20),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                  child: Text(
                    'ECOSYSTEM',
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Colors.white38,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                _buildDrawerTile(Icons.code_rounded, 'Flutter Framework', null),
                _buildDrawerTile(Icons.terminal_rounded, 'Dart Language', null),
                _buildDrawerTile(Icons.storage_rounded, 'SQL Server', null),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'v2.0.0 Stable',
              style: GoogleFonts.jetBrainsMono(fontSize: 10, color: Colors.white24),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerTile(IconData icon, String title, VoidCallback? onTap) {
    return ListTile(
      leading: Icon(icon, color: onTap != null ? const Color(0xFF818CF8) : Colors.white24),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: onTap != null ? Colors.white : Colors.white24,
        ),
      ),
      onTap: onTap,
    );
  }
}

class ModernBottomSheet extends StatelessWidget {
  final String title;
  final List<_BottomSheetItem> items;

  const ModernBottomSheet({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF1E293B),
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 40),
              itemCount: items.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final item = items[index];
                return InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (_) => item.page));
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white.withOpacity(0.05)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFF818CF8).withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(item.icon, color: const Color(0xFF818CF8), size: 24),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          item.label,
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Colors.white24),
                      ],
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
}

class _BottomSheetItem {
  final String label;
  final IconData icon;
  final Widget page;
  _BottomSheetItem(this.label, this.icon, this.page);
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
    _videoPlayerController = VideoPlayerController.asset(widget.member.videoPath);
    try {
      await _videoPlayerController.initialize();
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: false,
        looping: false,
        aspectRatio: _videoPlayerController.value.aspectRatio,
        materialProgressColors: ChewieProgressColors(
          playedColor: const Color(0xFF818CF8),
          handleColor: const Color(0xFF818CF8),
          backgroundColor: Colors.white12,
          bufferedColor: Colors.white24,
        ),
        errorBuilder: (context, errorMessage) => const Center(
          child: Text('Video resource not found', style: TextStyle(color: Colors.white54)),
        ),
      );
      if (mounted) setState(() {});
    } catch (e) {
      debugPrint("Video Init Error: $e");
    }
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) throw Exception('Could not launch $url');
  }

  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Copied: $text'),
        backgroundColor: const Color(0xFF818CF8),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
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
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 400,
            pinned: true,
            stretch: true,
            backgroundColor: const Color(0xFF0F172A),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.black38,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [StretchMode.zoomBackground, StretchMode.blurBackground],
              background: Hero(
                tag: 'avatar_${widget.member.name}',
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(widget.member.imagePath, fit: BoxFit.cover),
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.transparent, Color(0xFF0F172A)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.member.name,
                              style: GoogleFonts.poppins(
                                fontSize: 28,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              widget.member.role,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: const Color(0xFF818CF8),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      _buildSocialAction(
                        FontAwesomeIcons.envelope,
                        'Email',
                        () => _launchUrl('mailto:${widget.member.email}'),
                      ),
                      const SizedBox(width: 12),
                      _buildSocialAction(
                        FontAwesomeIcons.instagram,
                        'Instagram',
                        () => _launchUrl(widget.member.instagramUrl),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () => _copyToClipboard(context, widget.member.nim),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.white.withOpacity(0.05)),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'NIM: ${widget.member.nim}',
                                style: GoogleFonts.jetBrainsMono(
                                  fontSize: 12,
                                  color: Colors.white70,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(Icons.copy_rounded, size: 14, color: Colors.white24),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  _buildGlassSection('Motto', widget.member.motto, isItalic: true),
                  const SizedBox(height: 24),
                  _buildGlassSection('Professional Summary', widget.member.bio),
                  const SizedBox(height: 24),
                  _buildGlassSection('Key Contributions', widget.member.contribution, 
                    color: const Color(0xFF10B981).withOpacity(0.1)),
                  const SizedBox(height: 32),
                  _buildLabel('Technical Expertise'),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: widget.member.skills.map((s) => _buildChip(s, const Color(0xFF818CF8))).toList(),
                  ),
                  const SizedBox(height: 32),
                  _buildLabel('Personal Hobbies'),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: widget.member.hobbies.map((h) => _buildChip(h, const Color(0xFFF43F5E))).toList(),
                  ),
                  const SizedBox(height: 40),
                  _buildLabel('Introduction Video'),
                  const SizedBox(height: 16),
                  Container(
                    height: 240,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.white.withOpacity(0.05)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: _chewieController != null && _chewieController!.videoPlayerController.value.isInitialized
                          ? Chewie(controller: _chewieController!)
                          : const Center(child: CircularProgressIndicator(color: Color(0xFF818CF8))),
                    ),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialAction(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF818CF8).withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(icon, color: const Color(0xFF818CF8), size: 20),
      ),
    );
  }

  Widget _buildGlassSection(String title, String content, {bool isItalic = false, Color? color}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(title),
        const SizedBox(height: 12),
        GlassCard(
          padding: const EdgeInsets.all(20),
          gradient: [
            color ?? Colors.white.withOpacity(0.05),
            color?.withOpacity(0.02) ?? Colors.white.withOpacity(0.02),
          ],
          child: SizedBox(
            width: double.infinity,
            child: Text(
              content,
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: Colors.white.withOpacity(0.85),
                height: 1.6,
                fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text.toUpperCase(),
      style: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w800,
        color: const Color(0xFF818CF8),
        letterSpacing: 1.5,
      ),
    );
  }

  Widget _buildChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}
