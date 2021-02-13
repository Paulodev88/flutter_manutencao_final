import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_it/get_it.dart';
import 'package:manutencao_parse/stores/page_store.dart';

class CreateManutencaoButton extends StatefulWidget {
  CreateManutencaoButton(this.scrollController);
  final ScrollController scrollController;
  @override
  _CreateManutencaoButtonState createState() => _CreateManutencaoButtonState();
}

class _CreateManutencaoButtonState extends State<CreateManutencaoButton>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> buttonAnimation;
  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    buttonAnimation = Tween<double>(begin: 0, end: 66).animate(
        CurvedAnimation(parent: controller, curve: Interval(0.4, 0.6)));
    widget.scrollController.addListener(scrollChanged);
  }

  void scrollChanged() {
    final s = widget.scrollController.position;
    if (s.userScrollDirection == ScrollDirection.forward) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: buttonAnimation,
      builder: (_, __) {
        return FractionallySizedBox(
          widthFactor: 0.6,
          child: Container(
            height: 50,
            margin: EdgeInsets.only(bottom: buttonAnimation.value),
            child: RaisedButton(
              color: Colors.blue,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                children: [
                  Icon(
                    Icons.camera,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      "Criar Manutenção",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
              onPressed: () {
                GetIt.I<PageStore>().setPage(1);
              },
            ),
          ),
        );
      },
    );
  }
}
