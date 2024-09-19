import 'package:fluent_ui/fluent_ui.dart';
import 'package:portfolio_client/library/resource/app_typography.dart';
import 'package:portfolio_client/library/resource/app_typography_ext.dart';
import 'package:portfolio_client/library/resource/colors.dart';

class BulletList extends StatelessWidget {
  final List<String> items;

  const BulletList({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "• ", // Bullet character
                style: AppText.b2!.cl(AppColors.secondary),
              ),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: AppText.b2!.cl(AppColors.secondary),
                    children: _buildTextSpans(items[index]),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<TextSpan> _buildTextSpans(String text) {
    final List<TextSpan> spans = [];

    // Keywords to highlight
    final keywords = {
      'Flutter': AppText.b2!.cl(AppColors.primary),
      'Android': AppText.b2!.cl(AppColors.primary),
      'Golang': AppText.b2!.cl(AppColors.primary),
    };

    // Split the text around the keywords
    String remainingText = text;

    while (remainingText.isNotEmpty) {
      String match = '';
      int matchIndex = remainingText.length;

      // Find the nearest keyword in the remaining text
      for (final keyword in keywords.keys) {
        final index = remainingText.indexOf(keyword);
        if (index != -1 && index < matchIndex) {
          match = keyword;
          matchIndex = index;
        }
      }

      // If a keyword is found, add the text before the keyword, then the keyword itself
      if (match.isNotEmpty) {
        if (matchIndex > 0) {
          spans.add(TextSpan(
              text: remainingText.substring(0, matchIndex),
              style: AppText.b2!.cl(AppColors.secondary))); // Normal text
        }
        spans.add(TextSpan(
            text: match, style: keywords[match])); // Highlighted keyword
        remainingText = remainingText.substring(matchIndex + match.length);
      } else {
        // No more keywords, add the remaining text
        spans.add(TextSpan(
            text: remainingText, style: AppText.b2!.cl(AppColors.secondary)));
        remainingText = '';
      }
    }

    return spans;
  }
}
