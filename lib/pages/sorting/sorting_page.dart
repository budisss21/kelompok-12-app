import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sorting_algorithms.dart';

class SortingPage extends StatefulWidget {
  const SortingPage({super.key});

  @override
  State<SortingPage> createState() => _SortingPageState();
}

class _SortingPageState extends State<SortingPage> {
  final List<TextEditingController> _controllers = 
      List.generate(10, (index) => TextEditingController());
  
  List<int> _sortedNumbers = [];
  String _selectedAlgorithm = 'Bubble Sort';
  bool _isAscending = true;
  String _executionTime = '';

  final List<String> _algorithms = [
    'Bubble Sort',
    'Selection Sort',
    'Insertion Sort',
    'Merge Sort',
    'Quick Sort'
  ];

  void _generateRandomNumbers() {
    final random = Random();
    setState(() {
      for (var controller in _controllers) {
        controller.text = random.nextInt(100).toString();
      }
      _sortedNumbers = [];
      _executionTime = '';
    });
  }

  void _sort() {
    List<int> numbers = [];
    for (var controller in _controllers) {
      if (controller.text.isNotEmpty) {
        numbers.add(int.tryParse(controller.text) ?? 0);
      } else {
        numbers.add(0);
      }
    }

    if (numbers.length < 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please fill all 10 numbers'),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
      return;
    }

    final stopwatch = Stopwatch()..start();
    
    List<int> result;
    switch (_selectedAlgorithm) {
      case 'Bubble Sort':
        result = SortingAlgorithms.bubbleSort(numbers, ascending: _isAscending);
        break;
      case 'Selection Sort':
        result = SortingAlgorithms.selectionSort(numbers, ascending: _isAscending);
        break;
      case 'Insertion Sort':
        result = SortingAlgorithms.insertionSort(numbers, ascending: _isAscending);
        break;
      case 'Merge Sort':
        result = SortingAlgorithms.mergeSort(numbers, ascending: _isAscending);
        break;
      case 'Quick Sort':
        result = SortingAlgorithms.quickSort(numbers, ascending: _isAscending);
        break;
      default:
        result = numbers;
    }
    
    stopwatch.stop();

    setState(() {
      _sortedNumbers = result;
      _executionTime = '${stopwatch.elapsedMicroseconds} µs';
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: Text('Sorting Algorithm',
            style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w700)),
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 200,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFF43F5E).withOpacity(0.05),
              ),
            ),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionLabel('Step 1: Input Data'),
                const SizedBox(height: 16),
                _buildGlassContainer(
                  child: Column(
                    children: [
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        alignment: WrapAlignment.center,
                        children: List.generate(10, (index) {
                          return SizedBox(
                            width: 55,
                            child: TextField(
                              controller: _controllers[index],
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.jetBrainsMono(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                                fillColor: Colors.white.withOpacity(0.05),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(color: Color(0xFF818CF8)),
                                ),
                                hintText: '#${index + 1}',
                                hintStyle: const TextStyle(color: Colors.white24, fontSize: 10),
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 20),
                      TextButton.icon(
                        onPressed: _generateRandomNumbers,
                        icon: const Icon(Icons.shuffle_rounded, size: 18),
                        label: const Text('Randomize Numbers'),
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFF38BDF8),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                _buildSectionLabel('Step 2: Configuration'),
                const SizedBox(height: 16),
                _buildGlassContainer(
                  child: Column(
                    children: [
                      DropdownButtonFormField<String>(
                        value: _selectedAlgorithm,
                        dropdownColor: const Color(0xFF1E293B),
                        style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600),
                        decoration: InputDecoration(
                          labelText: 'Select Algorithm',
                          labelStyle: const TextStyle(color: Colors.white38),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
                          ),
                        ),
                        items: _algorithms.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) => setState(() => _selectedAlgorithm = newValue!),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Sort Direction', 
                                style: GoogleFonts.poppins(color: Colors.white70, fontSize: 13)),
                              Text(_isAscending ? 'Smallest to Largest' : 'Largest to Smallest',
                                style: GoogleFonts.poppins(color: const Color(0xFF818CF8), fontSize: 11, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Switch(
                            value: _isAscending,
                            onChanged: (value) => setState(() => _isAscending = value),
                            activeColor: const Color(0xFF818CF8),
                            activeTrackColor: const Color(0xFF818CF8).withOpacity(0.3),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: _sort,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF818CF8),
                      foregroundColor: Colors.white,
                      elevation: 8,
                      shadowColor: const Color(0xFF818CF8).withOpacity(0.5),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    ),
                    child: Text('EXECUTE ALGORITHM', 
                      style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w800, letterSpacing: 1)),
                  ),
                ),
                if (_sortedNumbers.isNotEmpty) ...[
                  const SizedBox(height: 40),
                  _buildSectionLabel('Output Result'),
                  const SizedBox(height: 16),
                  _buildGlassContainer(
                    color: const Color(0xFF10B981).withOpacity(0.05),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_selectedAlgorithm, 
                              style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF10B981))),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.05),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(_executionTime, 
                                style: GoogleFonts.jetBrainsMono(color: Colors.white38, fontSize: 10)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          alignment: WrapAlignment.center,
                          children: _sortedNumbers.map((num) {
                            return Container(
                              width: 50,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: const Color(0xFF1E293B),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: const Color(0xFF10B981).withOpacity(0.3)),
                              ),
                              child: Text(num.toString(), 
                                style: GoogleFonts.jetBrainsMono(fontWeight: FontWeight.w900, color: Colors.white)),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 60),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionLabel(String text) {
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

  Widget _buildGlassContainer({required Widget child, Color? color}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: color ?? Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: child,
    );
  }
}
