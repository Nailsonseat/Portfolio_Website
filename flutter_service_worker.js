'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "f393d3c16b631f36852323de8e583132",
"main.dart.js": "35d88d8a67ad5791ac38675f49dbdd9e",
"assets/FontManifest.json": "7476a14dba7f1535fde5c345c155a69c",
"assets/LICENSE": "1ebbd3e34237af26da5dc08a4e440464",
"assets/AssetManifest.bin": "99a0f25f3e194c9c7e87308da0cd5872",
"assets/fonts/MaterialIcons-Regular.otf": "0c44899fcd1cf5ea2474ea5ccd817f20",
"assets/packages/ionicons/assets/fonts/Ionicons.ttf": "757f33cf07178f986e73b03f8c195bd6",
"assets/packages/syncfusion_flutter_pdfviewer/assets/underline.png": "c94a4441e753e4744e2857f0c4359bf0",
"assets/packages/syncfusion_flutter_pdfviewer/assets/fonts/RobotoMono-Regular.ttf": "5b04fdfec4c8c36e8ca574e40b7148bb",
"assets/packages/syncfusion_flutter_pdfviewer/assets/squiggly.png": "c9602bfd4aa99590ca66ce212099885f",
"assets/packages/syncfusion_flutter_pdfviewer/assets/highlight.png": "7384946432b51b56b0990dca1a735169",
"assets/packages/syncfusion_flutter_pdfviewer/assets/strikethrough.png": "cb39da11cd936bd01d1c5a911e429799",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "391ff5f9f24097f4f6e4406690a06243",
"assets/packages/line_icons/lib/assets/fonts/LineIcons.ttf": "bcaf3ba974cf7900b3c158ca593f4971",
"assets/packages/youtube_player_iframe/assets/player.html": "663ba81294a9f52b1afe96815bb6ecf9",
"assets/packages/eva_icons_flutter/lib/fonts/Eva-Icons.ttf": "b3cfd6832181cbaa3c98988c49d34641",
"assets/packages/wakelock_plus/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"assets/lib/fonts/Quicksand-VariableFont_weight.ttf": "aaaca85ea11863d1e4550d425f763bd1",
"assets/lib/assets/text/about_me/education.txt": "7c0aab0b523db3cb73dd441044743c00",
"assets/lib/assets/text/about_me/about_me.txt": "104173a8f2b5463daaec482aed40e58f",
"assets/lib/assets/images/profile_pic/profile_pic.png": "e6f0dd3fee71c627812f460d12f5048f",
"assets/lib/assets/images/profile_pic/profile_pic_flipped.png": "d4ddf304d1eb7e040be9ac9ff0a37a26",
"assets/lib/assets/images/miscellaneous/under_construction.png": "b876b773d399cdbf26a7632f48987716",
"assets/lib/assets/images/project_banners/grocery_mandi.png": "1a7c3303d2f7f9b98f2b2dec9c20743a",
"assets/lib/assets/images/project_banners/smart_india_hackathon_2023.png": "b9526802abd65a1f8338caae7213c1e7",
"assets/lib/assets/images/project_banners/snake.png": "e94d0edbe873e3eca983243c17663dda",
"assets/lib/assets/images/project_banners/portfolio.png": "b23cc894f1b2be1f4f27a66397daf96e",
"assets/lib/assets/images/project_banners/foss_overflow_2.png": "8e200f4fd8a5ddd84e251ac91281f231",
"assets/lib/assets/images/project_banners/hola_bot.png": "fbde837bab18f191c309a610a8d0bf2f",
"assets/lib/assets/images/project_banners/kastor.png": "932e223c1edfda55b858e448cd57fc4c",
"assets/lib/assets/images/project_banners/yoshop_scraper.png": "de7e45fc42fd5aa93eada59bbf633acd",
"assets/lib/assets/images/project_banners/acharya_setu.jpg": "5521ed8e6aa192a4057351d26882c28a",
"assets/lib/assets/images/project_banners/hospital_management_utility.png": "47dd63bac64fc1f1c18bf6eba22b62dc",
"assets/lib/assets/images/project_banners/vaulto.png": "eff166c574189dca934907e3ac4dae4c",
"assets/lib/assets/images/project_banners/ondc.png": "806b8fc4c79bbb49e03ee0fb1bffa7ac",
"assets/lib/assets/images/project_banners/foss_overflow.png": "0536085792ad01952d1807442e149284",
"assets/lib/assets/images/project_banners/data_in_ipl.png": "fab3a4661ebd0082d2c62c1dafc300bf",
"assets/lib/assets/images/project_banners/e_commerce_behaviour_understanding.png": "7559ee67aa374a396b7553c3e7f9b078",
"assets/lib/assets/images/project_banners/machine_learning.png": "59eadd433363618661334c3d1a744ae0",
"assets/lib/assets/images/project_banners/business_data_management.jpg": "b6c5ebd96787bf9e2cd05ca80c24bd71",
"assets/lib/assets/images/project_banners/samsung_solve_for_tomorrow.jpg": "b84f7042b5650bdb72aae51a325e2435",
"assets/lib/assets/images/project_banners/shell.jpg": "faa2d6ffe723a8e625fe959759b52647",
"assets/lib/assets/images/project_banners/messaging.png": "c982346611777e4a9bc3d3c50f9575e4",
"assets/lib/assets/images/project_banners/trance.png": "e25b06b2e3b5321d14f5850525710171",
"assets/lib/assets/images/project_banners/gen_ai_exchange.jpg": "9d470bc1a9a4c34f8418979c1b31f204",
"assets/lib/assets/images/project_images/foss_overflow/year_picker.png": "d753ec3b0348a67bb5463ec96bcc1c61",
"assets/lib/assets/images/project_images/foss_overflow/manage_rooms.png": "9d2082b00b7f5d6257658e8fb2da9324",
"assets/lib/assets/images/project_images/foss_overflow/faculty_entry.png": "72795950deb8d5f26eafa4a2738723eb",
"assets/lib/assets/images/project_images/foss_overflow/menu_entry.png": "ecb161f33674004d569309a8dc9deefe",
"assets/lib/assets/images/project_images/foss_overflow/timetable_1.png": "bd68a9ccd4ae97894ee96c3233b8b4dd",
"assets/lib/assets/images/project_images/foss_overflow/view_faculties.png": "ad7f6a692880575f78734301fdf48663",
"assets/lib/assets/images/project_images/foss_overflow/chatroom.png": "25fe5cf1842bb1b9564a5e67d334a8b1",
"assets/lib/assets/images/project_images/foss_overflow/manage_menu.png": "53ddc04b9ef040cc6258dc57038845f8",
"assets/lib/assets/images/project_images/foss_overflow/multi_choice_roles.png": "9724f4c6967ae12d7d9fc513de70e886",
"assets/lib/assets/images/project_images/foss_overflow/course_entry.png": "095d6d4019a547fb856ff6d6b5c44f4e",
"assets/lib/assets/images/project_images/foss_overflow/mess_menu.png": "7244be8850b13dcb4a9cd96f8b953099",
"assets/lib/assets/images/project_images/foss_overflow/student_entry.png": "2b5d0ca3b81654f4c6a0a7d2a0278804",
"assets/lib/assets/images/project_images/foss_overflow/user_auth.png": "c27786195f5afd8b5f9205d5fbf14496",
"assets/lib/assets/images/project_images/foss_overflow/admin_auth.png": "4b3675d727149d40583dae1cc5a5ce35",
"assets/lib/assets/images/project_images/foss_overflow/timetable_2.png": "6454bcea702a8423c839cda2dbe9f155",
"assets/lib/assets/images/project_images/foss_overflow/view_students.png": "edfbfcd19062ba807d3466147949aa77",
"assets/lib/assets/images/project_images/foss_overflow/view_courses.png": "dd70abba8714a655dc32dddff7a76336",
"assets/lib/assets/images/project_images/foss_overflow/lost_and_found.png": "99bc57a8c8e9f2a85eef85c9dbb1e92d",
"assets/lib/assets/images/project_images/foss_overflow/room_vacancy.png": "0479cdf0c30d63599a7a78f70f140469",
"assets/lib/assets/images/project_images/samsung_solve_for_tomorrow/workflow.png": "e100bcaf412e5eabc413590cca8c696b",
"assets/lib/assets/images/project_images/samsung_solve_for_tomorrow/certificate.png": "ff836bfbb61620c2fe6a65c938a65713",
"assets/lib/assets/images/project_images/samsung_solve_for_tomorrow/shortlist.png": "ba787f8e77db1d3471e5318458d6b8c4",
"assets/lib/assets/images/project_images/ecommerce_shoppers_behaviour_and_understanding/e_comm_accuracy.png": "355fcc076699cd45197bf601df4c02cb",
"assets/lib/assets/images/project_images/ecommerce_shoppers_behaviour_and_understanding/e_comm_heatmap.png": "dfca9e5dfb671c7899ad627097d3aa91",
"assets/lib/assets/images/project_images/ecommerce_shoppers_behaviour_and_understanding/e_comm_histograms.png": "1b080b0395046101c8666db7945408b9",
"assets/lib/assets/images/project_images/ecommerce_shoppers_behaviour_and_understanding/e_comm_f1.png": "94b45dfbe2ce1a9ab0f46cf90f5324d3",
"assets/lib/assets/images/project_images/ecommerce_shoppers_behaviour_and_understanding/e_comm_recall.png": "d91d8c0351b2c4c40ff8968342621052",
"assets/lib/assets/images/project_images/ecommerce_shoppers_behaviour_and_understanding/e_comm_precision.png": "d176c669cf0b5a6284516a99699a9c9b",
"assets/lib/assets/images/project_images/vaulto/vaulto_login.png": "80d8e34cd92e27e48d6327edef792a93",
"assets/lib/assets/images/project_images/vaulto/vaulto_register.png": "f708a99bbcf6d943caa8659fe19fe776",
"assets/lib/assets/images/project_images/smart_india_hackathon_2023/asaan_workflow.png": "e37f7568210b0b29ef9442145735bd14",
"assets/lib/assets/images/project_images/smart_india_hackathon_2023/asaan_classification_model_abstract.png": "240ce399a856846824adf33b59aae983",
"assets/lib/assets/images/project_images/smart_india_hackathon_2023/internal_results.jpeg": "469fb33ef825e5c6370f1bd3142f5cfb",
"assets/lib/assets/images/project_images/smart_india_hackathon_2023/asaan_authentication.png": "7599a944c33a6c75ad7bbe5b4e67bb60",
"assets/lib/assets/images/project_images/acharya_setu/login_opt_old.png": "1b6a16502bec27661267c359e451b2ab",
"assets/lib/assets/images/project_images/acharya_setu/home3.png": "c3b1ff7f83869987ea5a0fe214ee8a31",
"assets/lib/assets/images/project_images/acharya_setu/otp_page_new.png": "98b6e0b2632f9a10f6236ff721ad7215",
"assets/lib/assets/images/project_images/acharya_setu/number_input_old.png": "8a1856f09b1b5af034a22d62a9efe475",
"assets/lib/assets/images/project_images/acharya_setu/number_input_new.png": "848a1e19bcb94f2c7bfa3006de62d068",
"assets/lib/assets/images/project_images/acharya_setu/email_old.png": "05e7e492695eee3f9a401b366a37e7e7",
"assets/lib/assets/images/project_images/acharya_setu/email_reg_new.png": "8bf0d2ecc83b2262f3ee59bf4b66d7a1",
"assets/lib/assets/images/project_images/acharya_setu/Acharya_Setu_Question_Segmentation.png": "aec604fddc0ee5e23061ab8ad30d358e",
"assets/lib/assets/images/project_images/acharya_setu/Acharya_Setu_Template_Randomizer.png": "864a1f0d5c44f59dd94a027b33601153",
"assets/lib/assets/images/project_images/acharya_setu/email_reg_old.png": "d46a13b34a8cc01a61a5283fa3f07a3f",
"assets/lib/assets/images/project_images/acharya_setu/Acharya_Setu_Question_Context_Generation.png": "79debf0feef38aef761ba11b0a8108c6",
"assets/lib/assets/images/project_images/acharya_setu/otp_page_old.png": "e9e29de998aa0513c4d6e012231732f6",
"assets/lib/assets/images/project_images/acharya_setu/home2.png": "6f23b415ff1ad0e1865306c98c7623ea",
"assets/lib/assets/images/project_images/acharya_setu/Acharya_Setu_Question_Distribution.png": "a67ddb04e0d329d93ada50ec536f66c6",
"assets/lib/assets/images/project_images/acharya_setu/home1.png": "a570b4e8f5b54e04008c2a06a1a4364b",
"assets/lib/assets/images/project_images/acharya_setu/login_opt_new.png": "21a6b75d55bb9a203b862857b251a9dc",
"assets/lib/assets/images/project_images/acharya_setu/email_new.png": "bd08c3fda4fcf3bff441999d570d26fc",
"assets/lib/assets/images/project_images/acharya_setu/google_web.png": "e732ad02d52380a6d6378728b45108fb",
"assets/lib/assets/images/project_images/ondc_build_for_bharat/loading_screen.png": "c57c5753a47859030c535844029c668d",
"assets/lib/assets/images/project_images/ondc_build_for_bharat/edit_product.png": "2af5315a481812278d26c2cfb5658adb",
"assets/lib/assets/images/project_images/ondc_build_for_bharat/landing_page.png": "ad86c7e2301a2d525c380f6209f83561",
"assets/lib/assets/images/project_images/ondc_build_for_bharat/add_product.png": "14dbc46144119eed3288fb805fc3a9b0",
"assets/lib/assets/images/project_images/ondc_build_for_bharat/metrics.png": "6efcd0415bf5989f6f15b68fdad6ad82",
"assets/lib/assets/images/project_images/data_into_ipl/histogram.png": "128dd1db76269efc20075af131e27b94",
"assets/lib/assets/images/project_images/classic_snake/options.png": "ea05bdaaab7a3c873efa70ac09ac0dc3",
"assets/lib/assets/images/project_images/classic_snake/menu.png": "f5659af368270b3b263b80ea104528e7",
"assets/lib/assets/images/project_images/classic_snake/gameplay.png": "d9d4b3bfb7f1166416ed70a54d484c5c",
"assets/lib/assets/images/project_images/classic_snake/gameplay_two.png": "8c3198249418f11bded1c72624ec0acb",
"assets/lib/assets/images/project_images/trance/login_page.png": "87ed1ad713fabb5cd0f40268ef885800",
"assets/lib/assets/images/project_images/trance/creator_page.png": "27e2f460725706287c25d5a199a27c54",
"assets/lib/assets/images/project_images/trance/player_page.png": "2ff8b6ad087d8db417ccc8a974fcb2f0",
"assets/lib/assets/images/project_images/trance/add_song.png": "106d41e971f5f71e0f380ac34fb8b1c8",
"assets/lib/assets/images/project_images/trance/admin_page.png": "cb51c6b26c177c2b55b52514d26d9c7c",
"assets/lib/assets/images/project_images/shell_ai_hackathon/solution_flow.png": "6168ce07bcacfdca39589a79afa9d176",
"assets/lib/assets/images/project_images/shell_ai_hackathon/initial_biomass.png": "48c3322a89381019313f55a8adfa203c",
"assets/lib/assets/images/project_images/shell_ai_hackathon/unclustered.png": "5d605ed69cdc5f45612009a3fc5237a3",
"assets/lib/assets/images/project_images/shell_ai_hackathon/clustered.png": "b1491cb61f39f3ac5104b3f84175f860",
"assets/lib/assets/icons/chatbot.png": "5b8aafe47261c543e9524068023d014f",
"assets/lib/assets/icons/slack.png": "de101625160f15f11b34b3d2d95d6fb2",
"assets/lib/assets/icons/tech_stack/firebase-hosting.svg": "f7d6127fe349c9c2a98bd1ece5a94b30",
"assets/lib/assets/icons/tech_stack/xgboost.svg": "a4d533e574f336b0508bd17a530b687e",
"assets/lib/assets/icons/tech_stack/flutter.svg": "9a6e81be6ff5b09956f4f85fe1f0a89f",
"assets/lib/assets/icons/tech_stack/node_js_logo.svg": "89ccb09060a7adf788ea2340c54d6d78",
"assets/lib/assets/icons/tech_stack/express.svg": "caf149605fda10991288d059f81a22b6",
"assets/lib/assets/icons/tech_stack/bootstrap.svg": "5994f5e44d7f1e0546aeaf23a16b3ac6",
"assets/lib/assets/icons/tech_stack/html-5.svg": "55be2f7fd3025e8b3d07c2bb4da85824",
"assets/lib/assets/icons/tech_stack/numpy.svg": "d9d4a0fb78d41ee30532a14a7f01e921",
"assets/lib/assets/icons/tech_stack/dart.svg": "77736b70355db3b992d712891749acd5",
"assets/lib/assets/icons/tech_stack/scikit-learn.svg": "0fde75aed4e302f9204ad268f87db551",
"assets/lib/assets/icons/tech_stack/celery.svg": "b0b6f15e7a9b75b739d1aea0edf49a53",
"assets/lib/assets/icons/tech_stack/pandas.svg": "d721624b5f49551fc93ca70d56378c2a",
"assets/lib/assets/icons/tech_stack/matplotlib.svg": "dab09b4de35c84782547adaa54078d83",
"assets/lib/assets/icons/tech_stack/vue.svg": "3a85c1e14a52db1503e6cb64abbe89ef",
"assets/lib/assets/icons/tech_stack/axios.svg": "f60c454258023aa93505bd156e2cee1c",
"assets/lib/assets/icons/tech_stack/seaborn.svg": "f9f60e59b59ad66d7cacf7545e93fe89",
"assets/lib/assets/icons/tech_stack/cpp.svg": "97e8db73a7fc12814534e438ad112ca7",
"assets/lib/assets/icons/tech_stack/firestore.svg": "7e6fc669b797ce0dc20e1104eae973b9",
"assets/lib/assets/icons/tech_stack/flask.svg": "f8d52dd0a5e01babcd768e61a1fc5d1a",
"assets/lib/assets/icons/tech_stack/riverpod.svg": "06b58591b18455b86f255de6a0d91a5a",
"assets/lib/assets/icons/tech_stack/redis.svg": "545bec5203bbbd5bab1b23688a7427f9",
"assets/lib/assets/icons/tech_stack/bloc.svg": "61c05bdac9cc880dd2d5da94ce89f2fc",
"assets/lib/assets/icons/tech_stack/mongodb.svg": "ebf723d47dc4203868088d005452543b",
"assets/lib/assets/icons/tech_stack/tensorflow.svg": "8d074c5beccaac704d01216c73c195e5",
"assets/lib/assets/icons/tech_stack/firebase-storage.svg": "5a05197d7d729d067fa4d0af14d8f530",
"assets/lib/assets/icons/tech_stack/css.svg": "b9182af4b4d3659b33c5539b7ca82c52",
"assets/lib/assets/icons/tech_stack/mysql.svg": "18976b68e500f8d08b00330dc2db79bd",
"assets/lib/assets/icons/tech_stack/jinja.svg": "dc6cadb901fcd8c4bad26c0c6ffd8f7c",
"assets/lib/assets/icons/tech_stack/firebase.svg": "7f1bf2795e067daf4ac3b42a2a140496",
"assets/lib/pages/projects/kastor/description.html": "aae0a5b317800eca5db58b59b419c2f1",
"assets/lib/pages/projects/machine_learning/description.html": "9fbcc184e493e5f08700a894cf2dbc20",
"assets/lib/pages/projects/foss_overflow/features.html": "502ee4a9f090917fb62a0050a4d27748",
"assets/lib/pages/projects/foss_overflow/description.html": "5b4189a125523284af1e7b3663ebb2e6",
"assets/lib/pages/projects/foss_overflow/admin.html": "7f9c9536383086243de03be26aefafe5",
"assets/lib/pages/projects/foss_overflow/database_storage.html": "82454b5b2009ebfec663add0893e63c2",
"assets/lib/pages/projects/foss_overflow/conclusion.html": "2b44b5a9eb54fe909f9a06cdd1801c7c",
"assets/lib/pages/projects/foss_overflow/authentication.html": "7a6bea9aadb81e5a0f190014edd93bc9",
"assets/lib/pages/projects/foss_overflow/mentors.html": "add17f25614f0cb3909ab81a2483b3d3",
"assets/lib/pages/projects/foss_overflow/techstack.html": "6c5da4b5584d1b2a4a8fc0396fa341c6",
"assets/lib/pages/projects/samsung_solve_for_tomorrow/description.html": "8f4599c1fd774d74cf26dbd6b5c45064",
"assets/lib/pages/projects/samsung_solve_for_tomorrow/next_step.html": "4e407de30e3909d4855947e5eea7fc62",
"assets/lib/pages/projects/samsung_solve_for_tomorrow/journey.html": "a534b7d9966a7f8c396087bd3704b478",
"assets/lib/pages/projects/ecommerce_shoppers_behaviour_and_understanding/description.html": "a6db20827373fdf271738566699c27a3",
"assets/lib/pages/projects/ecommerce_shoppers_behaviour_and_understanding/results.html": "dfed5b374c49ddfe5fcf8fe5d8121f3e",
"assets/lib/pages/projects/ecommerce_shoppers_behaviour_and_understanding/techstack.html": "2c0b956f4001fc5db4cfbcd5f47d1813",
"assets/lib/pages/projects/ecommerce_shoppers_behaviour_and_understanding/models.html": "b13a3d7576c86532d98335d57801f003",
"assets/lib/pages/projects/vaulto/workflow.html": "9e92d22abb9c948c3ae91c0f556860f8",
"assets/lib/pages/projects/vaulto/description.html": "af93fdea5fd815dbeec081e0cb5838d9",
"assets/lib/pages/projects/vaulto/security.html": "b1877961d57a29e229b30d1309734c5e",
"assets/lib/pages/projects/vaulto/techstack.html": "f8fcc42f1f34e7a51ab8a6ce66116fb0",
"assets/lib/pages/projects/letstalkk/description.html": "f025f950ac994884784b874f727911a1",
"assets/lib/pages/projects/classic_snake_ffps/description.html": "7a839a178ac1acc6f1baf6ec9676dd07",
"assets/lib/pages/projects/classic_snake_ffps/game.html": "4c057af5e6ec362744c49a833120c70f",
"assets/lib/pages/projects/classic_snake_ffps/conclusion.html": "bf407eadc0573dfff76dc094e532d82a",
"assets/lib/pages/projects/classic_snake_ffps/techstack.html": "2c78a906019d5f70fabcd484e49fea25",
"assets/lib/pages/projects/holomorphic_bot/description.html": "cecdc41326aeffd42af2962a79278350",
"assets/lib/pages/projects/grocery_mandi/description.html": "60acc87a1c48396df55c740340c8e1c2",
"assets/lib/pages/projects/grocery_mandi/techstack.html": "a78a3bbc6b35857db8d63cd2e17ce77e",
"assets/lib/pages/projects/smart_india_hackathon_2023/internals.html": "e85f7ede78086db0f2c8f4b3c6611e40",
"assets/lib/pages/projects/smart_india_hackathon_2023/description.html": "39e7518635032a742989930b4db7d2c8",
"assets/lib/pages/projects/smart_india_hackathon_2023/prospective.pdf": "a2e8c98bbf07a49c5a813204941dfe37",
"assets/lib/pages/projects/smart_india_hackathon_2023/presentation.pdf": "980fa2bb33ced199f427c726a7fed97c",
"assets/lib/pages/projects/acharya_setu/features.html": "c957c220ca10e5852856b2c3b110dad5",
"assets/lib/pages/projects/acharya_setu/description.html": "4464da8b152f7e4f82e9cc78c75d9fea",
"assets/lib/pages/projects/acharya_setu/progress.html": "5804c432169a09c2d1ecebdd18c46f3e",
"assets/lib/pages/projects/acharya_setu/techstack.html": "7c2b39be9546a08023ac4a3f2543665d",
"assets/lib/pages/projects/yoshop_web_scraper/description.html": "442aa810cb09004596bb4830d054661f",
"assets/lib/pages/projects/ondc_build_for_bharat/team.html": "1f385097cfb72f2b675407d152d7c65d",
"assets/lib/pages/projects/ondc_build_for_bharat/conditions.html": "d47bf7288643feb02e20f0f359386a93",
"assets/lib/pages/projects/ondc_build_for_bharat/description.html": "d1cbd4b1e7322aa618cc5b1eb2546744",
"assets/lib/pages/projects/ondc_build_for_bharat/project.html": "8a84b92fe0f85bbfd0c986d9ec266ab7",
"assets/lib/pages/projects/ondc_build_for_bharat/conclusion.html": "b34a3a8a6655e3b4ecd4ef42e6735b77",
"assets/lib/pages/projects/ondc_build_for_bharat/results.html": "750c5cda78d67cebed911dd82a6c16de",
"assets/lib/pages/projects/data_into_ipl/description.html": "4c8e80c8b299846098603005c56fae33",
"assets/lib/pages/projects/data_into_ipl/project.html": "e34bad37508c1a203fed73b4879e1031",
"assets/lib/pages/projects/data_into_ipl/results.html": "89a4f4af6cc2c253a69fb96f4d317639",
"assets/lib/pages/projects/data_into_ipl/dataset.html": "ab15bfb4de164af1fab864c9601b637b",
"assets/lib/pages/projects/hospital_management_utility/description.html": "32e999d4cdf1e5206ea7708c599b2aeb",
"assets/lib/pages/projects/business_data_management/description.html": "b65a56f11e5d3ce9ef6d46d892845354",
"assets/lib/pages/projects/business_data_management/proposal.pdf": "83b22d331d0797e8bc975b7b145ba4a6",
"assets/lib/pages/projects/business_data_management/mid_report.pdf": "ae271fac8c47e2bf8e85af8f63e4fb2c",
"assets/lib/pages/projects/business_data_management/final_submission.pdf": "317663bbe9456565a61cba3768450a88",
"assets/lib/pages/projects/business_data_management/presentation.pdf": "3f0676f63e5b48d43bf77bfb4c5925e2",
"assets/lib/pages/projects/trance/description.html": "30519c97ff858bc125f9c1d38e870dfb",
"assets/lib/pages/projects/trance/website.html": "6b370976b624badfdfbffa4ef1c5651f",
"assets/lib/pages/projects/trance/techstack.html": "36d897e8850d9224a453b7de95f68a81",
"assets/lib/pages/projects/shell_ai_hackathon/description.html": "9b462dd05744a7e742ed97656e75861e",
"assets/lib/pages/projects/shell_ai_hackathon/project.html": "7b207647bc60a26257a2b638e21f043e",
"assets/lib/pages/projects/shell_ai_hackathon/results.html": "ea495369b07004e39d5ce06b8e474d41",
"assets/lib/pages/projects/shell_ai_hackathon/techstack.html": "010593fac9ed641c936f47185ef83682",
"assets/lib/pages/projects/portfolio_website/description.html": "0199a80c559ee5130c0736cb9e634d3a",
"assets/NOTICES": "a17c22eeb2f02efd29788959df0c62ba",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.json": "fc446513d4d007c6efe1d4d3923a03d9",
"assets/AssetManifest.bin.json": "36227cf6387d63d21f85be03032453c0",
"index.html": "4c86159ed0e49ab29abb0fd6200fb043",
"/": "4c86159ed0e49ab29abb0fd6200fb043",
"manifest.json": "a67989697c366cf4f821bde4733a6ca8",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"favicon.png": "0a4149f580855d863b9f7dce6ce7dcfa",
"version.json": "cc1fa9cce5af273c0909d105387fee89",
"flutter_bootstrap.js": "2366b9d49030a094e6c5e3fb2dd25c60"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
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
