import 'dart:ui';

import 'package:appwrite/appwrite.dart';
import 'package:blocs/login/database.dart';
import 'package:blocs/login/saves_data.dart';

Client client = Client()
    .setEndpoint('https://cloud.appwrite.io/v1')
    .setProject('64eb7954b0c67aad513e')
    .setSelfSigned(
        status: true); // For self signed certificates, only use for development

Account account = Account(client);
// Register User
Future<String> createUser(String name, String email, String password) async {
  try {
    final user = await account.create(
        userId: ID.unique(), email: email, password: password, name: name);
    saveUserData(name, email, user.$id);

    return "success";
  } on AppwriteException catch (e) {
    return e.message.toString();
  }
}

// Login User

Future loginUser(String email, String password) async {
  try {
    final user =
        await account.createEmailSession(email: email, password: password);

    SavedData.saveUserid(user.userId);
    return true;
  } on AppwriteException {
    return false;
  }
}

// Logout the user
Future logoutUser() async {
  await account.deleteSession(sessionId: 'current');
}

// check if user have an active session or not

Future checkSessions() async {
  try {
    await account.getSession(sessionId: 'current');
    return true;
  } catch (e) {
    return false;
  }
}
