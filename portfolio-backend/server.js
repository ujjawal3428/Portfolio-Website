const express = require('express');
const nodemailer = require('nodemailer');
const bodyParser = require('body-parser');

const app = express();
const port = 52789; // Ensure this matches the port in your Flutter code

// Middleware to parse JSON body
app.use(bodyParser.json());

// Set up Nodemailer
const transporter = nodemailer.createTransport({
  service: 'gmail', // You can use Gmail or another email service provider
  auth: {
    user: 'ujjawal.4328@gmail.com', // Replace with your email
    pass: '4328@gmail.com',  // Replace with your email password or app-specific password
  },
});

// Endpoint to handle form submission
app.post('/send-message', (req, res) => {
  const { name, email, message } = req.body;

  // Define email options
  const mailOptions = {
    from: email,  // Sender's email (user's email)
    to: 'ujjawal.4328@gmail.com',  // Replace with your email address to receive messages
    subject: `Message from ${name}`,
    text: `Message: ${message}\n\nFrom: ${name}\nEmail: ${email}`,
  };

  // Send email
  transporter.sendMail(mailOptions, (error, info) => {
    if (error) {
      console.error(error);
      return res.status(500).json({ message: 'Failed to send message' });
    }
    console.log('Message sent: ' + info.response);
    return res.status(200).json({ message: 'Message sent successfully' });
  });
});

// Start the server
app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
