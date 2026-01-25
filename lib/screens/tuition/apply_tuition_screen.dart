import 'package:flutter/material.dart';

class ApplyTuitionScreen extends StatefulWidget {
  final String tuitionId;

  const ApplyTuitionScreen({Key? key, required this.tuitionId})
      : super(key: key);

  @override
  State<ApplyTuitionScreen> createState() => _ApplyTuitionScreenState();
}

class _ApplyTuitionScreenState extends State<ApplyTuitionScreen> {
  late TextEditingController _startDateController;
  late TextEditingController _frequencyController;
  late TextEditingController _messageController;
  bool _isApplying = false;

  @override
  void initState() {
    super.initState();
    _startDateController = TextEditingController();
    _frequencyController = TextEditingController();
    _messageController = TextEditingController();
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _frequencyController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitApplication() async {
    if (_startDateController.text.isEmpty || _frequencyController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields')),
      );
      return;
    }

    setState(() => _isApplying = true);
    try {
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Application sent successfully')),
        );
        Navigator.of(context).pop();
      }
    } finally {
      if (mounted) {
        setState(() => _isApplying = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Apply for Tuition')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tuition Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _startDateController,
              decoration: InputDecoration(
                labelText: 'Start Date',
                hintText: 'Select date',
                prefixIcon: const Icon(Icons.calendar_today),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              readOnly: true,
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                if (date != null) {
                  _startDateController.text =
                      '${date.day}/${date.month}/${date.year}';
                }
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _frequencyController,
              decoration: InputDecoration(
                labelText: 'Frequency (days per week)',
                hintText: 'e.g., 2, 3, 4',
                prefixIcon: const Icon(Icons.repeat),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _messageController,
              decoration: InputDecoration(
                labelText: 'Message to Tutor',
                hintText: 'Tell tutor about yourself',
                prefixIcon: const Icon(Icons.message),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Hourly Rate'),
                        Text('৳800'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Hours per week'),
                        Text('6 hours'),
                      ],
                    ),
                    const Divider(height: 16),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Weekly Cost',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '৳4,800',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF6366F1),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: _isApplying ? null : _submitApplication,
                child: _isApplying
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : const Text('Send Application'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
