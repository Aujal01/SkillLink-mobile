import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../models/gig_model.dart';
import '../../viewmodels/booking_viewmodel.dart';
import '../../viewmodels/gig_discovery_viewmodel.dart';
import '../booking/booking_tracker_screen.dart';

class DiscoveryScreen extends StatefulWidget { const DiscoveryScreen({super.key}); @override State<DiscoveryScreen> createState() => _DiscoveryScreenState(); }
class _DiscoveryScreenState extends State<DiscoveryScreen> {
  @override void initState() { super.initState(); WidgetsBinding.instance.addPostFrameCallback((_) => context.read<GigDiscoveryViewModel>().loadGigs()); }
  @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('SkillLink', style: TextStyle(fontWeight: FontWeight.bold)), actions: [IconButton(tooltip: 'Bookings', icon: const Icon(Icons.receipt_long_outlined), onPressed: () { context.read<BookingViewModel>().loadBookings(); Navigator.push(context, MaterialPageRoute(builder: (_) => const BookingTrackerScreen())); })]), body: Consumer<GigDiscoveryViewModel>(builder: (context, vm, _) => ListView(padding: const EdgeInsets.fromLTRB(18, 8, 18, 28), children: [
    const Text('Discover local skills', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.slate)), const SizedBox(height: 4), const Text('Great people, right around you', style: TextStyle(color: Colors.blueGrey)), const SizedBox(height: 18),
    TextField(onChanged: vm.setQuery, decoration: const InputDecoration(hintText: 'Try “tutor” or “repair”', prefixIcon: Icon(Icons.search))), const SizedBox(height: 14),
    SizedBox(height: 40, child: ListView(scrollDirection: Axis.horizontal, children: vm.categories.map((c) => Padding(padding: const EdgeInsets.only(right: 8), child: ChoiceChip(label: Text(c), selected: vm.category == c, onSelected: (_) => vm.setCategory(c)))).toList())),
    const SizedBox(height: 8), Wrap(spacing: 8, children: [FilterChip(label: const Text('Under रु 2,000'), selected: vm.maxPrice == 2000, onSelected: (v) => vm.setMaxPrice(v ? 2000 : null)), FilterChip(label: const Text('4.8+ rating'), selected: vm.minRating == 4.8, onSelected: (v) => vm.setMinRating(v ? 4.8 : 0))]), const SizedBox(height: 8),
    if (vm.isLoading) const Center(child: Padding(padding: EdgeInsets.all(32), child: CircularProgressIndicator())) else if (vm.error != null) Center(child: Text(vm.error!)) else if (vm.filteredGigs.isEmpty) const Padding(padding: EdgeInsets.all(28), child: Center(child: Text('No services match those filters.'))) else ...vm.filteredGigs.map((gig) => _GigCard(gig: gig)),
  ])));
}

class _GigCard extends StatelessWidget { const _GigCard({required this.gig}); final GigModel gig;
  @override Widget build(BuildContext context) => Card(margin: const EdgeInsets.only(top: 12), elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18), side: const BorderSide(color: Color(0xFFE2E8F0))), child: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Row(children: [Container(width: 52, height: 52, alignment: Alignment.center, decoration: BoxDecoration(color: const Color(0xFFEFF6FF), borderRadius: BorderRadius.circular(15)), child: Text(gig.emoji, style: const TextStyle(fontSize: 26))), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(gig.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)), Text('${gig.provider} · ${gig.location}', style: const TextStyle(color: Colors.blueGrey, fontSize: 12))])), const Icon(Icons.star, color: Colors.amber, size: 18), Text(gig.rating.toStringAsFixed(1), style: const TextStyle(fontWeight: FontWeight.w600))]),
    const SizedBox(height: 12), Text(gig.description, style: const TextStyle(color: Colors.blueGrey)), const SizedBox(height: 14), Row(children: [Text('रु ${gig.priceNpr}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary)), const Text(' / service', style: TextStyle(color: Colors.blueGrey)), const Spacer(), FilledButton.tonal(onPressed: () { context.read<BookingViewModel>().loadBookings(); Navigator.push(context, MaterialPageRoute(builder: (_) => const BookingTrackerScreen())); }, child: const Text('Book'))])
  ])));
}
