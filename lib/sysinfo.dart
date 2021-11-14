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

void sysinfo(TeleDart bot, TeleDartMessage message, String UserId) async {
  var Owner = await bot.telegram.getChatMember(UserId, int.parse(UserId));
  await message.reply(
    '<b>Dart BinChecker Bot System Information\n\n'
    'Operating System : ${io.Platform.operatingSystem}\n'
    'IsLinux : ${io.Platform.isLinux}\n'
    'Number Of Processors : ${io.Platform.numberOfProcessors}\n'
    'Dart Version : 2.14.4 (stable)\n'
    'Owner : <a href="${"tg://user?id=${Owner.user.id}"}">'
    '${Owner.user.first_name}</a>\n\n'
    'Deployed To : Heroku (For Now)</b>',
    parse_mode: 'html'
  );
}