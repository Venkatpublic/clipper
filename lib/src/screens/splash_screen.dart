import 'package:clipper/src/screens/welcome_screen.dart';
import 'package:clipper/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<double> _progress;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2600),
    );
    _fade = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.4, curve: Curves.easeIn),
    );
    _progress = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.1, 0.9, curve: Curves.easeInOut),
    );
    _controller.forward();
    Future.delayed(const Duration(milliseconds: 3000), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const WelcomeScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkSurface,
      body: FadeTransition(
        opacity: _fade,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 3),
                const Icon(
                  Icons.filter_center_focus,
                  size: 48,
                  color: AppColors.primary,
                ),
                const SizedBox(height: 20),
                Text(
                  'AutoCrop',
                  style: GoogleFonts.inter(
                    fontSize: 38,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'VISION ENGINE V4.2',
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                    letterSpacing: 2.5,
                  ),
                ),
                const Spacer(flex: 2),
                _StatusLine(label: 'Processing Node', value: 'Alpha_01'),
                const SizedBox(height: 8),
                _StatusLine(
                  label: 'System Kernel',
                  value: 'Initializing...',
                ),
                const SizedBox(height: 8),
                _StatusLine(label: 'Checksum', value: '0x8F2B'),
                const SizedBox(height: 8),
                _StatusLine(
                  label: 'Secure Boot',
                  value: 'Enabled',
                  valueColor: AppColors.success,
                ),
                const Spacer(),
                AnimatedBuilder(
                  animation: _progress,
                  builder: (context, child) => LinearProgressIndicator(
                    value: _progress.value,
                    backgroundColor: AppColors.darkSurfaceVariant,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(AppColors.primary),
                    minHeight: 2,
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatusLine extends StatelessWidget {
  const _StatusLine({
    required this.label,
    required this.value,
    this.valueColor,
  });

  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$label: ',
          style: GoogleFonts.jetBrainsMono(
            fontSize: 12,
            color: Colors.white38,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.jetBrainsMono(
            fontSize: 12,
            color: valueColor ?? Colors.white60,
          ),
        ),
      ],
    );
  }
}
