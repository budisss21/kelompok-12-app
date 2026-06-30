import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/member.dart';
import '../widgets/glass_card.dart';
import '../widgets/modern_drawer.dart';
import '../widgets/modern_bottom_sheet.dart';
import 'login_page.dart';
import 'member_detail_page.dart';

// Import existing pages
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
import 'package:kelompok_12_app/pages/zodiac/zodiac_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                actions: [
                  IconButton(
                    icon: const Icon(Icons.logout_rounded, color: Colors.white),
                    tooltip: 'Logout',
                    onPressed: () {
                      // Navigate back to LoginPage and clear route stack using pushReplacement
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                  ),
                ],
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
                            _buildModernMenuCard(
                              context,
                              'Zodiac',
                              Icons.stars_rounded,
                              const [Color(0xFFEC4899), Color(0xFFBE185D)],
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const ZodiacPage()),
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
          BottomSheetItem(
              'Luas Segitiga', Icons.change_history_rounded, const LuasSegitigaPage()),
          BottomSheetItem(
              'Isi Tabung', Icons.view_column_rounded, const IsiTabungPage()),
          BottomSheetItem(
              'Luas Kotak', Icons.square_rounded, const LuasKotakPage()),
          BottomSheetItem(
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
          BottomSheetItem('Single Choice', Icons.looks_one_rounded, QuizSinglePage()),
          BottomSheetItem('Multiple Choice', Icons.looks_two_rounded, QuizMultiPage()),
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
          BottomSheetItem('Max & Min (IF)', Icons.compare_arrows_rounded, const IfMaxMinPage()),
          BottomSheetItem('Nested IF (Discount)', Icons.shopping_cart_rounded, const NestedIfDiskonPage()),
          BottomSheetItem('Switch Case (Discount)', Icons.shuffle_rounded, const SwitchCaseDiskonPage()),
        ],
      ),
    );
  }
}
