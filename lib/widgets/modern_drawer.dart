import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelompok_12_app/pages/sorting/sorting_page.dart';
import 'package:kelompok_12_app/pages/bilangan/bilangan_page.dart';
import 'package:kelompok_12_app/pages/zodiac/zodiac_page.dart';

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
                _buildDrawerTile(Icons.stars_rounded, 'Zodiac Signs', () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ZodiacPage()));
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
