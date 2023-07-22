import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Column(
        children: [
          Image.network(
            data['largeImageURL'],
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("SELECT SCREEN"),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            AsyncWallpaper.setWallpaper(
                                url: data['largeImageURL'],
                                goToHome: true,
                                wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
                                toastDetails: ToastDetails.success(),
                                errorToastDetails: ToastDetails.error());
                          },
                          child: const Text("HOME Page")),
                      ElevatedButton(
                          onPressed: () {
                            AsyncWallpaper.setWallpaper(
                                url: data['largeImageURL'],
                                goToHome: true,
                                wallpaperLocation: AsyncWallpaper.LOCK_SCREEN,
                                toastDetails: ToastDetails.success(),
                                errorToastDetails: ToastDetails.error());
                          },
                          child: const Text("Lock Page")),
                      ElevatedButton(
                          onPressed: () {
                            AsyncWallpaper.setWallpaper(
                                url: data['largeImageURL'],
                                goToHome: true,
                                wallpaperLocation: AsyncWallpaper.BOTH_SCREENS,
                                toastDetails: ToastDetails.success(),
                                errorToastDetails: ToastDetails.error());
                          },
                          child: const Text("Both")),
                    ],
                  ),
                );
              },
              child: const Text("SET AS WALL PAPER"))
        ],
      ),
    );
  }
}

// class DetailPage extends StatelessWidget {
//   const DetailPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     Map data = ModalRoute.of(context)!.settings.arguments as Map;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("detail page"),
//         centerTitle: true,
//       ),
//       body: Stack(
//         children: [
//           Image.network(
//             data['largeImageURL'],
//             fit: BoxFit.fitHeight,
//             height: double.infinity,
//           ),
//           Image.network(
//             "https://o.remove.bg/downloads/55339c36-8d12-40be-abcf-955883a45630/iPhone_14_Pro_-_5-removebg-preview.png",
//             fit: BoxFit.fill,
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           AsyncWallpaper.setWallpaper(
//             url: data['largeImageURL'],
//             goToHome: true,
//             wallpaperLocation: AsyncWallpaper.BOTH_SCREENS,
//             toastDetails: ToastDetails.success(),
//             errorToastDetails: ToastDetails.error(),
//           );
//         },
//         child: const Icon(Icons.wallpaper),
//       ),
//     );
//   }
// }
