import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hakim_hub_mobile/features/chatbot/presentation/widgets/chat_initial_page.dart';
import 'package:hakim_hub_mobile/features/chatbot/presentation/widgets/chat_loading_page.dart';
import 'package:hakim_hub_mobile/features/chatbot/presentation/widgets/chat_response_page.dart';
import 'package:hakim_hub_mobile/features/chatbot/presentation/widgets/message_input_card.dart';
import '../../../../core/utils/colors.dart';
import '../../../../router/routes.dart';
import '../../domain/entities/chat_request_entity.dart';
import '../bloc/chat_bot_bloc.dart';

class ChatPage extends StatefulWidget {
  // String chatBotIntialMessage;
  List chatMessages;
  ChatPage({required this.chatMessages, super.key});
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ChatBotBloc>(context).add(GetChatResponseEvent(
        request: ChatRequest(
            message: widget.chatMessages[0][1],
            address: "ipadhgjlpopoplkdress",
            isNew: true)));
  }

  void clearChat() {
    setState(() {
      widget.chatMessages.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        shadowColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => {
            clearChat(),
            BlocProvider.of<ChatBotBloc>(context).add(SetIntialStateEvent()),
            context.goNamed(AppRoutes.Home, queryParameters: {
              "index": "1",
            }),
          },
          child: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
              color: primaryColor,
            ),
            onPressed: () {
              clearChat();
              BlocProvider.of<ChatBotBloc>(context).add(SetIntialStateEvent());
              context.goNamed(AppRoutes.Home, queryParameters: {
                "index": "1",
              });
            },
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          BlocBuilder<ChatBotBloc, ChatBotState>(
            builder: (context, state) {
              if (state is ChatBotInitialState) {
                return ChatResponseScreen(chatMessages: widget.chatMessages);
              } else if (state is ChatBotLoadingState) {
                return ChatLoadingScreen(chatMessages: widget.chatMessages);
              } else if (state is ChatBotSuccessState) {
                widget.chatMessages.add([1, state.chatResponse]);
                return ChatResponseScreen(chatMessages: widget.chatMessages);
              } else {
                return ChatInitialPage(chatMessages: widget.chatMessages);
              }
            },
          ),
          MessageInputCard(chatMessages: widget.chatMessages)

          // writeChatField(_textEditingController, _sendMessage)
        ],
      ),
    );
  }
}
