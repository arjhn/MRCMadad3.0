import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mrc_madad_3/constants/messages/messages_complaints.dart';
import 'package:mrc_madad_3/providers/provider_message_mockup.dart';
import 'package:mrc_madad_3/ui/chat/chat_main_screen.dart';
import 'package:provider/provider.dart';

class ComplaintsMainScreen extends StatefulWidget {
  const ComplaintsMainScreen({Key? key}) : super(key: key);

  @override
  _ComplaintsMainScreenState createState() => _ComplaintsMainScreenState();
}

class _ComplaintsMainScreenState extends State<ComplaintsMainScreen> with TickerProviderStateMixin {

  late Animation _animation;
  late AnimationController mainAnimationController;

  @override
  void initState(){
    super.initState();
    mainAnimationController=AnimationController(
        duration: Duration(milliseconds: 1000),
        vsync: this
    )..forward();
    _animation=Tween<double>(
        begin: 0.0,
        end: 1.0
    ).animate(CurvedAnimation(
        parent: mainAnimationController,
        curve: Curves.easeInOut
    ));
  }

  @override
  void dispose(){
    mainAnimationController..reverse();
    mainAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              child: AnimatedBuilder(
                  animation: _animation,
                  builder: (BuildContext context, Widget? child) {
                    return ShaderMask(
                        shaderCallback: (rect) {
                          return RadialGradient(
                              radius: _animation.value * 5,
                              colors: [Colors.white, Colors.white, Colors.white, Colors.transparent],
                              stops: [0.0, 0.3, 0.6, 1.0],
                              center: FractionalOffset(0.9, 0.95)
                          ).createShader(rect);
                        },
                        child: buildChatBody()
                    );
                  }),
            );
          },
        ));
  }

  Widget buildChatBody(){
    return Container(
      color:Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ChatMainScreen(
        messageData: MessagesComplaint().complaintMessages['en'] ?? [],
      ),
    );
  }
}
