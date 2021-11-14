// Zee5CheckerBot
// Copyright (C) 2021 Akash Pattnaik
//
// This file is a part of < https://github.com/BLUE-DEVIL1134/Zee5CheckerBot/ >
// PLease read the GNU Affero General Public License in
// <https://github.com/BLUE-DEVIL1134/Zee5CheckerBot/blob/main/LICENSE/>.

// InBuilt
import 'dart:io' as io;
import 'dart:io' show Platform, exit;
import 'dart:core';

// Package
import 'package:teledart/teledart.dart' show TeleDart, Event;
import 'package:teledart/telegram.dart' show Telegram;
import 'package:zee5_checker_bot/zee5_checker_bot.dart';


// Global Vars
final HitsDB = io.File('database.hits');
var hits = [];


void main() async {
  if (Platform.environment['botToken']! == '') {
    print('No botToken Specified...');
    exit(1);
  }
  print('Starting Bot With Token - "${Platform.environment['botToken']!}"');
  var bot = TeleDart(
    Telegram(Platform.environment['botToken']!),
    Event((await Telegram(Platform.environment['botToken']!).getMe()).username!),
  );

  bot.start();

  bot.onCommand('start').listen((message) async {
    start(bot, message);
  });

  bot.onCommand('commands').listen((message) async {
    commands(bot, message, Platform.environment['userId'] ?? '1003250439');
  });

  bot.onCommand('check').listen((message) async {
    check(bot, message, Platform.environment['userId'] ?? '1003250439');
  });

  bot.onCommand('source').listen((message) async {
    source(bot, message);
  });

  bot.onCommand('sysinfo').listen((message) async {
    sysinfo(bot, message, Platform.environment['userId'] ?? '1003250439');
  });

  bot.onMessage(entityType: '*').listen((event) async {
    checker(bot, event, Platform.environment['userId'] ?? '1003250439', hits, HitsDB, Platform.environment['botToken']!);
  });
}
