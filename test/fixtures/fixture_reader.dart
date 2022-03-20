import 'dart:io';

String fixtureInvader(String name) =>
    File('test/fixtures/home/$name').readAsStringSync();
