/*
 * @Author: LinXunFeng linxunfeng@yeah.net
 * @Reop: https://github.com/LinXunFeng/flutter_scrollview_observer
 * @Date: 2022-08-29 23:43:08
 */

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scrollview_observer/scrollview_observer.dart';

class ScrollviewObserverPage extends StatefulWidget {
  @override
  State<ScrollviewObserverPage> createState() => _ScrollviewObserverPageState();
}

class _ScrollviewObserverPageState extends State<ScrollviewObserverPage> {
  ScrollController scrollController = ScrollController();

  late ListObserverController observerController;

  late ChatScrollObserver chatObserver;

  List<ChatModel> chatModels = [];

  @override
  void initState() {
    super.initState();
    chatModels = createChatModels();
    observerController = ListObserverController(controller: scrollController)
      ..cacheJumpIndexOffset = false;
    chatObserver = ChatScrollObserver(observerController)
      ..toRebuildScrollViewCallback = () {
        setState(() {});
      };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 7, 7, 7),
      appBar: AppBar(
        title: const Text("Chat"),
        backgroundColor: const Color.fromARGB(255, 19, 19, 19),
        actions: [
          IconButton(
            onPressed: () {
              chatObserver.standby();
              setState(() {
                chatModels.insert(0, ChatDataHelper.createChatModel());
              });
            },
            icon: const Icon(Icons.add_comment),
          )
        ],
      ),
      body: SafeArea(child: _buildListView()),
    );
  }

  Widget _buildListView() {
    Widget resultWidget = ListView.builder(
      physics: ChatObserverClampinScrollPhysics(observer: chatObserver),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
      shrinkWrap: chatObserver.isShrinkWrap,
      reverse: true,
      controller: scrollController,
      itemBuilder: ((context, index) {
        return ChatItemWidget(
          chatModel: chatModels[index],
          index: index,
          onRemove: () {
            chatObserver.standby(isRemove: true);
            setState(() {
              chatModels.removeAt(index);
            });
          },
        );
      }),
      itemCount: chatModels.length,
      clipBehavior: Clip.none,
    );

    resultWidget = ListViewObserver(
      controller: observerController,
      child: resultWidget,
    );
    return resultWidget;
  }

  List<ChatModel> createChatModels({int num = 3}) {
    return Iterable<int>.generate(num)
        .map((e) => ChatDataHelper.createChatModel())
        .toList();
  }
}

class ChatModel {
  ChatModel({
    required this.isOwn,
    required this.content,
  });

  final bool isOwn;
  final String content;
}

class ChatDataHelper {
  static List<String> chatContents = [
    'My name is LinXunFeng',
    'Twitter: https://twitter.com/xunfenghellolo'
        'Github: https://github.com/LinXunFeng',
    'Blog: https://fullstackaction.com/',
    'Juejin: https://juejin.cn/user/1820446984512392/posts',
    'Artile: Flutter-获取ListView当前正在显示的Widget信息\nhttps://juejin.cn/post/7103058155692621837',
    'Artile: Flutter-列表滚动定位超强辅助库，墙裂推荐！🔥\nhttps://juejin.cn/post/7129888644290068487',
    'A widget for observing data related to the child widgets being displayed in a scrollview.\nhttps://github.com/LinXunFeng/flutter_scrollview_observer',
    '📱 Swifty screen adaptation solution (Support Objective-C and Swift)\nhttps://github.com/LinXunFeng/SwiftyFitsize'
  ];

  static ChatModel createChatModel() {
    final random = Random();
    final content =
        ChatDataHelper.chatContents[random.nextInt(chatContents.length)];
    return ChatModel(isOwn: random.nextBool(), content: content);
  }
}

class ChatItemWidget extends StatelessWidget {
  const ChatItemWidget({
    Key? key,
    required this.chatModel,
    required this.index,
    this.onRemove,
  }) : super(key: key);

  final ChatModel chatModel;
  final int index;
  final Function? onRemove;

  @override
  Widget build(BuildContext context) {
    final isOwn = chatModel.isOwn;
    final nickName = isOwn ? 'LXF' : 'LQR';
    Widget resultWidget = Row(
      textDirection: isOwn ? TextDirection.rtl : TextDirection.ltr,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isOwn ? Colors.blue : Colors.white30,
          ),
          child: Center(
            child: Text(
              nickName,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isOwn
                  ? const Color.fromARGB(255, 21, 125, 200)
                  : const Color.fromARGB(255, 39, 39, 38),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              '------------ $index ------------ \n ${chatModel.content}',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(width: 50),
      ],
    );
    resultWidget = Column(
      children: [
        resultWidget,
        const SizedBox(height: 15),
      ],
    );
    resultWidget = Dismissible(
      key: UniqueKey(),
      child: resultWidget,
      onDismissed: (_) {
        onRemove?.call();
      },
    );
    return resultWidget;
  }
}
