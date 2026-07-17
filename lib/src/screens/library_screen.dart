import 'package:clipper/src/screens/image_detail_screen.dart';
import 'package:clipper/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  bool _isGridView = false;
  String _sortBy = 'Recent';

  static const _folders = [
    _FolderData(
      name: 'Reactions',
      count: 128,
      modified: '2h ago',
      color: Color(0xFF4285F4),
    ),
    _FolderData(
      name: 'News',
      count: 45,
      modified: 'Yesterday',
      color: Color(0xFF34A853),
    ),
    _FolderData(
      name: 'Memes',
      count: 312,
      modified: '4h ago',
      color: Color(0xFFFBBC05),
    ),
    _FolderData(
      name: 'Tutorials',
      count: 18,
      modified: 'Oct 12',
      color: Color(0xFF9C27B0),
    ),
    _FolderData(
      name: 'Project Assets',
      count: 89,
      modified: '3d ago',
      color: Color(0xFF00897B),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surfaceContainerLowest,
        elevation: 0,
        titleSpacing: 16,
        title: Row(
          children: [
            const Icon(Icons.folder_shared, size: 20, color: AppColors.primary),
            const SizedBox(width: 8),
            Text(
              'Library',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.onSurface,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: AppColors.onSurfaceVariant),
            onPressed: () {},
            tooltip: 'Search',
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.sort, color: AppColors.onSurfaceVariant),
            tooltip: 'Sort',
            onSelected: (v) => setState(() => _sortBy = v),
            itemBuilder: (_) => ['Name', 'Recent', 'Size']
                .map(
                  (s) => PopupMenuItem(
                    value: s,
                    child: Row(
                      children: [
                        if (_sortBy == s)
                          const Icon(Icons.check, size: 16,
                              color: AppColors.primary)
                        else
                          const SizedBox(width: 16),
                        const SizedBox(width: 8),
                        Text(
                          s,
                          style: GoogleFonts.inter(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
          IconButton(
            icon: Icon(
              _isGridView ? Icons.view_list : Icons.grid_view,
              color: AppColors.onSurfaceVariant,
            ),
            onPressed: () => setState(() => _isGridView = !_isGridView),
            tooltip: _isGridView ? 'List view' : 'Grid view',
          ),
          const SizedBox(width: 4),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(
            height: 1,
            color: AppColors.outlineVariant,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
              child: Row(
                children: [
                  Text(
                    'Sort by: $_sortBy',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: AppColors.outline,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.create_new_folder,
                      size: 16,
                      color: AppColors.primary,
                    ),
                    label: Text(
                      'New Folder',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
              child: Text(
                'FOLDERS',
                style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: AppColors.outline,
                  letterSpacing: 0.8,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) {
                if (i < _folders.length) {
                  return _FolderTile(
                    folder: _folders[i],
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            ImageDetailScreen(folderName: _folders[i].name),
                      ),
                    ),
                  );
                }
                return null;
              },
              childCount: _folders.length,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Divider(
                  height: 1,
                  color: AppColors.outlineVariant,
                  indent: 16,
                  endIndent: 16,
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'OTHER',
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.outline,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
                _TrashTile(),
                const SizedBox(height: 12),
                _InfoBanner(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FolderData {
  const _FolderData({
    required this.name,
    required this.count,
    required this.modified,
    required this.color,
  });

  final String name;
  final int count;
  final String modified;
  final Color color;
}

class _FolderTile extends StatelessWidget {
  const _FolderTile({required this.folder, required this.onTap});

  final _FolderData folder;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.outlineVariant, width: 0.5),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: folder.color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.folder, size: 22, color: folder.color),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    folder.name,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.onSurface,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      const Icon(
                        Icons.history,
                        size: 12,
                        color: AppColors.outline,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${folder.count} items · Modified ${folder.modified}',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: AppColors.outline,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.more_vert,
                size: 18,
                color: AppColors.outline,
              ),
              onPressed: () {},
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            ),
          ],
        ),
      ),
    );
  }
}

class _TrashTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.outlineVariant),
      ),
      child: Row(
        children: [
          const Icon(Icons.delete_outline, size: 20, color: AppColors.error),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Trash',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.onSurface,
                  ),
                ),
                Text(
                  '12 items · Auto-clears in 30d',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: AppColors.outline,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete, size: 18, color: AppColors.error),
            onPressed: () {},
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
          ),
        ],
      ),
    );
  }
}

class _InfoBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.outlineVariant),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.info_outline, size: 16, color: AppColors.outline),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Your library is stored locally on this device. No data is uploaded to external servers.',
              style: GoogleFonts.inter(
                fontSize: 12,
                color: AppColors.onSurfaceVariant,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
