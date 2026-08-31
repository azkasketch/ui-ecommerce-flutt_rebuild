import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      name: 'Bakul concierge',
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
        title: Text(
          'Messages',
          style: GoogleFonts.instrumentSerif(
            fontWeight: FontWeight.w700,
            fontSize: 28,
            color: Colors.white,
          ),
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
          Text(
            'Stay in the loop',
            style: GoogleFonts.instrumentSans(
              color: muted,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
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
                style: GoogleFonts.instrumentSans(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  chat.message,
                  style: GoogleFonts.instrumentSans(
                    color: muted,
                    fontSize: 12,
                  ),
                ),
              ),
              trailing: Text(
                chat.time,
                style: GoogleFonts.instrumentSans(
                  color: muted,
                  fontSize: 11,
                ),
              ),
              onTap: () => Navigator.pushNamed(context, 'ChatDetail'),
            ),
          ),
        ],
      ),
    );
  }
}
