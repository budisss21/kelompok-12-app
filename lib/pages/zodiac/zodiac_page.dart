import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/glass_card.dart';

class ZodiacSign {
  final String name;
  final String symbol;
  final String dateRange;
  final String element;
  final IconData elementIcon;
  final Color themeColor;
  final String description;
  final List<String> strengths;
  final List<String> weaknesses;
  final String luckyColor;
  final int luckyNumber;
  final List<String> compatibleWith;

  ZodiacSign({
    required this.name,
    required this.symbol,
    required this.dateRange,
    required this.element,
    required this.elementIcon,
    required this.themeColor,
    required this.description,
    required this.strengths,
    required this.weaknesses,
    required this.luckyColor,
    required this.luckyNumber,
    required this.compatibleWith,
  });
}

class ZodiacPage extends StatefulWidget {
  const ZodiacPage({super.key});

  @override
  State<ZodiacPage> createState() => _ZodiacPageState();
}

class _ZodiacPageState extends State<ZodiacPage> {
  final List<ZodiacSign> _zodiacSigns = [
    ZodiacSign(
      name: 'Aries',
      symbol: '♈',
      dateRange: 'Mar 21 - Apr 19',
      element: 'Fire',
      elementIcon: Icons.local_fire_department_rounded,
      themeColor: const Color(0xFFEF4444), // Red
      description: 'Aries adalah zodiak pertama, dikenal penuh semangat, kompetitif, dan berani memimpin. Mereka mandiri dan menyukai tantangan baru.',
      strengths: ['Pemberani', 'Jujur', 'Semangat', 'Percaya Diri'],
      weaknesses: ['Tidak Sabar', 'Impulsif', 'Mudah Marah'],
      luckyColor: 'Merah Terang',
      luckyNumber: 9,
      compatibleWith: ['Leo', 'Sagittarius', 'Aquarius'],
    ),
    ZodiacSign(
      name: 'Taurus',
      symbol: '♉',
      dateRange: 'Apr 20 - May 20',
      element: 'Earth',
      elementIcon: Icons.eco_rounded,
      themeColor: const Color(0xFF10B981), // Green
      description: 'Taurus menyukai stabilitas, kenyamanan, dan keindahan. Mereka sangat andal, sabar, serta berdedikasi tinggi terhadap apa yang dikerjakan.',
      strengths: ['Sabar', 'Setia', 'Pekerja Keras', 'Praktis'],
      weaknesses: ['Keras Kepala', 'Posesif', 'Kaku'],
      luckyColor: 'Hijau Daun',
      luckyNumber: 6,
      compatibleWith: ['Virgo', 'Capricorn', 'Pisces'],
    ),
    ZodiacSign(
      name: 'Gemini',
      symbol: '♊',
      dateRange: 'May 21 - Jun 20',
      element: 'Air',
      elementIcon: Icons.air_rounded,
      themeColor: const Color(0xFFF59E0B), // Yellow/Orange
      description: 'Gemini memiliki karakter yang cerdas, adaptif, dan sangat komunikatif. Mereka selalu penasaran dan menyukai pertukaran informasi.',
      strengths: ['Humoris', 'Cerdas', 'Luwes', 'Ekspresif'],
      weaknesses: ['Tidak Konsisten', 'Gelisah', 'Sulit Fokus'],
      luckyColor: 'Kuning Cerah',
      luckyNumber: 5,
      compatibleWith: ['Libra', 'Aquarius', 'Aries'],
    ),
    ZodiacSign(
      name: 'Cancer',
      symbol: '♋',
      dateRange: 'Jun 21 - Jul 22',
      element: 'Water',
      elementIcon: Icons.water_rounded,
      themeColor: const Color(0xFF06B6D4), // Teal
      description: 'Cancer adalah pribadi yang sangat sensitif, intuitif, dan penuh kasih sayang. Mereka sangat peduli pada keluarga dan rumah.',
      strengths: ['Peduli', 'Intuitif', 'Pelindung', 'Imajinatif'],
      weaknesses: ['Moody', 'Sensitif', 'Sering Ragu-ragu'],
      luckyColor: 'Perak / Putih',
      luckyNumber: 2,
      compatibleWith: ['Taurus', 'Scorpio', 'Pisces'],
    ),
    ZodiacSign(
      name: 'Leo',
      symbol: '♌',
      dateRange: 'Jul 23 - Aug 22',
      element: 'Fire',
      elementIcon: Icons.local_fire_department_rounded,
      themeColor: const Color(0xFFF97316), // Orange
      description: 'Leo adalah pemimpin alami yang hangat, kreatif, dan penuh percaya diri. Mereka senang menjadi pusat perhatian dan sangat setia.',
      strengths: ['Kreatif', 'Setia', 'Humoris', 'Karismatik'],
      weaknesses: ['Angkuh', 'Keras Kepala', 'Mementingkan Diri'],
      luckyColor: 'Emas / Kuning tua',
      luckyNumber: 1,
      compatibleWith: ['Aries', 'Sagittarius', 'Gemini'],
    ),
    ZodiacSign(
      name: 'Virgo',
      symbol: '♍',
      dateRange: 'Aug 23 - Sep 22',
      element: 'Earth',
      elementIcon: Icons.eco_rounded,
      themeColor: const Color(0xFF059669), // Dark Green
      description: 'Virgo dikenal sangat detail, analitis, dan suka menolong orang lain. Mereka sangat metodis dan menyukai keteraturan.',
      strengths: ['Analitis', 'Praktis', 'Setia', 'Pekerja Keras'],
      weaknesses: ['Terlalu Kritis', 'Pemalu', 'Suka Khawatir'],
      luckyColor: 'Abu-abu / Cokelat',
      luckyNumber: 5,
      compatibleWith: ['Taurus', 'Capricorn', 'Cancer'],
    ),
    ZodiacSign(
      name: 'Libra',
      symbol: '♎',
      dateRange: 'Sep 23 - Oct 22',
      element: 'Air',
      elementIcon: Icons.air_rounded,
      themeColor: const Color(0xFFEC4899), // Pink
      description: 'Libra menyukai kedamaian, harmoni, dan keadilan. Mereka sangat sosial, diplomatis, dan selalu berusaha mencari keseimbangan.',
      strengths: ['Kooperatif', 'Adil', 'Sosial', 'Diplomatis'],
      weaknesses: ['Ragu-ragu', 'Menghindari Konflik', 'Pemilih'],
      luckyColor: 'Biru Muda / Pink',
      luckyNumber: 6,
      compatibleWith: ['Gemini', 'Aquarius', 'Leo'],
    ),
    ZodiacSign(
      name: 'Scorpio',
      symbol: '♏',
      dateRange: 'Oct 23 - Nov 21',
      element: 'Water',
      elementIcon: Icons.water_rounded,
      themeColor: const Color(0xFF8B5CF6), // Purple
      description: 'Scorpio adalah pribadi yang intens, penuh gairah, dan misterius. Mereka memiliki tekad yang sangat kuat dan intuitif.',
      strengths: ['Berani', 'Fokus', 'Jujur', 'Sangat Setia'],
      weaknesses: ['Cemburuan', 'Rahasia', 'Sulit Percaya'],
      luckyColor: 'Merah Tua / Hitam',
      luckyNumber: 8,
      compatibleWith: ['Cancer', 'Pisces', 'Virgo'],
    ),
    ZodiacSign(
      name: 'Sagittarius',
      symbol: '♐',
      dateRange: 'Nov 22 - Dec 21',
      element: 'Fire',
      elementIcon: Icons.local_fire_department_rounded,
      themeColor: const Color(0xFFE11D48), // Rose
      description: 'Sagittarius berjiwa petualang, optimis, dan mencintai kebebasan. Mereka senang belajar hal baru dan memiliki selera humor tinggi.',
      strengths: ['Optimis', 'Humoris', 'Jujur', 'Suka Petualangan'],
      weaknesses: ['Terlalu Blak-blakan', 'Tidak Sabar', 'Kelewat Santai'],
      luckyColor: 'Biru Tua',
      luckyNumber: 3,
      compatibleWith: ['Aries', 'Leo', 'Libra'],
    ),
    ZodiacSign(
      name: 'Capricorn',
      symbol: '♑',
      dateRange: 'Dec 22 - Jan 19',
      element: 'Earth',
      elementIcon: Icons.eco_rounded,
      themeColor: const Color(0xFF6B7280), // Slate / Grey
      description: 'Capricorn sangat disiplin, bertanggung jawab, dan fokus pada karir. Mereka praktis dan selalu membuat rencana jangka panjang.',
      strengths: ['Disiplin', 'Sabar', 'Mandiri', 'Bertanggung Jawab'],
      weaknesses: ['Pesimis', 'Sulit Memaafkan', 'Kaku'],
      luckyColor: 'Hitam / Cokelat Tua',
      luckyNumber: 4,
      compatibleWith: ['Taurus', 'Virgo', 'Pisces'],
    ),
    ZodiacSign(
      name: 'Aquarius',
      symbol: '♒',
      dateRange: 'Jan 20 - Feb 18',
      element: 'Air',
      elementIcon: Icons.air_rounded,
      themeColor: const Color(0xFF3B82F6), // Blue
      description: 'Aquarius mandiri, intelektual, dan memiliki jiwa kemanusiaan yang tinggi. Mereka visioner dan menyukai inovasi baru.',
      strengths: ['Progresif', 'Orisinal', 'Mandiri', 'Kemanusiaan'],
      weaknesses: ['Temperamental', 'Suka Menutup Diri', 'Keras Kepala'],
      luckyColor: 'Biru Langit',
      luckyNumber: 7,
      compatibleWith: ['Gemini', 'Libra', 'Sagittarius'],
    ),
    ZodiacSign(
      name: 'Pisces',
      symbol: '♓',
      dateRange: 'Feb 19 - Mar 20',
      element: 'Water',
      elementIcon: Icons.water_rounded,
      themeColor: const Color(0xFF3F51B5), // Indigo
      description: 'Pisces adalah zodiak yang sangat intuitif, artistik, dan penuh empati. Mereka berjiwa seni tinggi dan sangat romantis.',
      strengths: ['Penuh Empati', 'Kreatif', 'Penyayang', 'Bijaksana'],
      weaknesses: ['Mudah Sedih', 'Suka Melarikan Diri', 'Terlalu Percaya'],
      luckyColor: 'Hijau Laut / Ungu',
      luckyNumber: 3,
      compatibleWith: ['Cancer', 'Scorpio', 'Taurus'],
    ),
  ];

  void _showZodiacDetail(ZodiacSign sign) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Color(0xFF1E293B),
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
          ),
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Pull Bar
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Header Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: sign.themeColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                      border: Border.all(color: sign.themeColor.withOpacity(0.2), width: 1.5),
                    ),
                    child: Text(
                      sign.symbol,
                      style: TextStyle(fontSize: 42, color: sign.themeColor),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sign.name,
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          sign.dateRange,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.white54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Element Badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: sign.themeColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: sign.themeColor.withOpacity(0.3)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(sign.elementIcon, size: 14, color: sign.themeColor),
                        const SizedBox(width: 4),
                        Text(
                          sign.element,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: sign.themeColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Description
              Text(
                'DESKRIPSI',
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  color: sign.themeColor,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                sign.description,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  height: 1.6,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              const SizedBox(height: 24),
              // Strengths & Weaknesses
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'KELEBIHAN',
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                            color: Colors.white60,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 6,
                          runSpacing: 6,
                          children: sign.strengths.map((str) => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFF10B981).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: const Color(0xFF10B981).withOpacity(0.2)),
                            ),
                            child: Text(
                              str,
                              style: GoogleFonts.poppins(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF34D399),
                              ),
                            ),
                          )).toList(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'KELEMAHAN',
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                            color: Colors.white60,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 6,
                          runSpacing: 6,
                          children: sign.weaknesses.map((weak) => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEF4444).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: const Color(0xFFEF4444).withOpacity(0.2)),
                            ),
                            child: Text(
                              weak,
                              style: GoogleFonts.poppins(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFF87171),
                              ),
                            ),
                          )).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Lucky Info & Compatibility
              Text(
                'INFORMASI TAMBAHAN',
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  color: sign.themeColor,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.03),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white.withOpacity(0.05)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Warna Keberuntungan', style: GoogleFonts.poppins(fontSize: 10, color: Colors.white38)),
                          const SizedBox(height: 4),
                          Text(sign.luckyColor, style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.03),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white.withOpacity(0.05)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Angka Keberuntungan', style: GoogleFonts.poppins(fontSize: 10, color: Colors.white38)),
                          const SizedBox(height: 4),
                          Text(sign.luckyNumber.toString(), style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.03),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white.withOpacity(0.05)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Zodiak Kompatibel', style: GoogleFonts.poppins(fontSize: 10, color: Colors.white38)),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: sign.compatibleWith.map((comp) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: sign.themeColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          comp,
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Colors.white70,
                          ),
                        ),
                      )).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: Text(
          'Zodiac Signs',
          style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
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
                color: const Color(0xFFEC4899).withOpacity(0.15),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
                child: Container(),
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            left: -50,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF818CF8).withOpacity(0.1),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
                child: Container(),
              ),
            ),
          ),
          // Main content grid
          GridView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.85,
            ),
            itemCount: _zodiacSigns.length,
            itemBuilder: (context, index) {
              final sign = _zodiacSigns[index];
              return InkWell(
                onTap: () => _showZodiacDetail(sign),
                borderRadius: BorderRadius.circular(24),
                child: GlassCard(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Large Emoji/Symbol representing the sign
                      Text(
                        sign.symbol,
                        style: TextStyle(
                          fontSize: 48,
                          color: sign.themeColor,
                          shadows: [
                            Shadow(
                              color: sign.themeColor.withOpacity(0.3),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Zodiac Sign Name
                      Text(
                        sign.name,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      // Date range text
                      Text(
                        sign.dateRange,
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          color: Colors.white38,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      // Mini element badge
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: sign.themeColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: sign.themeColor.withOpacity(0.2)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(sign.elementIcon, size: 10, color: sign.themeColor),
                            const SizedBox(width: 4),
                            Text(
                              sign.element,
                              style: GoogleFonts.poppins(
                                fontSize: 9,
                                fontWeight: FontWeight.w800,
                                color: sign.themeColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
