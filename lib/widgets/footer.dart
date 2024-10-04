import 'package:flutter/material.dart';
import 'package:gorevue/utils/constants.dart';

class Footer extends StatelessWidget {
  final bool isDesktop;
  const Footer({Key? key, this.isDesktop = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isDesktop
          ? AppPadding.large
          : EdgeInsets.symmetric(vertical: AppPadding.medium.top),
      color: Colors.grey[200],
      width: double.infinity,
      child: Column(
        children: [
          if (isDesktop)
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _buildFooterLinkGroup(context, [
                        ('About Us', () {}),
                        ('Terms of Service', () {}),
                        ('Privacy Policy', () {}),
                      ]),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _buildFooterLinkGroup(context, [
                        ('Help Center', () {}),
                        ('Contact Us', () {}),
                      ]),
                    ),
                  ],
                ),
              ],
            )
          else
            Column(
              children: [
                _buildFooterLinkGroup(context, [
                  ('About Us', () {}),
                  ('Terms of Service', () {}),
                  ('Privacy Policy', () {}),
                ]),
                const SizedBox(height: 16),
                _buildFooterLinkGroup(context, [
                  ('Help Center', () {}),
                  ('Contact Us', () {}),
                ]),
              ],
            ),
          const SizedBox(height: 24),
          Text(
            '© 2023 Revue. All rights reserved.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _buildFooterLinkGroup(
      BuildContext context, List<(String, VoidCallback)> links) {
    return Wrap(
      spacing: 16,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: links
          .map((link) => _buildFooterLink(context, link.$1, link.$2))
          .toList(),
    );
  }

  Widget _buildFooterLink(
      BuildContext context, String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.accent,
            ),
      ),
    );
  }
}
