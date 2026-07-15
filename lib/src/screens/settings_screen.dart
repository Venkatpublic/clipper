import 'package:clipper/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double _edgeSensitivity = 0.74;
  bool _instagramEnabled = true;
  bool _twitterEnabled = true;
  bool _autoDelete = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surfaceContainerLowest,
        elevation: 0,
        titleSpacing: 16,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Icon(Icons.settings, size: 20, color: AppColors.primary),
            const SizedBox(width: 8),
            Text(
              'Settings',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.onSurface,
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(height: 1, color: AppColors.outlineVariant),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ServiceStatusSection(),
            const SizedBox(height: 24),
            _LocalProcessingSection(
              edgeSensitivity: _edgeSensitivity,
              instagramEnabled: _instagramEnabled,
              twitterEnabled: _twitterEnabled,
              onEdgeChanged: (v) => setState(() => _edgeSensitivity = v),
              onInstagramChanged: (v) =>
                  setState(() => _instagramEnabled = v),
              onTwitterChanged: (v) => setState(() => _twitterEnabled = v),
            ),
            const SizedBox(height: 24),
            _LocalStorageSection(
              autoDelete: _autoDelete,
              onAutoDeleteChanged: (v) => setState(() => _autoDelete = v),
            ),
            const SizedBox(height: 24),
            _DangerZoneSection(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────── SERVICE STATUS ────────────────────────────────

class _ServiceStatusSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'SERVICE STATUS',
      children: [
        _StatusRow(
          icon: Icons.power_settings_new,
          iconColor: AppColors.success,
          label: 'Engine Power',
          status: 'Engine is active and listening',
          statusColor: AppColors.success,
        ),
        const SizedBox(height: 12),
        _ProgressRow(
          label: 'Memory Usage',
          value: '124 MB / 512 MB',
          progress: 124 / 512,
        ),
        const SizedBox(height: 12),
        _LabelRow(label: 'Uptime', value: '14h 22m'),
      ],
    );
  }
}

class _StatusRow extends StatelessWidget {
  const _StatusRow({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.status,
    required this.statusColor,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final String status;
  final Color statusColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: iconColor),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.onSurface,
              ),
            ),
            Row(
              children: [
                Container(
                  width: 6,
                  height: 6,
                  margin: const EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    color: statusColor,
                    shape: BoxShape.circle,
                  ),
                ),
                Text(
                  status,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _ProgressRow extends StatelessWidget {
  const _ProgressRow({
    required this.label,
    required this.value,
    required this.progress,
  });

  final String label;
  final String value;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.onSurface,
              ),
            ),
            Text(
              value,
              style: GoogleFonts.jetBrainsMono(
                fontSize: 12,
                color: AppColors.onSurfaceVariant,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(2),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 4,
            backgroundColor: AppColors.surfaceContainerHigh,
            valueColor: AlwaysStoppedAnimation<Color>(
              progress > 0.8 ? AppColors.error : AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}

class _LabelRow extends StatelessWidget {
  const _LabelRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: AppColors.onSurface,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.jetBrainsMono(
            fontSize: 12,
            color: AppColors.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

// ────────────────────────── LOCAL PROCESSING ───────────────────────────────

class _LocalProcessingSection extends StatelessWidget {
  const _LocalProcessingSection({
    required this.edgeSensitivity,
    required this.instagramEnabled,
    required this.twitterEnabled,
    required this.onEdgeChanged,
    required this.onInstagramChanged,
    required this.onTwitterChanged,
  });

  final double edgeSensitivity;
  final bool instagramEnabled;
  final bool twitterEnabled;
  final ValueChanged<double> onEdgeChanged;
  final ValueChanged<bool> onInstagramChanged;
  final ValueChanged<bool> onTwitterChanged;

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'LOCAL PROCESSING',
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Edge Sensitivity',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.onSurface,
                  ),
                ),
                Text(
                  '${(edgeSensitivity * 100).round()}%',
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Text(
              'Determines how aggressively the system identifies UI boundaries during local scans.',
              style: GoogleFonts.inter(
                fontSize: 12,
                color: AppColors.outline,
                height: 1.4,
              ),
            ),
            SliderTheme(
              data: SliderThemeData(
                activeTrackColor: AppColors.primary,
                inactiveTrackColor: AppColors.surfaceContainerHigh,
                thumbColor: AppColors.primary,
                overlayColor: AppColors.primary.withValues(alpha:0.1),
                trackHeight: 3,
                thumbShape:
                    const RoundSliderThumbShape(enabledThumbRadius: 7),
              ),
              child: Slider(
                value: edgeSensitivity,
                onChanged: onEdgeChanged,
              ),
            ),
          ],
        ),
        Divider(height: 1, color: AppColors.outlineVariant),
        const SizedBox(height: 12),
        _ToggleRow(
          icon: Icons.photo_camera,
          label: 'Instagram Auto-Detection',
          sublabel: 'Identify posts and stories for cropping',
          value: instagramEnabled,
          onChanged: onInstagramChanged,
        ),
        const SizedBox(height: 8),
        _ToggleRow(
          icon: Icons.chat_bubble_outline,
          label: 'X / Twitter Cleanup',
          sublabel: 'Isolate tweets from UI elements',
          value: twitterEnabled,
          onChanged: onTwitterChanged,
        ),
        const SizedBox(height: 12),
        Divider(height: 1, color: AppColors.outlineVariant),
        const SizedBox(height: 12),
        _NavigationRow(
          icon: Icons.precision_manufacturing,
          label: 'Algorithm Model',
          value: 'Neural V3 (Optimized)',
          onTap: () {},
        ),
      ],
    );
  }
}

class _ToggleRow extends StatelessWidget {
  const _ToggleRow({
    required this.icon,
    required this.label,
    required this.sublabel,
    required this.value,
    required this.onChanged,
  });

  final IconData icon;
  final String label;
  final String sublabel;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.onSurfaceVariant),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.onSurface,
                ),
              ),
              Text(
                sublabel,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: AppColors.outline,
                ),
              ),
            ],
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeThumbColor: AppColors.primary,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ],
    );
  }
}

class _NavigationRow extends StatelessWidget {
  const _NavigationRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Icon(icon, size: 18, color: AppColors.onSurfaceVariant),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.onSurface,
                ),
              ),
            ),
            Text(
              value,
              style: GoogleFonts.inter(
                fontSize: 13,
                color: AppColors.onSurfaceVariant,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.chevron_right,
              size: 18,
              color: AppColors.outline,
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────── LOCAL STORAGE ─────────────────────────────────

class _LocalStorageSection extends StatelessWidget {
  const _LocalStorageSection({
    required this.autoDelete,
    required this.onAutoDeleteChanged,
  });

  final bool autoDelete;
  final ValueChanged<bool> onAutoDeleteChanged;

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'LOCAL STORAGE',
      children: [
        _ToggleRow(
          icon: Icons.delete_sweep,
          label: 'Auto-delete Original',
          sublabel: 'Remove uncropped source images after processing',
          value: autoDelete,
          onChanged: onAutoDeleteChanged,
        ),
        const SizedBox(height: 12),
        Divider(height: 1, color: AppColors.outlineVariant),
        const SizedBox(height: 12),
        _NavigationRow(
          icon: Icons.folder_open,
          label: 'Output Directory',
          value: '~/Pictures/AutoCrop',
          onTap: () {},
        ),
        const SizedBox(height: 12),
        Divider(height: 1, color: AppColors.outlineVariant),
        const SizedBox(height: 12),
        _ProgressRow(
          label: 'Cache Usage',
          value: '1.2 GB / 5.0 GB',
          progress: 1.2 / 5.0,
        ),
        const SizedBox(height: 14),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.cleaning_services, size: 16),
          label: Text(
            'Clear Temporary Cache',
            style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w500),
          ),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.onSurface,
            side: const BorderSide(color: AppColors.outlineVariant),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────── DANGER ZONE ───────────────────────────────────

class _DangerZoneSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'DANGER ZONE',
      titleColor: AppColors.error,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.error.withValues(alpha:0.05),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: AppColors.error.withValues(alpha:0.2)),
          ),
          child: Text(
            'The following actions are irreversible and will permanently affect your configuration and stored data.',
            style: GoogleFonts.inter(
              fontSize: 12,
              color: AppColors.onSurfaceVariant,
              height: 1.4,
            ),
          ),
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.error,
                  side: BorderSide(color: AppColors.error.withValues(alpha:0.5)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 11),
                ),
                child: Text(
                  'Reset Local Settings',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.onSurface,
                  side: const BorderSide(color: AppColors.outlineVariant),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 11),
                ),
                child: Text(
                  'Export Config',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ─────────────────────────── SHARED WIDGETS ────────────────────────────────

class _Section extends StatelessWidget {
  const _Section({
    required this.title,
    required this.children,
    this.titleColor,
  });

  final String title;
  final List<Widget> children;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: titleColor ?? AppColors.outline,
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.outlineVariant),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ],
    );
  }
}
