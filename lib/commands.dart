// Zee5CheckerBot
// Copyright (C) 2021 Akash Pattnaik
//
// This file is a part of < https://github.com/BLUE-DEVIL1134/Zee5CheckerBot/ >
// PLease read the GNU Affero General Public License in
// <https://github.com/BLUE-DEVIL1134/Zee5CheckerBot/blob/main/LICENSE/>.

// Packages
import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart' show TeleDart;
void commands(TeleDart bot, TeleDartMessage message, String UserId) async {
  var Owner = await bot.telegram.getChatMember(UserId, int.parse(UserId));
  await message.reply(
    '<b>Commands\n'
    '\n'
    '/start - To Start The Bot\n'
    '/commands - To Display This Message\n'
    '/source - To Get The Link Of The Source\n'
    '/sysinfo - To Get Information About The System\n'
    '/check - To Check The Combos File\n'
    '\n'
    'Note -> First Send The Command /check Then The Combos File\n'
    'Can Be Used Only By <a href="${"tg://user?id=${Owner.user.id}"}">'
    '${Owner.user.first_name}</a>.</b>',
    parse_mode: 'html'
  );
}