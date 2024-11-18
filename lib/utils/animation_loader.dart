import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomAnimationLoaderWidget extends StatelessWidget {
  const CustomAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomCenter,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation,
              width: MediaQuery.of(context).size.width *
                  0.4), // Display Lottie animation

          Padding(
            padding: const EdgeInsets.only(bottom: 58.0),
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),

          // showAction
          //     ? SizedBox(
          //         width: 250,
          //         child: OutlinedButton(
          //           onPressed: onActionPressed,
          //           style: OutlinedButton.styleFrom(backgroundColor: TColors.dark),
          //           child: Text(
          //             actionText!,
          //             style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.light),
          //           ),
          //         ),
          //       )
          //     : const SizedBox(),
        ],
      ),
    );
  }
}
