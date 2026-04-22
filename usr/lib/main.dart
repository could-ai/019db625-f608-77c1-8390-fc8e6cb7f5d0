import 'package:flutter/material.dart';

void main() {
  runApp(const CounselingPresentationApp());
}

class CounselingPresentationApp extends StatelessWidget {
  const CounselingPresentationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counseling Skills PPT',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const PresentationScreen(),
    );
  }
}

class Slide {
  final String title;
  final String subtitle;
  final List<String> bulletPoints;
  final IconData? icon;

  const Slide({
    required this.title,
    this.subtitle = '',
    this.bulletPoints = const [],
    this.icon,
  });
}

class PresentationScreen extends StatefulWidget {
  const PresentationScreen({super.key});

  @override
  State<PresentationScreen> createState() => _PresentationScreenState();
}

class _PresentationScreenState extends State<PresentationScreen> {
  int _currentSlideIndex = 0;

  final List<Slide> _slides = const [
    Slide(
      title: 'Micro and Macro Counseling Skills',
      subtitle: 'A Psychological Perspective',
      bulletPoints: [
        'Welcome to the presentation on the fundamental skills in psychological counseling.',
        'Explore the building blocks of effective therapy.',
      ],
      icon: Icons.psychology,
    ),
    Slide(
      title: 'Introduction to Counseling Skills',
      subtitle: 'What are they?',
      bulletPoints: [
        'Essential tools for building a strong therapeutic alliance.',
        'Facilitate effective communication, deep empathy, and positive psychological change.',
        'Broadly divided into observable techniques (Micro) and conceptual frameworks (Macro).',
      ],
      icon: Icons.handshake,
    ),
    Slide(
      title: 'Micro Counseling Skills',
      subtitle: 'The "How" of Counseling',
      bulletPoints: [
        'Definition: Specific, observable behaviors and communication techniques used during a session.',
        'Purpose: To engage the client, build rapport, and facilitate exploration of thoughts and feelings.',
        'Focus: Moment-to-moment interactions and active presence.',
      ],
      icon: Icons.zoom_in,
    ),
    Slide(
      title: 'Key Micro Skills',
      subtitle: 'Techniques in Practice',
      bulletPoints: [
        'Attending Behavior: Maintaining eye contact, open body language, and vocal tone.',
        'Active Listening: Fully focusing on the client without distraction or judgment.',
        'Questioning: Using open-ended and closed questions to guide exploration.',
        'Paraphrasing: Restating the client\\'s thoughts to ensure understanding.',
        'Reflecting Feelings: Acknowledging and articulating the client\\'s emotional state.',
      ],
      icon: Icons.record_voice_over,
    ),
    Slide(
      title: 'Macro Counseling Skills',
      subtitle: 'The "What" and "Why" of Counseling',
      bulletPoints: [
        'Definition: Broader, conceptual skills used to understand overarching issues and guide therapy.',
        'Purpose: To plan treatment, apply psychological theories, and track therapeutic progress.',
        'Focus: The big picture, long-term strategy, and underlying structures of the client\\'s distress.',
      ],
      icon: Icons.zoom_out_map,
    ),
    Slide(
      title: 'Key Macro Skills',
      subtitle: 'Conceptual Frameworks',
      bulletPoints: [
        'Case Conceptualization: Understanding the root causes and maintenance factors of the problem.',
        'Goal Setting: Collaboratively defining achievable, measurable therapeutic outcomes.',
        'Treatment Planning: Selecting and structuring appropriate psychological interventions.',
        'Systemic Understanding: Considering the impact of family, culture, and society on the client.',
        'Ethical Reasoning: Navigating professional boundaries, confidentiality, and dual relationships.',
      ],
      icon: Icons.account_tree,
    ),
    Slide(
      title: 'Interplay Between Micro and Macro',
      subtitle: 'Working in Harmony',
      bulletPoints: [
        'Micro skills build the foundation: They establish trust and the therapeutic alliance.',
        'Macro skills provide the direction: They establish goals and therapeutic strategy.',
        'Without Micro: The client feels unheard; the alliance fails to form.',
        'Without Macro: Therapy lacks direction and evidence-based progress; it becomes just "talking".',
      ],
      icon: Icons.sync,
    ),
    Slide(
      title: 'Practical Application',
      subtitle: 'Skills in Action: Anxiety Case',
      bulletPoints: [
        'Scenario: A client presents with overwhelming workplace anxiety.',
        'Micro Application: The counselor uses active listening, reflects feelings of stress, and asks open questions about specific triggers.',
        'Macro Application: The counselor formulates a cognitive-behavioral conceptualization and sets a goal to reduce panic symptoms over 8 weeks using exposure techniques.',
      ],
      icon: Icons.cases_outlined,
    ),
    Slide(
      title: 'Conclusion & Q&A',
      subtitle: 'Summary',
      bulletPoints: [
        'Both micro and macro skills are vital for effective, ethical counseling.',
        'Continuous practice, self-reflection, and clinical supervision are required to master these skills.',
        'Thank you for your attention and participation.',
        'Any questions?',
      ],
      icon: Icons.forum,
    ),
  ];

  void _nextSlide() {
    if (_currentSlideIndex < _slides.length - 1) {
      setState(() {
        _currentSlideIndex++;
      });
    }
  }

  void _previousSlide() {
    if (_currentSlideIndex > 0) {
      setState(() {
        _currentSlideIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentSlide = _slides[_currentSlideIndex];
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surfaceVariant.withOpacity(0.3),
      appBar: AppBar(
        title: Text('Slide ${_currentSlideIndex + 1} of ${_slides.length}'),
        centerTitle: true,
        backgroundColor: theme.colorScheme.inversePrimary,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.all(48.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (currentSlide.icon != null)
                      Icon(
                        currentSlide.icon,
                        size: 64,
                        color: theme.colorScheme.primary,
                      ),
                    const SizedBox(height: 24),
                    Text(
                      currentSlide.title,
                      style: theme.textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    if (currentSlide.subtitle.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        currentSlide.subtitle,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          color: theme.colorScheme.primary,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                    const SizedBox(height: 48),
                    Expanded(
                      child: ListView.separated(
                        itemCount: currentSlide.bulletPoints.length,
                        separatorBuilder: (context, index) => const SizedBox(height: 16),
                        itemBuilder: (context, index) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0, right: 16.0),
                                child: Icon(
                                  Icons.circle,
                                  size: 12,
                                  color: theme.colorScheme.secondary,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  currentSlide.bulletPoints[index],
                                  style: theme.textTheme.titleLarge?.copyWith(
                                    height: 1.4,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton.icon(
              onPressed: _currentSlideIndex > 0 ? _previousSlide : null,
              icon: const Icon(Icons.arrow_back),
              label: const Text('Previous'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              ),
            ),
            LinearProgressIndicator(
              value: (_currentSlideIndex + 1) / _slides.length,
              backgroundColor: theme.colorScheme.surfaceVariant,
              valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
            ),
            ElevatedButton.icon(
              onPressed: _currentSlideIndex < _slides.length - 1 ? _nextSlide : null,
              icon: const Icon(Icons.arrow_forward),
              label: const Text('Next'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
