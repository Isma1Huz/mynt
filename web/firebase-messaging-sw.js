importScripts("https://www.gstatic.com/firebasejs/7.20.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/7.20.0/firebase-messaging.js");

firebase.initializeApp({
  apiKey: "AIzaSyDsmLT2PirDMygOld062sKi0hmnOEVE_tE",
  authDomain: "mynt-49732.firebaseapp.com",
  projectId: "mynt-49732",
  storageBucket: "mynt-49732.appspot.com",
  messagingSenderId: "334819162485",
  appId: "1:334819162485:web:53980cc88a23bb5ae6fb3c",
  databaseURL: "...",
});
const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);
});