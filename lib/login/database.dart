import 'dart:async';

import 'package:appwrite/appwrite.dart';
import 'package:blocs/login/auth.dart';
import 'package:blocs/login/saves_data.dart';

String databaseID = '64ecd6b81e1c06990060';

final Databases databases = Databases(client);

Future<void> saveUserData(String name, String email, String userID) async {
  return await databases
      .createDocument(
          databaseId: databaseID,
          collectionId: '64ecd6f035ef980c584a',
          documentId: ID.unique(),
          data: {
            name: name,
            email: email,
            userID: userID,
          })
      .then((value) => print('Document CREATED00'))
      .catchError((e) => print(e));
}
//get user data from the database

Future getUserData() async {
  final id = SavedData.getUserId();

  try {
    final data = await databases.listDocuments(
        databaseId: databaseID,
        collectionId: '0',
        queries: [Query.equal('userId', id)]);
  } catch (e) {
    print(e);
  }
}
