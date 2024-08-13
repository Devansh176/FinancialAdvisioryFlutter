// import 'package:financial_advisory/widgets/charts.dart';
// import 'package:flutter/material.dart';
//
// class Statistics extends StatefulWidget {
//   const Statistics({super.key});
//
//   @override
//   State<Statistics> createState() => _StatisticsState();
// }
//
// class _StatisticsState extends State<Statistics> {
//   List day = ['Day','Week','Month','Year'];
//   int index_color = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: CustomScrollView(
//           slivers: [
//             SliverToBoxAdapter(
//               child: Column(
//                 children: [
//                   const SizedBox(height: 20),
//                   const Text(
//                     'Statistics',
//                     style: TextStyle(
//                       color: Colors.black87,
//                       fontSize: 28,
//                       fontWeight: FontWeight.w900,
//                     ),
//                   ),
//                   const SizedBox(height: 27),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         ...List.generate(
//                             4, (index) {
//                               return GestureDetector(
//                                 onTap: (){
//                                   setState(() {
//                                     index_color = index;
//                                   });
//                                 },
//                               child: Container(
//                                 height: 40,
//                                 width: 80,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   color: index_color == index ? Colors.amber : Colors.white,
//                                 ),
//                                 alignment: Alignment.center,
//                                 child: Text(
//                                   day[index],
//                                   style: TextStyle(
//                                     color: index_color == index? Colors.white : Colors.black,
//                                     fontSize: 16.0,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             );
//                           }
//                         )
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Container(
//                           width: 120,
//                           height: 40,
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               color: Colors.black,
//                               width: 2.0,
//                             ),
//                             borderRadius: BorderRadius.circular(8.0)
//                           ),
//                           child: const Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Text(
//                                 'Expense',
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold
//                                 ),
//                               ),
//                               Icon(Icons.arrow_downward,
//                               color: Colors.black,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 20,),
//                   const Chart(),
//                   const SizedBox(height: 20,),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 15.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Top Spending',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 18,
//                             fontWeight: FontWeight.w700
//                           ),
//                         ),
//                         Icon(Icons.swap_vert_sharp),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             SliverList(
//                 delegate: SliverChildBuilderDelegate(
//                         (context,index){
//                       return ListTile(
//                         leading: ClipRRect(
//                           borderRadius: BorderRadius.circular(5.0),
//                           child: Image.asset("assets/mcdonalds.png"),
//                         ),
//                         title: const Text(
//                           'Transfer',
//                           style: TextStyle(
//                             fontSize: 17.0,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         subtitle: const Text(
//                           'Today',
//                           style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         trailing: const Text(
//                           'Rs. 49',
//                           style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             fontSize: 19,
//                             color: Colors.red,
//                           ),
//                         ),
//                       );
//                     }
//                 )
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
