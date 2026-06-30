import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/glass_card.dart';

class PollingPage extends StatefulWidget {
  const PollingPage({super.key});

  @override
  State<PollingPage> createState() => _PollingPageState();
}

class _PollingPageState extends State<PollingPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Poll state data (pre-populated with realistic mock class values)
  final Map<String, int> _shirtSizes = {'S': 3, 'M': 8, 'L': 12, 'XL': 5, 'XXL': 2};
  final Map<String, int> _weights = {'40-50 kg': 4, '51-60 kg': 10, '61-70 kg': 8, '71-80 kg': 5, '>80 kg': 3};
  final Map<String, int> _heights = {'<150 cm': 2, '150-160 cm': 6, '161-170 cm': 14, '171-180 cm': 6, '>180 cm': 2};
  final Map<String, int> _shoeSizes = {'38': 3, '39': 5, '40': 9, '41': 7, '42': 4, '43': 2};
  final Map<String, int> _transportation = {'Jalan Kaki': 4, 'Motor': 12, 'Mobil': 6, 'Sepeda': 3, 'Umum': 5};

  // Form selections
  String? _selectedShirt;
  String? _selectedWeight;
  String? _selectedHeight;
  String? _selectedShoe;
  String? _selectedTransport;

  bool _hasVoted = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int get _totalRespondents => _shirtSizes.values.fold(0, (sum, val) => sum + val);

  void _submitPoll() {
    if (_selectedShirt == null ||
        _selectedWeight == null ||
        _selectedHeight == null ||
        _selectedShoe == null ||
        _selectedTransport == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Harap lengkapi semua 5 item polling sebelum mengirim!',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          backgroundColor: const Color(0xFFF43F5E),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
      return;
    }

    setState(() {
      _shirtSizes[_selectedShirt!] = _shirtSizes[_selectedShirt!]! + 1;
      _weights[_selectedWeight!] = _weights[_selectedWeight!]! + 1;
      _heights[_selectedHeight!] = _heights[_selectedHeight!]! + 1;
      _shoeSizes[_selectedShoe!] = _shoeSizes[_selectedShoe!]! + 1;
      _transportation[_selectedTransport!] = _transportation[_selectedTransport!]! + 1;

      _hasVoted = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Polling berhasil dikirim! Hasil dashboard diperbarui.',
            style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        backgroundColor: const Color(0xFF10B981),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );

    // Switch to Dashboard Tab
    _tabController.animateTo(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: Text(
          'Classroom Polling',
          style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFF818CF8),
          labelColor: const Color(0xFF818CF8),
          unselectedLabelColor: Colors.white60,
          labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w700),
          unselectedLabelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w500),
          tabs: const [
            Tab(text: 'Isi Polling', icon: Icon(Icons.edit_note_rounded)),
            Tab(text: 'Dashboard Grafik', icon: Icon(Icons.analytics_rounded)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildFormTab(),
          _buildDashboardTab(),
        ],
      ),
    );
  }

  // --- TAB 1: FORM VIEW ---
  Widget _buildFormTab() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Form Polling Data Kelas',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Masukkan data diri Anda untuk diakumulasikan ke grafik kelas.',
            style: GoogleFonts.poppins(fontSize: 13, color: Colors.white60),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),

          // 1. Shirt Size Question
          _buildFormQuestion(
            title: '1. Ukuran Baju Anda',
            options: _shirtSizes.keys.toList(),
            selectedValue: _selectedShirt,
            onSelected: (val) => setState(() => _selectedShirt = val),
            color: const Color(0xFF818CF8),
          ),
          const SizedBox(height: 20),

          // 2. Weight Question
          _buildFormQuestion(
            title: '2. Berat Badan Anda',
            options: _weights.keys.toList(),
            selectedValue: _selectedWeight,
            onSelected: (val) => setState(() => _selectedWeight = val),
            color: const Color(0xFF38BDF8),
          ),
          const SizedBox(height: 20),

          // 3. Height Question
          _buildFormQuestion(
            title: '3. Tinggi Badan Anda',
            options: _heights.keys.toList(),
            selectedValue: _selectedHeight,
            onSelected: (val) => setState(() => _selectedHeight = val),
            color: const Color(0xFF10B981),
          ),
          const SizedBox(height: 20),

          // 4. Shoe Size Question
          _buildFormQuestion(
            title: '4. Ukuran Sepatu Anda',
            options: _shoeSizes.keys.toList(),
            selectedValue: _selectedShoe,
            onSelected: (val) => setState(() => _selectedShoe = val),
            color: const Color(0xFFF59E0B),
          ),
          const SizedBox(height: 20),

          // 5. Transportation Question
          _buildFormQuestion(
            title: '5. Alat Transportasi Ke Sekolah',
            options: _transportation.keys.toList(),
            selectedValue: _selectedTransport,
            onSelected: (val) => setState(() => _selectedTransport = val),
            color: const Color(0xFFF43F5E),
          ),
          const SizedBox(height: 36),

          // Submit Button
          Container(
            height: 56,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF6366F1), Color(0xFF4338CA)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF6366F1).withOpacity(0.3),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: _submitPoll,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              child: Text(
                _hasVoted ? 'KIRIM LAGI' : 'KIRIM DATA POLLING',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildFormQuestion({
    required String title,
    required List<String> options,
    required String? selectedValue,
    required ValueChanged<String> onSelected,
    required Color color,
  }) {
    return GlassCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: options.map((opt) {
              final isSelected = selectedValue == opt;
              return ChoiceChip(
                label: Text(
                  opt,
                  style: GoogleFonts.poppins(
                    color: isSelected ? Colors.white : Colors.white60,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
                selected: isSelected,
                onSelected: (_) => onSelected(opt),
                selectedColor: color.withOpacity(0.3),
                backgroundColor: Colors.white.withOpacity(0.03),
                checkmarkColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: isSelected ? color : Colors.white.withOpacity(0.05),
                    width: isSelected ? 1.5 : 1,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // --- TAB 2: DASHBOARD VIEW ---
  Widget _buildDashboardTab() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Total Badge
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF818CF8).withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFF818CF8).withOpacity(0.2)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.people_alt_rounded, color: Color(0xFF818CF8), size: 28),
                const SizedBox(width: 12),
                Text(
                  'Total Responden Kelas: $_totalRespondents',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // CHART 1: Donut Chart (Ukuran Baju)
          _buildChartContainer(
            title: '1. Distribusi Ukuran Baju (Donut Chart)',
            child: SizedBox(
              height: 200,
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: CustomPaint(
                      painter: DonutChartPainter(data: _shirtSizes),
                      child: Container(),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 5,
                    child: _buildChartLegend(_shirtSizes, [
                      const Color(0xFF6366F1),
                      const Color(0xFF3B82F6),
                      const Color(0xFF10B981),
                      const Color(0xFFF59E0B),
                      const Color(0xFFEC4899),
                    ]),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // CHART 2: Line Chart (Berat Badan)
          _buildChartContainer(
            title: '2. Tren Distribusi Berat Badan (Line Chart)',
            child: SizedBox(
              height: 180,
              child: CustomPaint(
                painter: LineChartPainter(data: _weights),
                child: Container(),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // CHART 3: Vertical Bar Chart (Tinggi Badan)
          _buildChartContainer(
            title: '3. Rentang Tinggi Badan (Vertical Bar Chart)',
            child: _buildVerticalBarChart(_heights),
          ),
          const SizedBox(height: 24),

          // CHART 4: Horizontal Bar Chart (Ukuran Sepatu)
          _buildChartContainer(
            title: '4. Ukuran Sepatu Terbanyak (Horizontal Bar Chart)',
            child: _buildHorizontalBarChart(_shoeSizes),
          ),
          const SizedBox(height: 24),

          // CHART 5: Radial Bar Chart (Alat Transportasi)
          _buildChartContainer(
            title: '5. Alat Transportasi Kelas (Radial Bar Chart)',
            child: SizedBox(
              height: 200,
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: CustomPaint(
                      painter: RadialBarChartPainter(data: _transportation),
                      child: Container(),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 5,
                    child: _buildChartLegend(_transportation, [
                      const Color(0xFF10B981),
                      const Color(0xFFF59E0B),
                      const Color(0xFF06B6D4),
                      const Color(0xFF8B5CF6),
                      const Color(0xFFF43F5E),
                    ]),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildChartContainer({required String title, required Widget child}) {
    return GlassCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }

  Widget _buildChartLegend(Map<String, int> data, List<Color> colors) {
    int total = data.values.fold(0, (a, b) => a + b);
    List<String> keys = data.keys.toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(data.length, (index) {
        final key = keys[index];
        final val = data[key]!;
        final pct = total == 0 ? 0.0 : (val / total * 100);
        final color = colors[index % colors.length];

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '$key ($val Mhs)',
                  style: GoogleFonts.poppins(fontSize: 12, color: Colors.white70),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '${pct.toStringAsFixed(0)}%',
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Colors.white54,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  // --- CHART WIDGET 3: VERTICAL BAR CHART ---
  Widget _buildVerticalBarChart(Map<String, int> data) {
    int maxVal = data.values.fold(0, (max, val) => val > max ? val : max);
    if (maxVal == 0) maxVal = 1;
    List<String> keys = data.keys.toList();

    return Column(
      children: [
        SizedBox(
          height: 140,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: keys.map((key) {
              final val = data[key]!;
              final pct = val / maxVal;
              return Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      val.toString(),
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF10B981),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      width: 24,
                      height: (100 * pct).clamp(4.0, 100.0),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF34D399), Color(0xFF059669)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF10B981).withOpacity(0.2),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 12),
        const Divider(color: Colors.white12, height: 1),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: keys.map((key) {
            return Expanded(
              child: Text(
                key,
                style: GoogleFonts.poppins(fontSize: 10, color: Colors.white60),
                textAlign: TextAlign.center,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  // --- CHART WIDGET 4: HORIZONTAL BAR CHART ---
  Widget _buildHorizontalBarChart(Map<String, int> data) {
    int maxVal = data.values.fold(0, (max, val) => val > max ? val : max);
    if (maxVal == 0) maxVal = 1;
    List<String> keys = data.keys.toList();

    return Column(
      children: keys.map((key) {
        final val = data[key]!;
        final pct = val / maxVal;
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            children: [
              SizedBox(
                width: 30,
                child: Text(
                  key,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.white70,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: pct,
                    minHeight: 12,
                    backgroundColor: Colors.white.withOpacity(0.03),
                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFF59E0B)),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                width: 45,
                child: Text(
                  '$val Mhs',
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFFF59E0B),
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

// ==========================================
// CUSTOM PAINTER: DONUT CHART (Ukuran Baju)
// ==========================================
class DonutChartPainter extends CustomPainter {
  final Map<String, int> data;
  DonutChartPainter({required this.data});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 - 12;
    final rect = Rect.fromCircle(center: center, radius: radius);

    final List<Color> colors = [
      const Color(0xFF6366F1), // Indigo
      const Color(0xFF3B82F6), // Blue
      const Color(0xFF10B981), // Emerald
      const Color(0xFFF59E0B), // Amber
      const Color(0xFFEC4899), // Rose
    ];

    int total = data.values.fold(0, (a, b) => a + b);
    if (total == 0) return;

    double startAngle = -math.pi / 2;
    int index = 0;

    for (final val in data.values) {
      final sweepAngle = (val / total) * 2 * math.pi;
      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 20
        ..color = colors[index % colors.length]
        ..strokeCap = StrokeCap.round;

      // Draw slice
      canvas.drawArc(rect, startAngle + 0.05, sweepAngle - 0.1, false, paint);

      startAngle += sweepAngle;
      index++;
    }

    // Inside Ring Shadow Label (Text total respondents)
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    textPainter.text = TextSpan(
      text: 'Total\n$total',
      style: GoogleFonts.poppins(
        fontSize: 13,
        fontWeight: FontWeight.w800,
        color: Colors.white,
        height: 1.2,
      ),
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      center - Offset(textPainter.width / 2, textPainter.height / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// ==========================================
// CUSTOM PAINTER: LINE CHART (Berat Badan)
// ==========================================
class LineChartPainter extends CustomPainter {
  final Map<String, int> data;
  LineChartPainter({required this.data});

  @override
  void paint(Canvas canvas, Size size) {
    int totalElements = data.length;
    if (totalElements == 0) return;

    int maxVal = data.values.fold(0, (max, val) => val > max ? val : max);
    if (maxVal == 0) maxVal = 1;

    final widthStep = size.width / (totalElements - 1);
    final points = <Offset>[];

    List<int> vals = data.values.toList();
    List<String> keys = data.keys.toList();

    // Map counts to Coordinate points
    for (int i = 0; i < totalElements; i++) {
      double x = i * widthStep;
      // Map Y coordinates: high values draw higher up (lower Y pixel)
      double y = size.height - 24 - (vals[i] / maxVal) * (size.height - 40);
      points.add(Offset(x, y));
    }

    // Draw background gradient under line
    final pathGradient = Path();
    pathGradient.moveTo(points.first.dx, size.height - 24);
    for (var point in points) {
      pathGradient.lineTo(point.dx, point.dy);
    }
    pathGradient.lineTo(points.last.dx, size.height - 24);
    pathGradient.close();

    final paintGradient = Paint()
      ..shader = LinearGradient(
        colors: [const Color(0xFF38BDF8).withOpacity(0.15), Colors.transparent],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(pathGradient, paintGradient);

    // Draw connecting path line
    final pathLine = Path();
    pathLine.moveTo(points.first.dx, points.first.dy);
    for (int i = 1; i < points.length; i++) {
      pathLine.lineTo(points[i].dx, points[i].dy);
    }

    final paintLine = Paint()
      ..color = const Color(0xFF38BDF8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(pathLine, paintLine);

    // Draw dots and text labels
    final dotPaint = Paint()
      ..color = const Color(0xFF38BDF8)
      ..style = PaintingStyle.fill;
    final dotStrokePaint = Paint()
      ..color = const Color(0xFF0F172A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    for (int i = 0; i < points.length; i++) {
      canvas.drawCircle(points[i], 6, dotPaint);
      canvas.drawCircle(points[i], 6, dotStrokePaint);

      // Label under dot
      final labelPainter = TextPainter(
        text: TextSpan(
          text: keys[i],
          style: GoogleFonts.poppins(fontSize: 9, color: Colors.white54, fontWeight: FontWeight.w600),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      labelPainter.paint(
        canvas,
        Offset(points[i].dx - labelPainter.width / 2, size.height - 18),
      );

      // Count above dot
      final valPainter = TextPainter(
        text: TextSpan(
          text: vals[i].toString(),
          style: GoogleFonts.jetBrainsMono(fontSize: 10, color: Colors.white, fontWeight: FontWeight.w700),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      valPainter.paint(
        canvas,
        Offset(points[i].dx - valPainter.width / 2, points[i].dy - 18),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// ==========================================
// CUSTOM PAINTER: RADIAL BAR CHART (Concentric Rings)
// ==========================================
class RadialBarChartPainter extends CustomPainter {
  final Map<String, int> data;
  RadialBarChartPainter({required this.data});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = math.min(size.width, size.height) / 2 - 8;

    final List<Color> colors = [
      const Color(0xFF10B981), // Emerald
      const Color(0xFFF59E0B), // Amber
      const Color(0xFF06B6D4), // Cyan
      const Color(0xFF8B5CF6), // Purple
      const Color(0xFFF43F5E), // Rose
    ];

    int maxVal = data.values.fold(0, (max, val) => val > max ? val : max);
    if (maxVal == 0) maxVal = 1;

    List<int> vals = data.values.toList();
    double ringWidth = 8.0;
    double ringSpacing = 6.0;

    for (int i = 0; i < data.length; i++) {
      double radius = maxRadius - i * (ringWidth + ringSpacing);
      if (radius <= 0) break;

      final rect = Rect.fromCircle(center: center, radius: radius);
      final double progressPct = vals[i] / maxVal;
      final double sweepAngle = progressPct * 1.8 * math.pi; // Cap at ~324 degrees for aesthetic gap

      // Background tracking ring
      final bgPaint = Paint()
        ..color = Colors.white.withOpacity(0.02)
        ..style = PaintingStyle.stroke
        ..strokeWidth = ringWidth;
      canvas.drawArc(rect, -math.pi / 2, 1.8 * math.pi, false, bgPaint);

      // Colored progress ring
      final progressPaint = Paint()
        ..color = colors[i % colors.length]
        ..style = PaintingStyle.stroke
        ..strokeWidth = ringWidth
        ..strokeCap = StrokeCap.round;

      canvas.drawArc(rect, -math.pi / 2, sweepAngle, false, progressPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
