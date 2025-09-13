import 'dart:ui';

import 'package:flutter/material.dart';

// FancyBackground: Radial maroon-pink background
class FancyBackground extends StatelessWidget {
  final Widget? child;

  const FancyBackground({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.bottomLeft,
          radius: 2.0,
          colors: [
            Color(0xFF8B0A50), // Bright pinkish center glow
            Color(0xFF2C001E), // Deep maroon background
          ],
          stops: [0.0, 1.0],
        ),
      ),
      child: SingleChildScrollView(child: child),
    );
  }
}
// FancyPurpleBackground: Vertical purple gradient background
class FancyPurpleBackground extends StatelessWidget {
  final Widget? child;

  const FancyPurpleBackground({super.key, this.child});

   @override
    Widget build(BuildContext context) {
     return Container(
       width: double.infinity,
       height: double.infinity,
       decoration: const BoxDecoration(
         gradient: LinearGradient(
           begin: Alignment.topLeft,
           end: Alignment.bottomRight,
           colors: [
             Color(0xFF6A0572), // Deep purple
             Color(0xFFAB47BC), // Medium violet
             Color(0xFFF06292), // Soft pinkish highlight
           ],
           stops: [0.1, 0.5, 1.0],
         ),
       ),
       child: Stack(
         children: [
           // Top-left glow circle
           Positioned(
             top: -60,
             left: -60,
             child: Container(
               width: 180,
               height: 180,
               decoration: BoxDecoration(
                 shape: BoxShape.circle,
                 gradient: RadialGradient(
                   colors: [
                     Colors.white.withOpacity(0.08),
                     Colors.transparent,
                   ],
                   radius: 0.6,
                 ),
               ),
             ),
           ),

           // Bottom-right blurred ellipse glow
           Positioned(
             bottom: -40,
             right: -80,
             child: Container(
               width: 260,
               height: 180,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(100),
                 gradient: RadialGradient(
                   colors: [
                     Colors.deepPurpleAccent.withOpacity(0.2),
                     Colors.transparent,
                   ],
                   radius: 0.9,
                 ),
               ),
             ),
           ),

           // Optional decorative blob
           Positioned(
             top: 150,
             left: -50,
             child: Transform.rotate(
               angle: 0.8,
               child: Container(
                 width: 160,
                 height: 160,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(80),
                   gradient: LinearGradient(
                     colors: [
                       Colors.pinkAccent.withOpacity(0.2),
                       Colors.deepPurple.withOpacity(0.2),
                     ],
                     begin: Alignment.topLeft,
                     end: Alignment.bottomRight,
                   ),
                 ),
               ),
             ),
           ),

           // Main child content scrollable
           if (child != null)
             SingleChildScrollView(child: child),
         ],
       ),
     );
  }
}

class FancyProfessionalBackground extends StatelessWidget {
  final Widget? child;

  const FancyProfessionalBackground({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1A237E), // Indigo dark
            Color(0xFF3949AB), // Indigo mid
            Color(0xFF00ACC1), // Teal blue soft
          ],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      child: Stack(
        children: [
          // Top-left glow circle
          Positioned(
            top: -50,
            left: -50,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Colors.white.withOpacity(0.06),
                    Colors.transparent,
                  ],
                  radius: 0.5,
                ),
              ),
            ),
          ),

          // Bottom-right blurred glow
          Positioned(
            bottom: -30,
            right: -70,
            child: Container(
              width: 240,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: RadialGradient(
                  colors: [
                    Colors.cyanAccent.withOpacity(0.15),
                    Colors.transparent,
                  ],
                  radius: 0.8,
                ),
              ),
            ),
          ),

          // Decorative blob top-right
          Positioned(
            top: 120,
            right: -40,
            child: Transform.rotate(
              angle: 0.6,
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70),
                  gradient: LinearGradient(
                    colors: [
                      Colors.lightBlueAccent.withOpacity(0.15),
                      Colors.deepPurple.withOpacity(0.15),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),

          // Main child content scrollable
          if (child != null)
            SingleChildScrollView(child: child),
        ],
      ),
    );
  }
}

class FancyMonochromeBackground extends StatelessWidget {
  final Widget? child;

  const FancyMonochromeBackground({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1C1C1C), // Dark charcoal
            Color(0xFF2E2E2E), // Mid grey
            Color(0xFF3D3D3D), // Soft dark grey
          ],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      child: Stack(
        children: [
          // Top-left glow circle
          Positioned(
            top: -50,
            left: -50,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Colors.white.withOpacity(0.05),
                    Colors.transparent,
                  ],
                  radius: 0.6,
                ),
              ),
            ),
          ),

          // Bottom-right soft glow
          Positioned(
            bottom: -30,
            right: -70,
            child: Container(
              width: 240,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: RadialGradient(
                  colors: [
                    Colors.white.withOpacity(0.07),
                    Colors.transparent,
                  ],
                  radius: 0.9,
                ),
              ),
            ),
          ),

          // Optional soft white shape
          Positioned(
            top: 120,
            right: -40,
            child: Transform.rotate(
              angle: 0.7,
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.04),
                      Colors.white.withOpacity(0.02),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),

          // Main scrollable child
          if (child != null)
            SingleChildScrollView(child: child),
        ],
      ),
    );
  }
}

class ElegantBlackWhiteBackground extends StatelessWidget {
  final Widget? child;

  const ElegantBlackWhiteBackground({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFF121212), // Almost black
            Color(0xFF1F1F1F), // Dark grey
            Color(0xFF2A2A2A), // Mid grey
          ],
          stops: [0.0, 0.6, 1.0],
        ),
      ),
      child: Stack(
        children: [
          // Top-left soft radial light
          Positioned(
            top: -80,
            left: -60,
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Colors.white.withOpacity(0.04),
                    Colors.transparent,
                  ],
                  radius: 0.8,
                ),
              ),
            ),
          ),

          // Bottom-right elliptical flare
          Positioned(
            bottom: -60,
            right: -60,
            child: Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(150),
                gradient: RadialGradient(
                  colors: [
                    Colors.white.withOpacity(0.06),
                    Colors.transparent,
                  ],
                  radius: 1,
                ),
              ),
            ),
          ),

          // Middle-top subtle diagonal stripe glow
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Container(
              height: 140,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.015),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Abstract blob mid-left
          Positioned(
            top: 300,
            left: -80,
            child: Transform.rotate(
              angle: -0.5,
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.03),
                      Colors.white.withOpacity(0.015),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
              ),
            ),
          ),

          // Main scrollable child
          if (child != null)
            SingleChildScrollView(child: child),
        ],
      ),
    );
  }
}

class PremiumPurpleBackground extends StatelessWidget {
  final Widget? child;

  const PremiumPurpleBackground({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF6A1B9A), // Deep Purple
            Color(0xFF9C27B0), // Purple Accent
          ],
        ),
      ),
      child: Stack(
        children: [
          // Top-left glow circle
          Positioned(
            top: -60,
            left: -60,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Colors.white.withOpacity(0.12),
                    Colors.transparent,
                  ],
                  radius: 0.6,
                ),
              ),
            ),
          ),

          // Bottom-right ellipse glow
          Positioned(
            bottom: -40,
            right: -80,
            child: Container(
              width: 260,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: RadialGradient(
                  colors: [
                    Colors.white.withOpacity(0.08),
                    Colors.transparent,
                  ],
                  radius: 0.8,
                ),
              ),
            ),
          ),

          // White soft beam (diagonal)
          Positioned(
            top: 180,
            left: -40,
            child: Transform.rotate(
              angle: 0.6,
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.06),
                      Colors.white.withOpacity(0.01),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),

          // Central glow
          Positioned(
            top: 280,
            left: 120,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Colors.white.withOpacity(0.10),
                    Colors.transparent,
                  ],
                  radius: 0.5,
                ),
              ),
            ),
          ),

          // Optional soft blurred diagonal stroke
          Positioned(
            bottom: 120,
            left: -30,
            child: Transform.rotate(
              angle: -0.4,
              child: Container(
                width: 220,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.05),
                      Colors.transparent,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
            ),
          ),

          // Main content
          if (child != null)
            SingleChildScrollView(child: child),
        ],
      ),
    );
  }
}

class GlassmorphicTile extends StatelessWidget {
  final String label;
  final bool isExpanded;
  final VoidCallback onTap;

  const GlassmorphicTile({
    Key? key,
    required this.label,
    required this.isExpanded,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.5),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 25.0, sigmaY: 25.0),
          child: Container(
            width: 363,
            height: 78,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.5),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x4165FF9C),
                  blurRadius: 15,
                  spreadRadius: 6,
                ),
              ],
            ),
            child: Stack(
              children: [
                // Horizontal gradient layer
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0x668DFF4C),
                        Color(0x3396FFA0),
                        Color(0x00000000),
                        Color(0x3396FFA0),
                        Color(0x668DFF4C),
                      ],
                      stops: [0.0, 0.2, 0.5, 0.8, 1.0],
                    ),
                  ),
                ),

                // Vertical gradient layer on top
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0x668DFF4C),
                        Color(0x3396FFA0),
                        Color(0x00000000),
                        Color(0x3396FFA0),
                        Color(0xFF94B790),
                      ],
                      stops: [0.0, 0.2, 0.5, 0.8, 1.0],
                    ),
                  ),
                ),

                // Content (centered text + icon)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          label,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          isExpanded ? Icons.expand_less : Icons.expand_more,
                          color: Colors.black,
                          size: 28,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}