import 'package:flutter/material.dart';

/// Breakpoint below which tables are transformed into card lists
const double kTableBreakpoint = 600;

/// Layout style for responsive tables on mobile
enum ResponsiveTableStyle {
  /// Card-based layout with each row as a card
  cards,

  /// Stacked layout with label above value, dividers between rows
  stacked,

  /// Compact inline layout with label: value on same line
  inline,
}

/// Wraps markdown content and transforms tables on small screens.
///
/// This widget detects markdown tables in the raw content and replaces them
/// with a mobile-friendly layout when the screen is narrow.
class ResponsiveMarkdownWrapper extends StatelessWidget {
  final String markdownData;
  final Widget Function(String data) markdownBuilder;
  final ResponsiveTableStyle tableStyle;

  /// When true, always use responsive layout regardless of screen size.
  /// Useful for testing or forcing mobile layout on desktop.
  final bool forceResponsive;

  const ResponsiveMarkdownWrapper({
    super.key,
    required this.markdownData,
    required this.markdownBuilder,
    this.tableStyle = ResponsiveTableStyle.cards,
    this.forceResponsive = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (!forceResponsive && screenWidth >= kTableBreakpoint) {
      // Wide screen: render markdown normally
      return markdownBuilder(markdownData);
    }

    // Narrow screen or forced: parse and transform tables
    return _buildResponsiveContent(context);
  }

  Widget _buildResponsiveContent(BuildContext context) {
    final parts = _splitByTables(markdownData);

    if (parts.length == 1 && parts.first.type == _ContentType.markdown) {
      // No tables found, render normally
      return markdownBuilder(markdownData);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: parts.map((part) {
        if (part.type == _ContentType.markdown) {
          return markdownBuilder(part.content);
        } else {
          return _buildResponsiveTable(context, part.content);
        }
      }).toList(),
    );
  }

  Widget _buildResponsiveTable(BuildContext context, String tableMarkdown) {
    switch (tableStyle) {
      case ResponsiveTableStyle.cards:
        return _buildTableAsCards(context, tableMarkdown);
      case ResponsiveTableStyle.stacked:
        return _buildTableAsStacked(context, tableMarkdown);
      case ResponsiveTableStyle.inline:
        return _buildTableAsInline(context, tableMarkdown);
    }
  }

  /// Splits markdown content into regular markdown and table sections
  List<_ContentPart> _splitByTables(String content) {
    final parts = <_ContentPart>[];
    final lines = content.split('\n');
    final buffer = StringBuffer();
    final tableBuffer = StringBuffer();
    bool inTable = false;

    for (int i = 0; i < lines.length; i++) {
      final line = lines[i];
      final isTableLine = _isTableLine(line);
      final isDelimiterLine = _isTableDelimiter(line);

      if (!inTable && isTableLine) {
        // Check if next line is a delimiter (confirming this is a table header)
        if (i + 1 < lines.length && _isTableDelimiter(lines[i + 1])) {
          // Save any preceding markdown
          if (buffer.isNotEmpty) {
            parts.add(
              _ContentPart(_ContentType.markdown, buffer.toString().trim()),
            );
            buffer.clear();
          }
          inTable = true;
          tableBuffer.writeln(line);
        } else {
          buffer.writeln(line);
        }
      } else if (inTable) {
        if (isTableLine || isDelimiterLine) {
          tableBuffer.writeln(line);
        } else {
          // End of table
          parts.add(
            _ContentPart(_ContentType.table, tableBuffer.toString().trim()),
          );
          tableBuffer.clear();
          inTable = false;
          buffer.writeln(line);
        }
      } else {
        buffer.writeln(line);
      }
    }

    // Handle remaining content
    if (inTable && tableBuffer.isNotEmpty) {
      parts.add(
        _ContentPart(_ContentType.table, tableBuffer.toString().trim()),
      );
    } else if (buffer.isNotEmpty) {
      parts.add(_ContentPart(_ContentType.markdown, buffer.toString().trim()));
    }

    return parts;
  }

  bool _isTableLine(String line) {
    final trimmed = line.trim();
    return trimmed.contains('|') && !_isTableDelimiter(trimmed);
  }

  bool _isTableDelimiter(String line) {
    final trimmed = line.trim();
    // Match lines like |---|---| or |:--|:--:| etc.
    return RegExp(r'^[\|\s\-:]+$').hasMatch(trimmed) && trimmed.contains('-');
  }

  Widget _buildTableAsCards(BuildContext context, String tableMarkdown) {
    final parsed = _parseTable(tableMarkdown);
    if (parsed == null) return const SizedBox.shrink();

    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: parsed.rows.asMap().entries.map((entry) {
        final rowIndex = entry.key;
        final row = entry.value;

        return Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header bar with row number
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                ),
                child: Text(
                  '${rowIndex + 1}',
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: theme.colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Each cell as label-value pair
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(row.length, (colIndex) {
                    final label = colIndex < parsed.headers.length
                        ? parsed.headers[colIndex]
                        : 'Column ${colIndex + 1}';
                    final value = row[colIndex];

                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: colIndex < row.length - 1 ? 12 : 0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            label.toUpperCase(),
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.outline,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 4),
                          markdownBuilder(value),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  /// Stacked layout: horizontal grid with label-value pairs side by side
  Widget _buildTableAsStacked(BuildContext context, String tableMarkdown) {
    final parsed = _parseTable(tableMarkdown);
    if (parsed == null) return const SizedBox.shrink();

    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: parsed.rows.asMap().entries.map((entry) {
        final rowIndex = entry.key;
        final row = entry.value;
        final isFirst = rowIndex == 0;

        return Container(
          margin: EdgeInsets.only(top: isFirst ? 0 : 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: rowIndex.isEven
                ? theme.colorScheme.surfaceContainerLowest
                : theme.colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Wrap(
            spacing: 16,
            runSpacing: 8,
            children: List.generate(row.length, (colIndex) {
              final label = colIndex < parsed.headers.length
                  ? parsed.headers[colIndex]
                  : 'Column ${colIndex + 1}';
              final value = row[colIndex];

              return Container(
                constraints: const BoxConstraints(minWidth: 120),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$label: ',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    Flexible(child: markdownBuilder(value)),
                  ],
                ),
              );
            }),
          ),
        );
      }).toList(),
    );
  }

  /// Inline layout: dense vertical list with bullet points
  Widget _buildTableAsInline(BuildContext context, String tableMarkdown) {
    final parsed = _parseTable(tableMarkdown);
    if (parsed == null) return const SizedBox.shrink();

    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: parsed.rows.asMap().entries.map((entry) {
        final rowIndex = entry.key;
        final row = entry.value;

        return Padding(
          padding: EdgeInsets.only(
            bottom: rowIndex < parsed.rows.length - 1 ? 16 : 0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row number as a small badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: theme.colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '#${rowIndex + 1}',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSecondaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Each field as a bullet item
              ...List.generate(row.length, (colIndex) {
                final label = colIndex < parsed.headers.length
                    ? parsed.headers[colIndex]
                    : 'Column ${colIndex + 1}';
                final value = row[colIndex];

                return Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '• ',
                        style: TextStyle(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '$label: ',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Expanded(child: markdownBuilder(value)),
                    ],
                  ),
                );
              }),
            ],
          ),
        );
      }).toList(),
    );
  }

  _TableData? _parseTable(String tableMarkdown) {
    final lines = tableMarkdown
        .split('\n')
        .where((l) => l.trim().isNotEmpty)
        .toList();
    if (lines.length < 2) return null;

    final headers = _parseRow(lines[0]);
    final rows = <List<String>>[];

    for (int i = 1; i < lines.length; i++) {
      if (_isTableDelimiter(lines[i])) continue;
      rows.add(_parseRow(lines[i]));
    }

    return _TableData(headers: headers, rows: rows);
  }

  List<String> _parseRow(String line) {
    return line
        .split('|')
        .map((cell) => cell.trim())
        .where((cell) => cell.isNotEmpty)
        .toList();
  }
}

enum _ContentType { markdown, table }

class _ContentPart {
  final _ContentType type;
  final String content;

  _ContentPart(this.type, this.content);
}

class _TableData {
  final List<String> headers;
  final List<List<String>> rows;

  _TableData({required this.headers, required this.rows});
}
