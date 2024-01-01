'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"manifest.json": "a67989697c366cf4f821bde4733a6ca8",
"index.html": "ec1367608b617beabf5883fe369aea83",
"/": "ec1367608b617beabf5883fe369aea83",
"assets/AssetManifest.bin": "1fed110f88c069f671b0983b5bd4cd0b",
"assets/fonts/MaterialIcons-Regular.otf": "49342ad8be424611795ff3db09226774",
"assets/AssetManifest.bin.json": "23e1b68da00c2d01a4f8a605eb7501c8",
"assets/FontManifest.json": "9794c2452f1564a6cf4a656d303a1bf9",
"assets/LICENSE": "1ebbd3e34237af26da5dc08a4e440464",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/NOTICES": "edb1dda163026da589b397a6432f2c86",
"assets/AssetManifest.json": "313f41e58786940b5f38c5d665c6e58f",
"assets/packages/eva_icons_flutter/lib/fonts/Eva-Icons.ttf": "b3cfd6832181cbaa3c98988c49d34641",
"assets/packages/line_icons/lib/assets/fonts/LineIcons.ttf": "bcaf3ba974cf7900b3c158ca593f4971",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/ionicons/assets/fonts/Ionicons.ttf": "757f33cf07178f986e73b03f8c195bd6",
"assets/lib/fonts/Quicksand-VariableFont_weight.ttf": "aaaca85ea11863d1e4550d425f763bd1",
"assets/lib/pages/projects/letstalkk/description.html": "f025f950ac994884784b874f727911a1",
"assets/lib/pages/projects/letstalkk/letstalkk.dart": "0fbef7c9869ce848844af707fc1d24e5",
"assets/lib/pages/projects/portfolio_website/description.html": "971a36ea353ecfa5ac0fb900a494560f",
"assets/lib/pages/projects/portfolio_website/portfolio_website.dart": "dd2203bb04f662668939591492fb75e4",
"assets/lib/pages/projects/acharya_setu/features.html": "c957c220ca10e5852856b2c3b110dad5",
"assets/lib/pages/projects/acharya_setu/description.html": "4464da8b152f7e4f82e9cc78c75d9fea",
"assets/lib/pages/projects/acharya_setu/acharya_setu.dart": "0eb6490a7279f57c3251757ef4d811f8",
"assets/lib/pages/projects/acharya_setu/progress.html": "5804c432169a09c2d1ecebdd18c46f3e",
"assets/lib/pages/projects/acharya_setu/techstack.html": "7c2b39be9546a08023ac4a3f2543665d",
"assets/lib/pages/projects/hospital_management_utility/description.html": "32e999d4cdf1e5206ea7708c599b2aeb",
"assets/lib/pages/projects/hospital_management_utility/hospital_management_utility.dart": "eb2ebe659f2b3b7ddb3f4ee8d407e6fe",
"assets/lib/pages/projects/kastor/description.html": "aae0a5b317800eca5db58b59b419c2f1",
"assets/lib/pages/projects/kastor/kastor.dart": "a8c4f3e0c333a92709c66f305e39bbd0",
"assets/lib/pages/projects/ecommerce_shoppers_behaviour_and_understanding/description.html": "a6db20827373fdf271738566699c27a3",
"assets/lib/pages/projects/ecommerce_shoppers_behaviour_and_understanding/models.html": "b13a3d7576c86532d98335d57801f003",
"assets/lib/pages/projects/ecommerce_shoppers_behaviour_and_understanding/results.html": "dfed5b374c49ddfe5fcf8fe5d8121f3e",
"assets/lib/pages/projects/ecommerce_shoppers_behaviour_and_understanding/ecommerce_shoppers_behaviour_and_understanding.dart": "8c3a0d03512cd384c59642f808041040",
"assets/lib/pages/projects/ecommerce_shoppers_behaviour_and_understanding/techstack.html": "2c0b956f4001fc5db4cfbcd5f47d1813",
"assets/lib/pages/projects/classic_snake_ffps/description.html": "7a839a178ac1acc6f1baf6ec9676dd07",
"assets/lib/pages/projects/classic_snake_ffps/classic_snake_ffps.dart": "19664f0e224f9b9313b61d2772d41113",
"assets/lib/pages/projects/machine_learning/machine_learning.dart": "7fdf1ff115196fe4ed3f9830841a87fe",
"assets/lib/pages/projects/machine_learning/description.html": "9fbcc184e493e5f08700a894cf2dbc20",
"assets/lib/pages/projects/holomorphic_bot/description.html": "cecdc41326aeffd42af2962a79278350",
"assets/lib/pages/projects/holomorphic_bot/holomorphic_bot.dart": "325ade07293b8628be3d5e4f520be1ff",
"assets/lib/pages/projects/data_into_ipl/description.html": "4c8e80c8b299846098603005c56fae33",
"assets/lib/pages/projects/data_into_ipl/data_into_ipl.dart": "0b7783a54e8e54c46dd0c8ded9f41c42",
"assets/lib/pages/projects/yoshop_web_scraper/description.html": "442aa810cb09004596bb4830d054661f",
"assets/lib/pages/projects/yoshop_web_scraper/yoshop_web_scraper.dart": "a079cdff62a5946503cc7446c06ad8a1",
"assets/lib/pages/templates/under_construction_template.html": "a38c3d612cedae859dfc35d63419c5d6",
"assets/lib/pages/templates/project_page_template.dart": "d1b98ed4b83b69c4b500a0766223b01f",
"assets/lib/pages/templates/small_screen_warning_page.dart": "3fe705939a0ae3ddcf3393cc7c390f1c",
"assets/lib/assets/images/project_images/acharya_setu/email_reg_new.png": "8bf0d2ecc83b2262f3ee59bf4b66d7a1",
"assets/lib/assets/images/project_images/acharya_setu/number_input_new.png": "848a1e19bcb94f2c7bfa3006de62d068",
"assets/lib/assets/images/project_images/acharya_setu/Acharya_Setu_Question_Context_Generation.png": "79debf0feef38aef761ba11b0a8108c6",
"assets/lib/assets/images/project_images/acharya_setu/email_reg_old.png": "d46a13b34a8cc01a61a5283fa3f07a3f",
"assets/lib/assets/images/project_images/acharya_setu/number_input_old.png": "8a1856f09b1b5af034a22d62a9efe475",
"assets/lib/assets/images/project_images/acharya_setu/login_opt_old.png": "1b6a16502bec27661267c359e451b2ab",
"assets/lib/assets/images/project_images/acharya_setu/google_web.png": "e732ad02d52380a6d6378728b45108fb",
"assets/lib/assets/images/project_images/acharya_setu/Acharya_Setu_Question_Segmentation.png": "aec604fddc0ee5e23061ab8ad30d358e",
"assets/lib/assets/images/project_images/acharya_setu/home1.png": "a570b4e8f5b54e04008c2a06a1a4364b",
"assets/lib/assets/images/project_images/acharya_setu/otp_page_new.png": "98b6e0b2632f9a10f6236ff721ad7215",
"assets/lib/assets/images/project_images/acharya_setu/Acharya_Setu_Template_Randomizer.png": "864a1f0d5c44f59dd94a027b33601153",
"assets/lib/assets/images/project_images/acharya_setu/home3.png": "c3b1ff7f83869987ea5a0fe214ee8a31",
"assets/lib/assets/images/project_images/acharya_setu/Acharya_Setu_Question_Distribution.png": "a67ddb04e0d329d93ada50ec536f66c6",
"assets/lib/assets/images/project_images/acharya_setu/email_new.png": "bd08c3fda4fcf3bff441999d570d26fc",
"assets/lib/assets/images/project_images/acharya_setu/email_old.png": "05e7e492695eee3f9a401b366a37e7e7",
"assets/lib/assets/images/project_images/acharya_setu/login_opt_new.png": "21a6b75d55bb9a203b862857b251a9dc",
"assets/lib/assets/images/project_images/acharya_setu/home2.png": "6f23b415ff1ad0e1865306c98c7623ea",
"assets/lib/assets/images/project_images/acharya_setu/otp_page_old.png": "e9e29de998aa0513c4d6e012231732f6",
"assets/lib/assets/images/project_images/ecommerce_shoppers_behaviour_and_understanding/e_comm_recall.png": "d91d8c0351b2c4c40ff8968342621052",
"assets/lib/assets/images/project_images/ecommerce_shoppers_behaviour_and_understanding/e_comm_heatmap.png": "dfca9e5dfb671c7899ad627097d3aa91",
"assets/lib/assets/images/project_images/ecommerce_shoppers_behaviour_and_understanding/e_comm_histograms.png": "1b080b0395046101c8666db7945408b9",
"assets/lib/assets/images/project_images/ecommerce_shoppers_behaviour_and_understanding/e_comm_f1.png": "94b45dfbe2ce1a9ab0f46cf90f5324d3",
"assets/lib/assets/images/project_images/ecommerce_shoppers_behaviour_and_understanding/e_comm_accuracy.png": "355fcc076699cd45197bf601df4c02cb",
"assets/lib/assets/images/project_images/ecommerce_shoppers_behaviour_and_understanding/e_comm_precision.png": "d176c669cf0b5a6284516a99699a9c9b",
"assets/lib/assets/images/miscellaneous/under_construction.png": "b876b773d399cdbf26a7632f48987716",
"assets/lib/assets/images/profile_pic/profile_pic_flipped.png": "d4ddf304d1eb7e040be9ac9ff0a37a26",
"assets/lib/assets/images/profile_pic/profile_pic.png": "e6f0dd3fee71c627812f460d12f5048f",
"assets/lib/assets/images/project_banners/hola_bot.png": "fbde837bab18f191c309a610a8d0bf2f",
"assets/lib/assets/images/project_banners/kastor.png": "932e223c1edfda55b858e448cd57fc4c",
"assets/lib/assets/images/project_banners/hospital_management_utility.png": "47dd63bac64fc1f1c18bf6eba22b62dc",
"assets/lib/assets/images/project_banners/data_in_ipl.png": "fab3a4661ebd0082d2c62c1dafc300bf",
"assets/lib/assets/images/project_banners/acharya_setu.jpg": "5521ed8e6aa192a4057351d26882c28a",
"assets/lib/assets/images/project_banners/portfolio.png": "b23cc894f1b2be1f4f27a66397daf96e",
"assets/lib/assets/images/project_banners/machine_learning.png": "59eadd433363618661334c3d1a744ae0",
"assets/lib/assets/images/project_banners/e_commerce_behaviour_understanding.png": "7559ee67aa374a396b7553c3e7f9b078",
"assets/lib/assets/images/project_banners/yoshop_scraper.png": "de7e45fc42fd5aa93eada59bbf633acd",
"assets/lib/assets/images/project_banners/snake.png": "e94d0edbe873e3eca983243c17663dda",
"assets/lib/assets/images/project_banners/messaging.png": "c982346611777e4a9bc3d3c50f9575e4",
"assets/lib/assets/text/about_me/about_me.txt": "104173a8f2b5463daaec482aed40e58f",
"assets/lib/assets/text/about_me/education.txt": "33d417bc3b6c6753d97c2f3b76017a43",
"assets/lib/assets/icons/slack.png": "de101625160f15f11b34b3d2d95d6fb2",
"assets/lib/assets/icons/tech_stack/flutter.svg": "9a6e81be6ff5b09956f4f85fe1f0a89f",
"assets/lib/assets/icons/tech_stack/xgboost.svg": "a4d533e574f336b0508bd17a530b687e",
"assets/lib/assets/icons/tech_stack/firebase-storage.svg": "5a05197d7d729d067fa4d0af14d8f530",
"assets/lib/assets/icons/tech_stack/matplotlib.svg": "dab09b4de35c84782547adaa54078d83",
"assets/lib/assets/icons/tech_stack/seaborn.svg": "f9f60e59b59ad66d7cacf7545e93fe89",
"assets/lib/assets/icons/tech_stack/firestore.svg": "7e6fc669b797ce0dc20e1104eae973b9",
"assets/lib/assets/icons/tech_stack/numpy.svg": "d9d4a0fb78d41ee30532a14a7f01e921",
"assets/lib/assets/icons/tech_stack/html-5.svg": "55be2f7fd3025e8b3d07c2bb4da85824",
"assets/lib/assets/icons/tech_stack/firebase.svg": "7f1bf2795e067daf4ac3b42a2a140496",
"assets/lib/assets/icons/tech_stack/firebase-hosting.svg": "f7d6127fe349c9c2a98bd1ece5a94b30",
"assets/lib/assets/icons/tech_stack/dart.svg": "77736b70355db3b992d712891749acd5",
"assets/lib/assets/icons/tech_stack/pandas.svg": "d721624b5f49551fc93ca70d56378c2a",
"assets/lib/assets/icons/tech_stack/scikit-learn.svg": "0fde75aed4e302f9204ad268f87db551",
"assets/lib/assets/icons/tech_stack/css.svg": "b9182af4b4d3659b33c5539b7ca82c52",
"assets/lib/assets/icons/chatbot.png": "5b8aafe47261c543e9524068023d014f",
"favicon.png": "0a4149f580855d863b9f7dce6ce7dcfa",
"main.dart.js": "cff4ca90621256fdb9093946e229b360",
"version.json": "cc1fa9cce5af273c0909d105387fee89",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
