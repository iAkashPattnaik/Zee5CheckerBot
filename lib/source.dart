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

void source(TeleDart bot, TeleDartMessage message) async {
  await message.replyPhoto(
    io.File('./src/logo.png'),
    caption: '<b>My Source Code Is On Github...\n'
            'https://github.com/BLUE-DEVIL1134/Zee5CheckerBot/\n'
            '\n'
            'Please Star The Repo For More Support.</b>',
    parse_mode: 'html'
  );
}