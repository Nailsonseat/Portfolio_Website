'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/LICENSE": "1ebbd3e34237af26da5dc08a4e440464",
"assets/AssetManifest.bin": "6df1f5935e179891ef2b051701e65bfc",
"assets/AssetManifest.bin.json": "cb78d9bf23a3cc8e219364c18bf95574",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/NOTICES": "41db3f74d834b4fffa9a00b753b73928",
"assets/lib/assets/images/miscellaneous/under_construction.png": "b876b773d399cdbf26a7632f48987716",
"assets/lib/assets/images/project_images/acharya_setu/otp_page_old.png": "e9e29de998aa0513c4d6e012231732f6",
"assets/lib/assets/images/project_images/acharya_setu/google_web.png": "e732ad02d52380a6d6378728b45108fb",
"assets/lib/assets/images/project_images/acharya_setu/login_opt_old.png": "1b6a16502bec27661267c359e451b2ab",
"assets/lib/assets/images/project_images/acharya_setu/home2.png": "6f23b415ff1ad0e1865306c98c7623ea",
"assets/lib/assets/images/project_images/acharya_setu/login_opt_new.png": "21a6b75d55bb9a203b862857b251a9dc",
"assets/lib/assets/images/project_images/acharya_setu/email_reg_old.png": "d46a13b34a8cc01a61a5283fa3f07a3f",
"assets/lib/assets/images/project_images/acharya_setu/number_input_old.png": "8a1856f09b1b5af034a22d62a9efe475",
"assets/lib/assets/images/project_images/acharya_setu/Acharya_Setu_Template_Randomizer.png": "864a1f0d5c44f59dd94a027b33601153",
"assets/lib/assets/images/project_images/acharya_setu/email_reg_new.png": "8bf0d2ecc83b2262f3ee59bf4b66d7a1",
"assets/lib/assets/images/project_images/acharya_setu/home3.png": "c3b1ff7f83869987ea5a0fe214ee8a31",
"assets/lib/assets/images/project_images/acharya_setu/Acharya_Setu_Question_Context_Generation.png": "79debf0feef38aef761ba11b0a8108c6",
"assets/lib/assets/images/project_images/acharya_setu/home1.png": "a570b4e8f5b54e04008c2a06a1a4364b",
"assets/lib/assets/images/project_images/acharya_setu/number_input_new.png": "848a1e19bcb94f2c7bfa3006de62d068",
"assets/lib/assets/images/project_images/acharya_setu/email_new.png": "bd08c3fda4fcf3bff441999d570d26fc",
"assets/lib/assets/images/project_images/acharya_setu/Acharya_Setu_Question_Segmentation.png": "aec604fddc0ee5e23061ab8ad30d358e",
"assets/lib/assets/images/project_images/acharya_setu/email_old.png": "05e7e492695eee3f9a401b366a37e7e7",
"assets/lib/assets/images/project_images/acharya_setu/otp_page_new.png": "98b6e0b2632f9a10f6236ff721ad7215",
"assets/lib/assets/images/project_images/acharya_setu/Acharya_Setu_Question_Distribution.png": "a67ddb04e0d329d93ada50ec536f66c6",
"assets/lib/assets/images/project_images/ondc_build_for_bharat/loading_screen.png": "c57c5753a47859030c535844029c668d",
"assets/lib/assets/images/project_images/ondc_build_for_bharat/add_product.png": "14dbc46144119eed3288fb805fc3a9b0",
"assets/lib/assets/images/project_images/ondc_build_for_bharat/metrics.png": "6efcd0415bf5989f6f15b68fdad6ad82",
"assets/lib/assets/images/project_images/ondc_build_for_bharat/edit_product.png": "2af5315a481812278d26c2cfb5658adb",
"assets/lib/assets/images/project_images/ondc_build_for_bharat/landing_page.png": "ad86c7e2301a2d525c380f6209f83561",
"assets/lib/assets/images/project_images/foss_overflow/menu_entry.png": "ecb161f33674004d569309a8dc9deefe",
"assets/lib/assets/images/project_images/foss_overflow/room_vacancy.png": "0479cdf0c30d63599a7a78f70f140469",
"assets/lib/assets/images/project_images/foss_overflow/course_entry.png": "095d6d4019a547fb856ff6d6b5c44f4e",
"assets/lib/assets/images/project_images/foss_overflow/view_students.png": "edfbfcd19062ba807d3466147949aa77",
"assets/lib/assets/images/project_images/foss_overflow/admin_auth.png": "4b3675d727149d40583dae1cc5a5ce35",
"assets/lib/assets/images/project_images/foss_overflow/user_auth.png": "c27786195f5afd8b5f9205d5fbf14496",
"assets/lib/assets/images/project_images/foss_overflow/manage_menu.png": "53ddc04b9ef040cc6258dc57038845f8",
"assets/lib/assets/images/project_images/foss_overflow/view_courses.png": "dd70abba8714a655dc32dddff7a76336",
"assets/lib/assets/images/project_images/foss_overflow/multi_choice_roles.png": "9724f4c6967ae12d7d9fc513de70e886",
"assets/lib/assets/images/project_images/foss_overflow/timetable_2.png": "6454bcea702a8423c839cda2dbe9f155",
"assets/lib/assets/images/project_images/foss_overflow/chatroom.png": "25fe5cf1842bb1b9564a5e67d334a8b1",
"assets/lib/assets/images/project_images/foss_overflow/student_entry.png": "2b5d0ca3b81654f4c6a0a7d2a0278804",
"assets/lib/assets/images/project_images/foss_overflow/view_faculties.png": "ad7f6a692880575f78734301fdf48663",
"assets/lib/assets/images/project_images/foss_overflow/manage_rooms.png": "9d2082b00b7f5d6257658e8fb2da9324",
"assets/lib/assets/images/project_images/foss_overflow/faculty_entry.png": "72795950deb8d5f26eafa4a2738723eb",
"assets/lib/assets/images/project_images/foss_overflow/year_picker.png": "d753ec3b0348a67bb5463ec96bcc1c61",
"assets/lib/assets/images/project_images/foss_overflow/lost_and_found.png": "99bc57a8c8e9f2a85eef85c9dbb1e92d",
"assets/lib/assets/images/project_images/foss_overflow/mess_menu.png": "7244be8850b13dcb4a9cd96f8b953099",
"assets/lib/assets/images/project_images/foss_overflow/timetable_1.png": "bd68a9ccd4ae97894ee96c3233b8b4dd",
"assets/lib/assets/images/project_images/ecommerce_shoppers_behaviour_and_understanding/e_comm_f1.png": "94b45dfbe2ce1a9ab0f46cf90f5324d3",
"assets/lib/assets/images/project_images/ecommerce_shoppers_behaviour_and_understanding/e_comm_precision.png": "d176c669cf0b5a6284516a99699a9c9b",
"assets/lib/assets/images/project_images/ecommerce_shoppers_behaviour_and_understanding/e_comm_recall.png": "d91d8c0351b2c4c40ff8968342621052",
"assets/lib/assets/images/project_images/ecommerce_shoppers_behaviour_and_understanding/e_comm_accuracy.png": "355fcc076699cd45197bf601df4c02cb",
"assets/lib/assets/images/project_images/ecommerce_shoppers_behaviour_and_understanding/e_comm_heatmap.png": "dfca9e5dfb671c7899ad627097d3aa91",
"assets/lib/assets/images/project_images/ecommerce_shoppers_behaviour_and_understanding/e_comm_histograms.png": "1b080b0395046101c8666db7945408b9",
"assets/lib/assets/images/project_images/classic_snake/menu.png": "f5659af368270b3b263b80ea104528e7",
"assets/lib/assets/images/project_images/classic_snake/gameplay.png": "d9d4b3bfb7f1166416ed70a54d484c5c",
"assets/lib/assets/images/project_images/classic_snake/gameplay_two.png": "8c3198249418f11bded1c72624ec0acb",
"assets/lib/assets/images/project_images/classic_snake/options.png": "ea05bdaaab7a3c873efa70ac09ac0dc3",
"assets/lib/assets/images/profile_pic/profile_pic.png": "e6f0dd3fee71c627812f460d12f5048f",
"assets/lib/assets/images/profile_pic/profile_pic_flipped.png": "d4ddf304d1eb7e040be9ac9ff0a37a26",
"assets/lib/assets/images/project_banners/messaging.png": "c982346611777e4a9bc3d3c50f9575e4",
"assets/lib/assets/images/project_banners/snake.png": "e94d0edbe873e3eca983243c17663dda",
"assets/lib/assets/images/project_banners/ondc.png": "806b8fc4c79bbb49e03ee0fb1bffa7ac",
"assets/lib/assets/images/project_banners/acharya_setu.jpg": "5521ed8e6aa192a4057351d26882c28a",
"assets/lib/assets/images/project_banners/e_commerce_behaviour_understanding.png": "7559ee67aa374a396b7553c3e7f9b078",
"assets/lib/assets/images/project_banners/foss_overflow_2.png": "8e200f4fd8a5ddd84e251ac91281f231",
"assets/lib/assets/images/project_banners/yoshop_scraper.png": "de7e45fc42fd5aa93eada59bbf633acd",
"assets/lib/assets/images/project_banners/hospital_management_utility.png": "47dd63bac64fc1f1c18bf6eba22b62dc",
"assets/lib/assets/images/project_banners/portfolio.png": "b23cc894f1b2be1f4f27a66397daf96e",
"assets/lib/assets/images/project_banners/kastor.png": "932e223c1edfda55b858e448cd57fc4c",
"assets/lib/assets/images/project_banners/hola_bot.png": "fbde837bab18f191c309a610a8d0bf2f",
"assets/lib/assets/images/project_banners/foss_overflow.png": "0536085792ad01952d1807442e149284",
"assets/lib/assets/images/project_banners/machine_learning.png": "59eadd433363618661334c3d1a744ae0",
"assets/lib/assets/images/project_banners/data_in_ipl.png": "fab3a4661ebd0082d2c62c1dafc300bf",
"assets/lib/assets/icons/slack.png": "de101625160f15f11b34b3d2d95d6fb2",
"assets/lib/assets/icons/tech_stack/dart.svg": "77736b70355db3b992d712891749acd5",
"assets/lib/assets/icons/tech_stack/cpp.svg": "97e8db73a7fc12814534e438ad112ca7",
"assets/lib/assets/icons/tech_stack/seaborn.svg": "f9f60e59b59ad66d7cacf7545e93fe89",
"assets/lib/assets/icons/tech_stack/mongodb.svg": "ebf723d47dc4203868088d005452543b",
"assets/lib/assets/icons/tech_stack/firebase-storage.svg": "5a05197d7d729d067fa4d0af14d8f530",
"assets/lib/assets/icons/tech_stack/pandas.svg": "d721624b5f49551fc93ca70d56378c2a",
"assets/lib/assets/icons/tech_stack/matplotlib.svg": "dab09b4de35c84782547adaa54078d83",
"assets/lib/assets/icons/tech_stack/node_js_logo.svg": "89ccb09060a7adf788ea2340c54d6d78",
"assets/lib/assets/icons/tech_stack/firebase.svg": "7f1bf2795e067daf4ac3b42a2a140496",
"assets/lib/assets/icons/tech_stack/scikit-learn.svg": "0fde75aed4e302f9204ad268f87db551",
"assets/lib/assets/icons/tech_stack/numpy.svg": "d9d4a0fb78d41ee30532a14a7f01e921",
"assets/lib/assets/icons/tech_stack/css.svg": "b9182af4b4d3659b33c5539b7ca82c52",
"assets/lib/assets/icons/tech_stack/firebase-hosting.svg": "f7d6127fe349c9c2a98bd1ece5a94b30",
"assets/lib/assets/icons/tech_stack/riverpod.svg": "06b58591b18455b86f255de6a0d91a5a",
"assets/lib/assets/icons/tech_stack/flutter.svg": "9a6e81be6ff5b09956f4f85fe1f0a89f",
"assets/lib/assets/icons/tech_stack/html-5.svg": "55be2f7fd3025e8b3d07c2bb4da85824",
"assets/lib/assets/icons/tech_stack/express.svg": "caf149605fda10991288d059f81a22b6",
"assets/lib/assets/icons/tech_stack/firestore.svg": "7e6fc669b797ce0dc20e1104eae973b9",
"assets/lib/assets/icons/tech_stack/xgboost.svg": "a4d533e574f336b0508bd17a530b687e",
"assets/lib/assets/icons/chatbot.png": "5b8aafe47261c543e9524068023d014f",
"assets/lib/assets/text/about_me/education.txt": "33d417bc3b6c6753d97c2f3b76017a43",
"assets/lib/assets/text/about_me/about_me.txt": "104173a8f2b5463daaec482aed40e58f",
"assets/lib/pages/templates/project_page_template.dart": "65f70c10b9211cc48bc6e878ea72593d",
"assets/lib/pages/templates/small_screen_warning_page.dart": "3fe705939a0ae3ddcf3393cc7c390f1c",
"assets/lib/pages/templates/under_construction_template.html": "a38c3d612cedae859dfc35d63419c5d6",
"assets/lib/pages/projects/hospital_management_utility/description.html": "32e999d4cdf1e5206ea7708c599b2aeb",
"assets/lib/pages/projects/hospital_management_utility/hospital_management_utility.dart": "eb2ebe659f2b3b7ddb3f4ee8d407e6fe",
"assets/lib/pages/projects/acharya_setu/description.html": "4464da8b152f7e4f82e9cc78c75d9fea",
"assets/lib/pages/projects/acharya_setu/progress.html": "5804c432169a09c2d1ecebdd18c46f3e",
"assets/lib/pages/projects/acharya_setu/techstack.html": "7c2b39be9546a08023ac4a3f2543665d",
"assets/lib/pages/projects/acharya_setu/acharya_setu.dart": "0eb6490a7279f57c3251757ef4d811f8",
"assets/lib/pages/projects/acharya_setu/features.html": "c957c220ca10e5852856b2c3b110dad5",
"assets/lib/pages/projects/holomorphic_bot/description.html": "cecdc41326aeffd42af2962a79278350",
"assets/lib/pages/projects/holomorphic_bot/holomorphic_bot.dart": "325ade07293b8628be3d5e4f520be1ff",
"assets/lib/pages/projects/kastor/description.html": "aae0a5b317800eca5db58b59b419c2f1",
"assets/lib/pages/projects/kastor/kastor.dart": "a8c4f3e0c333a92709c66f305e39bbd0",
"assets/lib/pages/projects/ondc_build_for_bharat/description.html": "d1cbd4b1e7322aa618cc5b1eb2546744",
"assets/lib/pages/projects/ondc_build_for_bharat/project.html": "8a84b92fe0f85bbfd0c986d9ec266ab7",
"assets/lib/pages/projects/ondc_build_for_bharat/build_for_bharat.dart": "d25266f4f9fd3832a717586cfcfc685f",
"assets/lib/pages/projects/ondc_build_for_bharat/conclusion.html": "f5c8cfb3f1699fb7c674d9cf8a1018ab",
"assets/lib/pages/projects/ondc_build_for_bharat/conditions.html": "d47bf7288643feb02e20f0f359386a93",
"assets/lib/pages/projects/ondc_build_for_bharat/team.html": "1f385097cfb72f2b675407d152d7c65d",
"assets/lib/pages/projects/letstalkk/description.html": "f025f950ac994884784b874f727911a1",
"assets/lib/pages/projects/letstalkk/letstalkk.dart": "0fbef7c9869ce848844af707fc1d24e5",
"assets/lib/pages/projects/data_into_ipl/data_into_ipl.dart": "0b7783a54e8e54c46dd0c8ded9f41c42",
"assets/lib/pages/projects/data_into_ipl/description.html": "4c8e80c8b299846098603005c56fae33",
"assets/lib/pages/projects/yoshop_web_scraper/description.html": "442aa810cb09004596bb4830d054661f",
"assets/lib/pages/projects/yoshop_web_scraper/yoshop_web_scraper.dart": "a079cdff62a5946503cc7446c06ad8a1",
"assets/lib/pages/projects/classic_snake_ffps/classic_snake_ffps.dart": "1e6df1a90f5e0270b7e5612a5240fd44",
"assets/lib/pages/projects/classic_snake_ffps/description.html": "7a839a178ac1acc6f1baf6ec9676dd07",
"assets/lib/pages/projects/classic_snake_ffps/techstack.html": "2c78a906019d5f70fabcd484e49fea25",
"assets/lib/pages/projects/classic_snake_ffps/conclusion.html": "bf407eadc0573dfff76dc094e532d82a",
"assets/lib/pages/projects/classic_snake_ffps/game.html": "4c057af5e6ec362744c49a833120c70f",
"assets/lib/pages/projects/machine_learning/description.html": "9fbcc184e493e5f08700a894cf2dbc20",
"assets/lib/pages/projects/machine_learning/machine_learning.dart": "7fdf1ff115196fe4ed3f9830841a87fe",
"assets/lib/pages/projects/foss_overflow/description.html": "5b4189a125523284af1e7b3663ebb2e6",
"assets/lib/pages/projects/foss_overflow/foss_overflow.dart": "0b2a6983b82de39a48e1553ca0e4bb5e",
"assets/lib/pages/projects/foss_overflow/database_storage.html": "82454b5b2009ebfec663add0893e63c2",
"assets/lib/pages/projects/foss_overflow/techstack.html": "6c5da4b5584d1b2a4a8fc0396fa341c6",
"assets/lib/pages/projects/foss_overflow/conclusion.html": "2b44b5a9eb54fe909f9a06cdd1801c7c",
"assets/lib/pages/projects/foss_overflow/mentors.html": "add17f25614f0cb3909ab81a2483b3d3",
"assets/lib/pages/projects/foss_overflow/authentication.html": "7a6bea9aadb81e5a0f190014edd93bc9",
"assets/lib/pages/projects/foss_overflow/admin.html": "7f9c9536383086243de03be26aefafe5",
"assets/lib/pages/projects/foss_overflow/features.html": "502ee4a9f090917fb62a0050a4d27748",
"assets/lib/pages/projects/portfolio_website/description.html": "971a36ea353ecfa5ac0fb900a494560f",
"assets/lib/pages/projects/portfolio_website/portfolio_website.dart": "dd2203bb04f662668939591492fb75e4",
"assets/lib/pages/projects/ecommerce_shoppers_behaviour_and_understanding/ecommerce_shoppers_behaviour_and_understanding.dart": "8c3a0d03512cd384c59642f808041040",
"assets/lib/pages/projects/ecommerce_shoppers_behaviour_and_understanding/description.html": "a6db20827373fdf271738566699c27a3",
"assets/lib/pages/projects/ecommerce_shoppers_behaviour_and_understanding/techstack.html": "2c0b956f4001fc5db4cfbcd5f47d1813",
"assets/lib/pages/projects/ecommerce_shoppers_behaviour_and_understanding/models.html": "b13a3d7576c86532d98335d57801f003",
"assets/lib/pages/projects/ecommerce_shoppers_behaviour_and_understanding/results.html": "dfed5b374c49ddfe5fcf8fe5d8121f3e",
"assets/lib/fonts/Quicksand-VariableFont_weight.ttf": "aaaca85ea11863d1e4550d425f763bd1",
"assets/AssetManifest.json": "02b6d266436eb082d8c13857c48d0a46",
"assets/fonts/MaterialIcons-Regular.otf": "9611c7316f8bf8b9f85a56670884c7d6",
"assets/packages/eva_icons_flutter/lib/fonts/Eva-Icons.ttf": "b3cfd6832181cbaa3c98988c49d34641",
"assets/packages/ionicons/assets/fonts/Ionicons.ttf": "757f33cf07178f986e73b03f8c195bd6",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "f2163b9d4e6f1ea52063f498c8878bb9",
"assets/packages/wakelock_plus/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"assets/packages/line_icons/lib/assets/fonts/LineIcons.ttf": "bcaf3ba974cf7900b3c158ca593f4971",
"assets/FontManifest.json": "9794c2452f1564a6cf4a656d303a1bf9",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"version.json": "cc1fa9cce5af273c0909d105387fee89",
"favicon.png": "0a4149f580855d863b9f7dce6ce7dcfa",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"manifest.json": "a67989697c366cf4f821bde4733a6ca8",
"index.html": "98ff5aa5ad38c3a16ba2dd3e9360a183",
"/": "98ff5aa5ad38c3a16ba2dd3e9360a183",
"main.dart.js": "8c5186567731e54c8a751336cda54805"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.bin.json",
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
