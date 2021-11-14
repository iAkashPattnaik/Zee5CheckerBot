// Packages
import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart' show TeleDart;

void check(TeleDart bot, TeleDartMessage message, String UserId) async {
  if (message.from!.id.toString() != UserId) {
    await message.reply('You Can\'t Use This Bot.');
    return;
  }
  await bot.telegram.sendMessage(message.chat.id, '*Now Send The Combos File,\nPls Phast\n\nAnd Star The Github Repo.*',
    reply_to_message_id: message.message_id,
    parse_mode: 'markdown',
    reply_markup: ForceReply(
      force_reply: true
    ),
  );
}