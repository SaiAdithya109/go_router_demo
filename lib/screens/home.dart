import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_demo/widgets/content_widget.dart';
import 'package:go_router_demo/widgets/info_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Card Title';
    const description =
        'This is a long description that should be truncated in the card '
        'and fully visible in the bottom sheet or dialog. '
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
        'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
        'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
        'nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in '
        'reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla '
        'pariatur. Excepteur sint occaecat cupidatat non proident, sunt in '
        'culpa qui officia deserunt mollit anim id est laborum.';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        leading: IconButton(
          onPressed: () {
            context.goNamed('Login');
          },
          icon: const Icon(Icons.logout),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InfoCard(
            title: title,
            description: description,
            onTap: () {
              if (kIsWeb) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: ContentWidget(
                      title: title,
                      description: description,
                    ),
                  ),
                );
              } else {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => ContentWidget(
                    title: title,
                    description: description,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
