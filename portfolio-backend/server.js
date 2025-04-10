const express = require('express');
const nodemailer = require('nodemailer');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
const port = 3000;

// Enable CORS
app.use(cors());

// Middleware to parse incoming JSON
app.use(bodyParser.json());

// POST route to handle contact form submission
app.post('/send-message', async (req, res) => {
  const { name, email, message } = req.body;

  // Validate input
  if (!name || !email || !message) {
    return res.status(400).json({ error: 'All fields are required' });
  }

  // Set up email transporter (use your email provider's SMTP settings)
  const transporter = nodemailer.createTransport({
    service: 'gmail', 
    auth: {
      user: 'ujjawaljadhav03082002@gmail.com',
      pass: '451332',
    },
    logger: true,  // Logs the process
    debug: true,  
  });

  const mailOptions = {
    from: email,
    to: 'ujjawaljadhav03082002@gmail.com',
    subject: `Contact Message from ${name}`,
    text: message,
  };

  try {
    // Send email
    await transporter.sendMail(mailOptions);
    res.status(200).json({ message: 'Message sent successfully!' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Failed to send message' });
  }
});

// Start the server
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
