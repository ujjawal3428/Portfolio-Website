import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  Future<void> _sendMessage() async {
    final String name = _nameController.text;
    final String email = _emailController.text;
    final String message = _messageController.text;

    if (name.isEmpty || email.isEmpty || message.isEmpty) {
      _showDialog("Error", "Please fill in all fields.");
      return;
    }

    final uri = Uri.parse('https://formsubmit.co/ujjawal.4328@gmail.com'); // Replace with your email

    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'name': name,
        'email': email,
        'message': message,
        '_captcha': 'false', // Disable captcha (optional)
        '_template': 'table', // Optional: email will have a table format
      },
    );

    if (response.statusCode == 200) {
      _showDialog("Success", "Message sent successfully!");
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    } else {
      _showDialog("Failed", "Failed to send message. Please try again.");
    }
  }

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        key: const Key('contactSection'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Contact Me",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Monteserrat',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Your Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: "Your Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _messageController,
              decoration: const InputDecoration(
                labelText: "Type message...",
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendMessage,
              child: const Text("Send Message"),
            ),
          ],
        ),
      ),
    );
  }
}
