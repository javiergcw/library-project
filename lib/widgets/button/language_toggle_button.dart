import 'package:flutter/material.dart';
import 'package:project_library/core/res/res.dart';

class LanguageToggleButton extends StatefulWidget {
  const LanguageToggleButton({super.key});

  @override
  LanguageToggleButtonState createState() => LanguageToggleButtonState();
}

class LanguageToggleButtonState extends State<LanguageToggleButton>
    with SingleTickerProviderStateMixin {
  bool isEnglish = true;
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isEnglish = !isEnglish;
          _controller.forward().then((value) => _controller.reverse());
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: const Offset(0, 4),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildFlag(
              imagePath: Assets.flagReinoUnido,
              isSelected: isEnglish,
            ),
            _buildFlag(
              imagePath: Assets.flagColombia,
              isSelected: !isEnglish,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFlag({required String imagePath, required bool isSelected}) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: isSelected
          ? ScaleTransition(
              scale: _scaleAnimation,
              child: Container(
                key: ValueKey(imagePath),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  imagePath,
                  width: 20,
                  height: 20,
                ),
              ),
            )
          : Container(
              key: ValueKey(imagePath),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                imagePath,
                width: 20,
                height: 20,
              ),
            ),
    );
  }
}
