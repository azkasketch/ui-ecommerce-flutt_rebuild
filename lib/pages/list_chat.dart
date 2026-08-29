import 'package:flutter/material.dart';

import '../theme.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

class ListChatPage extends StatelessWidget {
  const ListChatPage({super.key});

  final chats = const [
    (
      name: 'Vanta concierge',
      message: 'Your order is on its way ✨',
      time: '12:30',
      icon: Icons.auto_awesome,
      color: lavender,
    ),
    (
      name: 'Onda Studio',
      message: 'Thanks for reaching out!',
      time: 'Yesterday',
      icon: Icons.checkroom_rounded,
      color: mint,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Messages',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_rounded),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
        children: [
          const Text(
            'Stay in the loop',
            style: TextStyle(color: muted, fontSize: 14),
          ),
          const SizedBox(height: 20),
          ...chats.map(
            (chat) => ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 8),
              leading: Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: chat.color,
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Icon(chat.icon, color: ink, size: 24),
              ),
              title: Text(
                chat.name,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  chat.message,
                  style: const TextStyle(color: muted, fontSize: 12),
                ),
              ),
              trailing: Text(
                chat.time,
                style: const TextStyle(color: muted, fontSize: 11),
              ),
              onTap: () => Navigator.pushNamed(context, 'ChatDetail'),
            ),
          ),
        ],
      ),
    );
  }
}
