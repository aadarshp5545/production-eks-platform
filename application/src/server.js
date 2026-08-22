const express = require("express");
const path = require("path");

const app = express();
const PORT = process.env.PORT || 8000;

// Serve portfolio frontend
app.use(express.static(path.join(__dirname, "../frontend")));

// Health check for Kubernetes
app.get("/health", (req, res) => {
  res.status(200).json({
    status: "healthy"
  });
});

// Handle frontend routes
app.get("*", (req, res) => {
  res.sendFile(path.join(__dirname, "../frontend/index.html"));
});

// Start application
app.listen(PORT, "0.0.0.0", () => {
  console.log(`Portfolio application running on port ${PORT}`);
});