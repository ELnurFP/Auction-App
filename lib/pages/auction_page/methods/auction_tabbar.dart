// SizedBox auctionTabBar(BuildContext context, GlobalProvider tabbar) {
//   return SizedBox(
//     height: getHeight(45, context),
//     width: getWidth(345, context),
//     child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) => GestureDetector(
//               onTap: () {
//                 tabbar.changeTabIndex(index);
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: tabbar.tabIndex == index
//                         ? const Color(0xffDFF3E7)
//                         : Colors.grey[200],
//                     borderRadius: BorderRadius.circular(10)),
//                 padding: EdgeInsets.symmetric(
//                   horizontal: getWidth(14, context),
//                   //   vertical: getWidth(15, context)
//                 ),
//                 margin: EdgeInsets.only(right: getWidth(10, context)),
//                 child: Center(
//                   child: Tab(
//                     child: Text(
//                       tabbar.tabbarItems[index],
//                       style: TextStyle(
//                           color: tabbar.tabIndex == index
//                               ? const Color(0xff3E8954)
//                               : const Color(0xff8F8D8D),
//                           fontSize: 12,
//                           fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//         itemCount: tabbar.tabbarItems.length),
//   );
// }
