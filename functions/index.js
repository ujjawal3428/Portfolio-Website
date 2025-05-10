const functions = require("firebase-functions");
const nodemailer = require("nodemailer");

// Securely access Firebase function config
const gmailEmail = functions.config().gmail.email;
const gmailPassword = functions.config().gmail.password;

// Nodemailer transporter setup
const transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: gmailEmail,
    pass: gmailPassword,
  },
});

// Cloud Function to send contact form message
exports.sendContactMessage = functions.https.onRequest((req, res) => {
  const {name, email, message} = req.body;

  if (!name || !email || !message) {
    return res.status(400).send("Missing fields.");
  }

  const mailOptions = {
    from: email,
    to: gmailEmail,
    subject: `New Contact Message from ${name}`,
    html: `
      <p><strong>Name:</strong> ${name}</p>
      <p><strong>Email:</strong> ${email}</p>
      <p><strong>Message:</strong><br/>${message}</p>
    `,
  };

  transporter.sendMail(mailOptions, (error, info) => {
    if (error) {
      console.error("Email sending failed:", error);
      return res.status(500).send("Failed to send email.");
    }
    return res.status(200).send("Email sent successfully!");
  });
});
