import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water/features/hydration/presentation/widgets/goutte_eau_widget.dart';

class EnteteWidget  extends StatelessWidget{
  const EnteteWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFDDEAF8),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [

          const SizedBox(height: 25),

          const Text(
            'Home',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF222222),
            ),
          ),

          const SizedBox(height: 40),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              const SizedBox(width: 45),

              /// GOUTTE
              const GoutteEauWidget(),

              const SizedBox(width: 12),

              /// BULLE
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 20),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 17,
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xFF2879F6),
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                  ),
                  child: const Text(
                    "N'attendez pas d'avoir soif pour boire.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  }