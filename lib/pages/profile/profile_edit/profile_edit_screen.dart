import 'package:flutter/material.dart';
import 'package:flutter_app/pages/profile/provider/profile_provider.dart';
import 'package:provider/provider.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileProvider(), // Local Provider for this screen
      child: Builder(
        builder: (context) {
          // Ensure correct BuildContext is used here
          return Scaffold(
            appBar: AppBar(
              title: const Text('Details Page'),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Counter:'),
                Consumer<ProfileProvider>(
                  builder: (context, provider, _) {
                    return Text(
                      '${provider.count}', // Using the local ProfileProvider
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<ProfileProvider>()
                            .increment(); // Increment button
                      },
                      child: const Text('Increment'),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<ProfileProvider>()
                            .decrement(); // Decrement button
                      },
                      child: const Text('Decrement'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
