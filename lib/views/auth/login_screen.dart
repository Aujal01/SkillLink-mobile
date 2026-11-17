import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/user_model.dart';
import '../../viewmodels/auth_viewmodel.dart';
import '../discovery/discovery_screen.dart';

class LoginScreen extends StatefulWidget { const LoginScreen({super.key}); @override State<LoginScreen> createState() => _LoginScreenState(); }
class _LoginScreenState extends State<LoginScreen> {
  final name = TextEditingController(); UserRole role = UserRole.client;
  @override void dispose() { name.dispose(); super.dispose(); }
  @override Widget build(BuildContext context) => Scaffold(body: SafeArea(child: Center(child: SingleChildScrollView(padding: const EdgeInsets.all(24), child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 440), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Container(width: 58, height: 58, decoration: BoxDecoration(color: const Color(0xFF2563EB), borderRadius: BorderRadius.circular(18)), child: const Icon(Icons.link, color: Colors.white, size: 32)),
    const SizedBox(height: 28), const Text('Skills that bring us closer.', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
    const SizedBox(height: 8), const Text('Find trusted local talent or share what you do best.', style: TextStyle(color: Colors.blueGrey)), const SizedBox(height: 28),
    const Text('I’m here as a', style: TextStyle(fontWeight: FontWeight.w600)), const SizedBox(height: 10),
    SegmentedButton<UserRole>(segments: const [ButtonSegment(value: UserRole.client, label: Text('Client'), icon: Icon(Icons.search)), ButtonSegment(value: UserRole.provider, label: Text('Service Provider'), icon: Icon(Icons.handyman))], selected: {role}, onSelectionChanged: (s) => setState(() => role = s.first)),
    const SizedBox(height: 20), TextField(controller: name, decoration: const InputDecoration(labelText: 'Your name', prefixIcon: Icon(Icons.person_outline))), const SizedBox(height: 18),
    SizedBox(width: double.infinity, height: 52, child: FilledButton(onPressed: () async { await context.read<AuthViewModel>().signIn(name.text, role); if (context.mounted) Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const DiscoveryScreen())); }, child: const Text('Continue'))),
    const SizedBox(height: 16), const Center(child: Text('Made for Nepal 🇳🇵', style: TextStyle(color: Colors.blueGrey))),
  ]))))));
}
