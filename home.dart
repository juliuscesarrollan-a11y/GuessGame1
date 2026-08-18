import 'package:flutter/material.dart';

import 'quiz.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  final Color blue = const Color(0xFF1976D2);
  final Color lightBlue = const Color(0xFFEAF4FF);

  void openQuiz(BuildContext context, String type) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => Quiz(type: type)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F9FD),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(22, 20, 22, 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, Learner 👋',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Guess & Learn',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF172033),
                        ),
                      ),
                    ],
                  ),

                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: blue,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.school_rounded,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [blue, const Color(0xFF42A5F5)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(26),
                  boxShadow: [
                    BoxShadow(
                      color: blue.withOpacity(.25),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Ready to Learn?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Challenge yourself and discover amazing facts!',
                            style: TextStyle(
                              color: Colors.white.withOpacity(.9),
                              fontSize: 14,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 10),

                    const Text('🧠', style: TextStyle(fontSize: 55)),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Choose a Game',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF172033),
                    ),
                  ),
                  Text(
                    '2 Games',
                    style: TextStyle(color: blue, fontWeight: FontWeight.w600),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              gameCard(
                context,
                type: 'Animal',
                icon: Icons.pets_rounded,
                title: 'Guess the Animal',
                subtitle: 'Identify animals and learn fun facts.',
                color: blue,
              ),

              const SizedBox(height: 16),

              gameCard(
                context,
                type: 'Fruit',
                icon: Icons.apple_rounded,
                title: 'Guess the Fruit',
                subtitle: 'Identify fruits and discover nutrition facts.',
                color: const Color(0xFF2196F3),
              ),

              const SizedBox(height: 28),

              const Text(
                'Why Play?',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF172033),
                ),
              ),

              const SizedBox(height: 14),

              Row(
                children: [
                  infoCard(
                    icon: Icons.lightbulb_rounded,
                    title: 'Learn',
                    subtitle: 'New facts',
                  ),
                  const SizedBox(width: 12),
                  infoCard(
                    icon: Icons.emoji_events_rounded,
                    title: 'Score',
                    subtitle: 'Earn points',
                  ),
                  const SizedBox(width: 12),
                  infoCard(
                    icon: Icons.psychology_rounded,
                    title: 'Think',
                    subtitle: 'Test yourself',
                  ),
                ],
              ),

              const SizedBox(height: 35),

              Center(
                child: Text(
                  'Learn • Guess • Have Fun! 🎓',
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget gameCard(
    BuildContext context, {
    required String type,
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: () => openQuiz(context, type),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xFFE4ECF5)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              blurRadius: 15,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 68,
              height: 68,
              decoration: BoxDecoration(
                color: lightBlue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(icon, color: color, size: 34),
            ),

            const SizedBox(width: 17),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF172033),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 13,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 10),

            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(13),
              ),
              child: const Icon(
                Icons.arrow_forward_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget infoCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFE4ECF5)),
        ),
        child: Column(
          children: [
            Icon(icon, color: blue, size: 26),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 3),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade500, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
