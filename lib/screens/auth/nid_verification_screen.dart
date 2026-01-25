import 'package:flutter/material.dart';

class NidVerificationScreen extends StatefulWidget {
  const NidVerificationScreen({Key? key}) : super(key: key);

  @override
  State<NidVerificationScreen> createState() => _NidVerificationScreenState();
}

class _NidVerificationScreenState extends State<NidVerificationScreen> {
  late TextEditingController _nidController;
  bool _isVerifying = false;

  @override
  void initState() {
    super.initState();
    _nidController = TextEditingController();
  }

  @override
  void dispose() {
    _nidController.dispose();
    super.dispose();
  }

  void _verify() async {
    if (_nidController.text.length != 13) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('NID must be 13 digits')),
      );
      return;
    }

    setState(() => _isVerifying = true);
    try {
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('NID verified successfully')),
        );
        Navigator.of(context).pushReplacementNamed('/student-dashboard');
      }
    } finally {
      if (mounted) {
        setState(() => _isVerifying = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NID Verification')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Verify Your NID',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Please enter your 13-digit National ID number',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 32),
            TextFormField(
              controller: _nidController,
              decoration: InputDecoration(
                labelText: 'NID Number',
                hintText: 'Enter your 13-digit NID',
                prefixIcon: const Icon(Icons.credit_card),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              keyboardType: TextInputType.number,
              maxLength: 13,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: _isVerifying ? null : _verify,
                child: _isVerifying
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : const Text('Verify'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
