// Zee5CheckerBot
// Copyright (C) 2021 Akash Pattnaik
//
// This file is a part of < https://github.com/BLUE-DEVIL1134/Zee5CheckerBot/ >
// PLease read the GNU Affero General Public License in
// <https://github.com/BLUE-DEVIL1134/Zee5CheckerBot/blob/main/LICENSE/>.

// InBuilt
import 'dart:io' as io;

// Packages
import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart' show TeleDart;

void start(TeleDart bot, TeleDartMessage message) async {
  var list = ['./src/welcome_photo.webp', './src/welcome_animation.tgs', './src/welcome_photo2.webp', './src/welcome_photo3.webp'];
  var random = (list..shuffle()).first;
  if (random.endsWith('.webp')) {
    await message.replySticker(
      io.File(random)
    );
  } else if (random.endsWith('.tgs')) {
    await message.replyAnimation(
      io.File(random)
    );
  }
  await message.reply(
    '<b>Hoi ${message.from!.first_name},\nWelcome To AKASH_AM1 Zee5 Bulk Checker..'
    '\n\nAll My Commands Are Here - /commands</b>', parse_mode: 'html'
  );
}