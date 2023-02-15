
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:inflearn_flutter_image_search_app/data/pixabay_api.dart';
import 'package:inflearn_flutter_image_search_app/env/env.dart';
import 'package:inflearn_flutter_image_search_app/model/photo.dart';


// https://velog.io/@jsoh/Flutter-MockClient-%EB%A1%9C-%ED%85%8C%EC%8A%A4%ED%8A%B8-%EC%BD%94%EB%93%9C-%EC%9E%91%EC%84%B1
//Http 자체에서 목 데이터 제공함 -> 사용 방삭 변경 ~!

void main() {
  test(
    '픽사베이 데이터를 잘 가져와야 한다.',
        () async {
      final mockClient = MockClient((request) async {
        if (request.url.toString() == 'https://pixabay.com/api/?key=${Env
            .Image_Key}&q=apple&image_type=photo&pretty=true') {
          return Response(fakeData, 200);
        }
        return Response('error', 404);
      });

      final api = PixabayApi();
      //실행
      final List<Photo> result = await api.fetch('apple', client: mockClient);
      // 검증

      expect(result.first.id, 634572);
      // expect(result[0].previewURL, "https://cdn.pixabay.com/photo/2015/02/13/00/43/apples-634572_150.jpg");
      // expect(result.length, 20);

    },
  );
}

const fakeData = """
{
  "total": 9135,
  "totalHits": 500,
  "hits": [
    {
      "id": 634572,
      "pageURL": "https://pixabay.com/photos/apples-fruits-red-ripe-vitamins-634572/",
      "type": "photo",
      "tags": "apples, fruits, red",
      "previewURL": "https://cdn.pixabay.com/photo/2015/02/13/00/43/apples-634572_150.jpg",
      "previewWidth": 100,
      "previewHeight": 150,
      "webformatURL": "https://pixabay.com/get/ge50f0e0cdb411b5186f9b5b40eaf17d0ec99775f59c52135729f4021eee9bbc59780822d8a410bb7ef4237a2d382ccd2_640.jpg",
      "webformatWidth": 427,
      "webformatHeight": 640,
      "largeImageURL": "https://pixabay.com/get/gad9fdde7bb81b37d3b741c0f186d73290990d7f00d59198c5530af6b902007a4b4561d14c082fe48f5aa7b81edc34829c0d4f47a4d46414cd6a62155acb4f11a_1280.jpg",
      "imageWidth": 3345,
      "imageHeight": 5017,
      "imageSize": 811238,
      "views": 468668,
      "downloads": 272591,
      "collections": 1263,
      "likes": 2350,
      "comments": 192,
      "user_id": 752536,
      "user": "Desertrose7",
      "userImageURL": "https://cdn.pixabay.com/user/2016/03/14/13-25-18-933_250x250.jpg"
    },
    {
      "id": 1868496,
      "pageURL": "https://pixabay.com/photos/apple-computer-desk-workspace-1868496/",
      "type": "photo",
      "tags": "apple, computer, desk",
      "previewURL": "https://cdn.pixabay.com/photo/2016/11/29/08/41/apple-1868496_150.jpg",
      "previewWidth": 150,
      "previewHeight": 99,
      "webformatURL": "https://pixabay.com/get/gaec453c7448d6f2dc8e572aa92942683b8b69806bb234955ca7ce0931b870bf7bf0ee72a77397de791aa3200ea11718ea4612e87e23f07c808666671ffc08c4b_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 426,
      "largeImageURL": "https://pixabay.com/get/gd946e766e0f1729f4960f295aa8243be9889916c042497f01e641db930cf6006fdd4dd65607b3baee845701862dcf570cb875a6f5d518cde80d53269db637ff8_1280.jpg",
      "imageWidth": 5184,
      "imageHeight": 3456,
      "imageSize": 2735519,
      "views": 673285,
      "downloads": 489030,
      "collections": 1362,
      "likes": 1020,
      "comments": 272,
      "user_id": 2286921,
      "user": "Pexels",
      "userImageURL": "https://cdn.pixabay.com/user/2016/03/26/22-06-36-459_250x250.jpg"
    },
    {
      "id": 1873078,
      "pageURL": "https://pixabay.com/photos/apples-orchard-apple-trees-1873078/",
      "type": "photo",
      "tags": "apples, orchard, apple trees",
      "previewURL": "https://cdn.pixabay.com/photo/2016/11/30/15/23/apples-1873078_150.jpg",
      "previewWidth": 150,
      "previewHeight": 95,
      "webformatURL": "https://pixabay.com/get/gb5b36a3177ae4fe599b8b25ead3eaffbff01c88f57c53542f5467d5ccb89eed4f35bc20be337f0a4f29da7a961315542d2c15cbc07d6058df85cb23bb744db22_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 408,
      "largeImageURL": "https://pixabay.com/get/gd0934148be0e7d8bd6b9134dbe980180ef34c603ca584c64e949660fe4c9d843d4da00374d96ac48eb2a67c34be8102627075b38bd2443786806ebb8a9d11172_1280.jpg",
      "imageWidth": 3212,
      "imageHeight": 2051,
      "imageSize": 2581012,
      "views": 425073,
      "downloads": 244762,
      "collections": 1120,
      "likes": 1131,
      "comments": 174,
      "user_id": 3890388,
      "user": "lumix2004",
      "userImageURL": ""
    },
    {
      "id": 1122537,
      "pageURL": "https://pixabay.com/photos/apple-water-droplets-fruit-moist-1122537/",
      "type": "photo",
      "tags": "apple, water droplets, fruit",
      "previewURL": "https://cdn.pixabay.com/photo/2016/01/05/13/58/apple-1122537_150.jpg",
      "previewWidth": 150,
      "previewHeight": 95,
      "webformatURL": "https://pixabay.com/get/gcf4ad30c9928d8077ff181f1518ba7c2e4801f3b3ac1df75d83054eb0095c561956f6a6d900a3c53537af13d2384ebbe686af5211d21448d06bc2b1e92198528_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 409,
      "largeImageURL": "https://pixabay.com/get/g872ae1b76354da09d1de63aa9d72849dca04060dd4342b1cee35fa47af634da45311e61dce7693dc9958887fd11c3a0fa5ca66150b444b83a9510e8ef0c7b869_1280.jpg",
      "imageWidth": 4752,
      "imageHeight": 3044,
      "imageSize": 5213632,
      "views": 317759,
      "downloads": 182650,
      "collections": 1024,
      "likes": 1133,
      "comments": 185,
      "user_id": 1445608,
      "user": "mploscar",
      "userImageURL": "https://cdn.pixabay.com/user/2016/01/05/14-08-20-943_250x250.jpg"
    },
    {
      "id": 256261,
      "pageURL": "https://pixabay.com/photos/apple-books-still-life-fruit-food-256261/",
      "type": "photo",
      "tags": "apple, books, still life",
      "previewURL": "https://cdn.pixabay.com/photo/2014/02/01/17/28/apple-256261_150.jpg",
      "previewWidth": 150,
      "previewHeight": 99,
      "webformatURL": "https://pixabay.com/get/g85605a392090eb896e6b757974a92b96f9cc36b9b6efa9eb22fa0027b2eba6fcd88e1d9d4ec534dd20f67c45a60fccfc_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 423,
      "largeImageURL": "https://pixabay.com/get/g2a13bdf1ecb6a676ae5b2879d41990153c415744ab6b0d214d1482b5c2310117c4ea7686eeb64d9a1c20b9175c8c262cf1c08ce4e9b56ef826d4827b18bbe27f_1280.jpg",
      "imageWidth": 4928,
      "imageHeight": 3264,
      "imageSize": 2987083,
      "views": 497265,
      "downloads": 253755,
      "collections": 933,
      "likes": 955,
      "comments": 244,
      "user_id": 143740,
      "user": "jarmoluk",
      "userImageURL": "https://cdn.pixabay.com/user/2019/09/18/07-14-26-24_250x250.jpg"
    },
    {
      "id": 410324,
      "pageURL": "https://pixabay.com/photos/iphone-smartphone-apps-apple-inc-410324/",
      "type": "photo",
      "tags": "iphone, smartphone, apps",
      "previewURL": "https://cdn.pixabay.com/photo/2014/08/05/10/30/iphone-410324_150.jpg",
      "previewWidth": 150,
      "previewHeight": 99,
      "webformatURL": "https://pixabay.com/get/g43055d981e2c1e893e2fc59bb8a3576f98cefd8aeb5fdc6f1949779ba7851c4dce04cc6beb6f7f1dea05dd50a14b95a6_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 426,
      "largeImageURL": "https://pixabay.com/get/g137fe2f0078654f359d8c3759075bee07345b809a7347274bbafacfd15647835aacabd8e4c9d3b77066b705a392392db9d4b0917ed5d1bf98790c83c3106e80b_1280.jpg",
      "imageWidth": 2180,
      "imageHeight": 1453,
      "imageSize": 477025,
      "views": 767456,
      "downloads": 449962,
      "collections": 900,
      "likes": 812,
      "comments": 221,
      "user_id": 264599,
      "user": "JESHOOTS-com",
      "userImageURL": "https://cdn.pixabay.com/user/2014/06/08/15-27-10-248_250x250.jpg"
    },
    {
      "id": 1894723,
      "pageURL": "https://pixabay.com/photos/smartphone-cellphone-touchscreen-1894723/",
      "type": "photo",
      "tags": "smartphone, cellphone, touchscreen",
      "previewURL": "https://cdn.pixabay.com/photo/2016/12/09/11/33/smartphone-1894723_150.jpg",
      "previewWidth": 150,
      "previewHeight": 99,
      "webformatURL": "https://pixabay.com/get/gbefdab56164eaf217a7c3272d596d4945ebefc431e1e0a4a876f072d985c0c820b6a3a4ca13efb2b6a30e0421f7768c96c44318322bc1c71219461c7564481c3_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 426,
      "largeImageURL": "https://pixabay.com/get/g510c2b492fe849b6d7e4f9b72ac6dc32e2bcd79d9f97317c7cf56bf38a06ec73c5a1b86c782b53ac210b81ee232b6163a733160057ffee8f4268890898438b2d_1280.jpg",
      "imageWidth": 5005,
      "imageHeight": 3337,
      "imageSize": 1214266,
      "views": 483922,
      "downloads": 310788,
      "collections": 775,
      "likes": 821,
      "comments": 286,
      "user_id": 282134,
      "user": "stevepb",
      "userImageURL": "https://cdn.pixabay.com/user/2015/09/15/20-33-27-452_250x250.jpg"
    },
    {
      "id": 1368187,
      "pageURL": "https://pixabay.com/photos/apple-blossom-flowers-tree-1368187/",
      "type": "photo",
      "tags": "apple blossom, flowers, tree",
      "previewURL": "https://cdn.pixabay.com/photo/2016/05/02/22/16/apple-blossom-1368187_150.jpg",
      "previewWidth": 150,
      "previewHeight": 88,
      "webformatURL": "https://pixabay.com/get/gbe407f2bfda31a6e2c56e49a4de474fc54e009d8ebfa05f83dfa6d90646faf2291babe79f5bf0becb977fd27fc6756f4289756e702cdfd7dac0bf57651ab7e93_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 379,
      "largeImageURL": "https://pixabay.com/get/gc01b5a50bcf83d2a95a3840c51f65804a56b01c6f00c10006e3e78006780ee305bb09ced02a3db261da68de063e0637d33534c558f0ba336bdf26f1ed5f1c656_1280.jpg",
      "imageWidth": 3966,
      "imageHeight": 2352,
      "imageSize": 860935,
      "views": 226398,
      "downloads": 135338,
      "collections": 625,
      "likes": 726,
      "comments": 127,
      "user_id": 2367988,
      "user": "kie-ker",
      "userImageURL": ""
    },
    {
      "id": 410311,
      "pageURL": "https://pixabay.com/photos/iphone-hand-screen-smartphone-apps-410311/",
      "type": "photo",
      "tags": "iphone, hand, screen",
      "previewURL": "https://cdn.pixabay.com/photo/2014/08/05/10/27/iphone-410311_150.jpg",
      "previewWidth": 150,
      "previewHeight": 99,
      "webformatURL": "https://pixabay.com/get/gd39893cdfe05f09f9b564ffde83f1ed84ec3fa8485f04e5da29b8e26eeaffbaaec2611ef7c5b66315411eb72e1db2339_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 426,
      "largeImageURL": "https://pixabay.com/get/g6fc6473e5ec3fb4560087f6289d21076af9cc6918d3fccc1e5ae74fbaa263dd4decbf7b4e0ff479f57739c0991cbf4c374d7ce32d7a01bc6d2df59ae56ba5e3f_1280.jpg",
      "imageWidth": 1920,
      "imageHeight": 1280,
      "imageSize": 416413,
      "views": 548975,
      "downloads": 274807,
      "collections": 640,
      "likes": 609,
      "comments": 167,
      "user_id": 264599,
      "user": "JESHOOTS-com",
      "userImageURL": "https://cdn.pixabay.com/user/2014/06/08/15-27-10-248_250x250.jpg"
    },
    {
      "id": 1776744,
      "pageURL": "https://pixabay.com/photos/apples-leaves-fall-still-life-1776744/",
      "type": "photo",
      "tags": "apples, leaves, fall",
      "previewURL": "https://cdn.pixabay.com/photo/2016/10/27/22/52/apples-1776744_150.jpg",
      "previewWidth": 150,
      "previewHeight": 100,
      "webformatURL": "https://pixabay.com/get/g36a21cc870dfb5e425264c9ac3a1966f7db150e44dc044c8e4337d20832b8eda6365e919ca6e6fe0a05176cd21db922075261fd27423a4723e6a776484ce2d98_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 427,
      "largeImageURL": "https://pixabay.com/get/g607e5047784799b3b3c78c4a6b707a8a1e4136ab1ca5c2125ba4acd0661b36a78b8b7e41cbea6eb83ef3d20b1c32257ecac97a4e730f8dd6820c1df8fcb0765a_1280.jpg",
      "imageWidth": 4193,
      "imageHeight": 2798,
      "imageSize": 2002268,
      "views": 200535,
      "downloads": 120129,
      "collections": 694,
      "likes": 646,
      "comments": 92,
      "user_id": 2970404,
      "user": "castleguard",
      "userImageURL": "https://cdn.pixabay.com/user/2016/09/18/22-38-35-578_250x250.jpg"
    },
    {
      "id": 606761,
      "pageURL": "https://pixabay.com/photos/apple-imac-ipad-workplace-606761/",
      "type": "photo",
      "tags": "apple, imac, ipad",
      "previewURL": "https://cdn.pixabay.com/photo/2015/01/21/14/14/apple-606761_150.jpg",
      "previewWidth": 150,
      "previewHeight": 99,
      "webformatURL": "https://pixabay.com/get/g5fdd10d2a4fc908cb2ecb749348a670a6fcc9641631d5cc58e9764919c8966c348e0cf16d29f3421314fda127c4ccc58_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 425,
      "largeImageURL": "https://pixabay.com/get/ga5454ff858418b23ac0c1ac74d0a939e642c8046e20390ada8ea624a89f1629e09dbf4910edb4eb7e85444728cd8eb7d9e21c3fec0491525725deb45cf446906_1280.jpg",
      "imageWidth": 4209,
      "imageHeight": 2796,
      "imageSize": 1649126,
      "views": 417977,
      "downloads": 228994,
      "collections": 665,
      "likes": 491,
      "comments": 116,
      "user_id": 663163,
      "user": "Firmbee",
      "userImageURL": "https://cdn.pixabay.com/user/2020/11/25/09-38-28-431_250x250.png"
    },
    {
      "id": 2838921,
      "pageURL": "https://pixabay.com/photos/laptop-mockup-graphics-tablet-2838921/",
      "type": "photo",
      "tags": "laptop, mockup, graphics tablet",
      "previewURL": "https://cdn.pixabay.com/photo/2017/10/10/21/47/laptop-2838921_150.jpg",
      "previewWidth": 150,
      "previewHeight": 89,
      "webformatURL": "https://pixabay.com/get/g63d605382cd949d7b999c6b600036bd27035707d590c1bea5c8cdf526a9b6ede1899832975e3d541271aac1f97275ca4b23ad6dc2c90c5dd6a6cb35b2a19374c_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 380,
      "largeImageURL": "https://pixabay.com/get/g85b5ecdfa60a722787bc2b19de4ef25c1c83300640bc51f7e7575a675bc06261e6f61d9c9eaf93602c7ac94bc77f56d540f008be7fca52b67cbd425b9b203357_1280.jpg",
      "imageWidth": 5472,
      "imageHeight": 3252,
      "imageSize": 5820165,
      "views": 372137,
      "downloads": 221026,
      "collections": 683,
      "likes": 478,
      "comments": 107,
      "user_id": 4664461,
      "user": "lukasbieri",
      "userImageURL": "https://cdn.pixabay.com/user/2017/02/26/12-31-50-780_250x250.jpg"
    },
    {
      "id": 1872997,
      "pageURL": "https://pixabay.com/photos/apples-fruits-orchard-nature-trees-1872997/",
      "type": "photo",
      "tags": "apples, fruits, orchard",
      "previewURL": "https://cdn.pixabay.com/photo/2016/11/30/15/00/apples-1872997_150.jpg",
      "previewWidth": 150,
      "previewHeight": 99,
      "webformatURL": "https://pixabay.com/get/g33a074273b2f508543825672ad4bb32296def0872ce204e7e862e1c177b4108a2a6e63c7a32f196e307e521e4d9546e0fa5a65080bb376e04ec849d9d0ad169b_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 426,
      "largeImageURL": "https://pixabay.com/get/g36b1833a9a18f6de6f310b6dee7f164bef27ffa40734bae8214a0aa888f8e1f7ef1dce029cdd9164b3c20cc62f2a20d42126748920799ae8805bacd753ff6af2_1280.jpg",
      "imageWidth": 3504,
      "imageHeight": 2336,
      "imageSize": 2019234,
      "views": 194925,
      "downloads": 120632,
      "collections": 613,
      "likes": 623,
      "comments": 90,
      "user_id": 3890388,
      "user": "lumix2004",
      "userImageURL": ""
    },
    {
      "id": 2788662,
      "pageURL": "https://pixabay.com/photos/apple-red-hand-apple-plantation-2788662/",
      "type": "photo",
      "tags": "apple, red, hand",
      "previewURL": "https://cdn.pixabay.com/photo/2017/09/26/13/42/apple-2788662_150.jpg",
      "previewWidth": 150,
      "previewHeight": 88,
      "webformatURL": "https://pixabay.com/get/g0d18c1bd29236b573eae7e6df537c9b62c0aa30ea87df80a8e8208079073ff7ca115afc69b0797f01226e94d44a0f2de2ceee16f286c2b94dfd88332c7edceb7_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 377,
      "largeImageURL": "https://pixabay.com/get/g1b475996a3d3ed89351ab0143dac55cea7bf8ed37af2356f0a27fbd82cd00201b2b2e52080f238b1fce235fbb26743695c3d2f55ea48bb724dd18c05224763f7_1280.jpg",
      "imageWidth": 6000,
      "imageHeight": 3539,
      "imageSize": 2042422,
      "views": 165293,
      "downloads": 95212,
      "collections": 583,
      "likes": 591,
      "comments": 88,
      "user_id": 2364555,
      "user": "NoName_13",
      "userImageURL": "https://cdn.pixabay.com/user/2022/12/12/07-40-59-226_250x250.jpg"
    },
    {
      "id": 569153,
      "pageURL": "https://pixabay.com/photos/home-office-notebook-home-couch-569153/",
      "type": "photo",
      "tags": "home office, notebook, home",
      "previewURL": "https://cdn.pixabay.com/photo/2014/12/15/14/05/home-office-569153_150.jpg",
      "previewWidth": 150,
      "previewHeight": 99,
      "webformatURL": "https://pixabay.com/get/g98df447816c20ff8f7e59f5889f52eb03a38fa0556945b2ba3f905640e3d59251504201226d842b5574e356d9eab4f79_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 426,
      "largeImageURL": "https://pixabay.com/get/g3b60025b30e89c6ff818621392a15c050b14c820d6b125e54c54575baa54c82ef14d1db8bf861e439c19f79c2ce17e01f841d4ddaa0bd53380691aaaf01b9d1b_1280.jpg",
      "imageWidth": 5760,
      "imageHeight": 3840,
      "imageSize": 3991496,
      "views": 328864,
      "downloads": 174587,
      "collections": 662,
      "likes": 472,
      "comments": 90,
      "user_id": 364018,
      "user": "Life-Of-Pix",
      "userImageURL": "https://cdn.pixabay.com/user/2014/08/21/23-01-42-554_250x250.jpg"
    },
    {
      "id": 267948,
      "pageURL": "https://pixabay.com/photos/statue-of-liberty-new-york-statue-267948/",
      "type": "photo",
      "tags": "statue of liberty, new york, statue",
      "previewURL": "https://cdn.pixabay.com/photo/2014/02/17/10/20/statue-of-liberty-267948_150.jpg",
      "previewWidth": 150,
      "previewHeight": 84,
      "webformatURL": "https://pixabay.com/get/gca8808d24258af872373862d7f84571dd12111508eda126e6a306eb8a49571e7e9bce9eb0d502b29f6e62a197edc1c68_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 359,
      "largeImageURL": "https://pixabay.com/get/g2001032931a66fb4f807e3b7a66a5f00277c9bbffc528588253ea146293ae1db407d5209375cb2d22c59e1c997e0dab16cbc2bc796e10b4a6eb81a8895f14dcc_1280.jpg",
      "imageWidth": 4000,
      "imageHeight": 2248,
      "imageSize": 1920397,
      "views": 455861,
      "downloads": 325922,
      "collections": 526,
      "likes": 566,
      "comments": 98,
      "user_id": 126846,
      "user": "Ronile",
      "userImageURL": "https://cdn.pixabay.com/user/2015/07/05/23-24-04-703_250x250.jpg"
    },
    {
      "id": 2788599,
      "pageURL": "https://pixabay.com/photos/apples-red-apple-ripe-apple-orchard-2788599/",
      "type": "photo",
      "tags": "apples, red apple, ripe",
      "previewURL": "https://cdn.pixabay.com/photo/2017/09/26/13/21/apples-2788599_150.jpg",
      "previewWidth": 150,
      "previewHeight": 99,
      "webformatURL": "https://pixabay.com/get/gfee2697667413f9f69913ae22bc88906befc63cc957d9ca678ca27da8c1c555df38eb7e601bb1cc90745f408eee35db819120a3ca71c82bd0dbdda39663d080f_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 426,
      "largeImageURL": "https://pixabay.com/get/g7a417f7b2278020d06068f50922e9615d3bcc06ef77f0b0fb5a36d08277e799301e304f967f499c69c0f6f948442952e949a6e90d90495a225c7ad03b18b03e5_1280.jpg",
      "imageWidth": 6000,
      "imageHeight": 4000,
      "imageSize": 3660484,
      "views": 132613,
      "downloads": 70362,
      "collections": 543,
      "likes": 607,
      "comments": 67,
      "user_id": 2364555,
      "user": "NoName_13",
      "userImageURL": "https://cdn.pixabay.com/user/2022/12/12/07-40-59-226_250x250.jpg"
    },
    {
      "id": 2557571,
      "pageURL": "https://pixabay.com/photos/laptop-apple-macbook-computer-2557571/",
      "type": "photo",
      "tags": "laptop, apple, macbook",
      "previewURL": "https://cdn.pixabay.com/photo/2017/07/31/11/44/laptop-2557571_150.jpg",
      "previewWidth": 150,
      "previewHeight": 99,
      "webformatURL": "https://pixabay.com/get/gc85e5b7c78030ed702772f291f91f55a541bf328fdc137d1f4ae14d228b3cc8ee4ae0dd7c237c34aaf4aafbde44fc53014923c3b7367b7e4e3b35772985be07d_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 426,
      "largeImageURL": "https://pixabay.com/get/g7c3cb42b4762732e33046dfd2411cd015c6b5d294507a4ff7922cb9ea0a226d372fe13089d7910f04813da3d87d01766ff0b84cb0997abb51e64d993b82d6a5e_1280.jpg",
      "imageWidth": 4460,
      "imageHeight": 2973,
      "imageSize": 780651,
      "views": 183013,
      "downloads": 108146,
      "collections": 660,
      "likes": 468,
      "comments": 66,
      "user_id": 894430,
      "user": "StockSnap",
      "userImageURL": "https://cdn.pixabay.com/user/2015/03/30/12-22-31-508_250x250.jpg"
    },
    {
      "id": 256263,
      "pageURL": "https://pixabay.com/photos/apple-books-classroom-red-apple-256263/",
      "type": "photo",
      "tags": "apple, books, classroom",
      "previewURL": "https://cdn.pixabay.com/photo/2014/02/01/17/28/apple-256263_150.jpg",
      "previewWidth": 150,
      "previewHeight": 99,
      "webformatURL": "https://pixabay.com/get/gcf4772ce5a846a5176b53d06eef17339052c8cd966012d00b6805556f365f04157f69289deb2696d83a69a029c3af322_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 423,
      "largeImageURL": "https://pixabay.com/get/g083090c99ac5ee41f6811f9dfbfbdca181b72aa3684d2615f3466d50fd87d2f3bf861fc98321988a91c309bfd84a0c33cdf24c9ccb93c81de16c2f61b3f1c1ca_1280.jpg",
      "imageWidth": 4928,
      "imageHeight": 3264,
      "imageSize": 2864273,
      "views": 235295,
      "downloads": 123912,
      "collections": 566,
      "likes": 510,
      "comments": 103,
      "user_id": 143740,
      "user": "jarmoluk",
      "userImageURL": "https://cdn.pixabay.com/user/2019/09/18/07-14-26-24_250x250.jpg"
    },
    {
      "id": 581131,
      "pageURL": "https://pixabay.com/photos/office-home-office-creative-apple-581131/",
      "type": "photo",
      "tags": "office, home office, creative",
      "previewURL": "https://cdn.pixabay.com/photo/2014/12/27/15/40/office-581131_150.jpg",
      "previewWidth": 150,
      "previewHeight": 99,
      "webformatURL": "https://pixabay.com/get/gf1b558167bd10fdbe11100436c9f1dae439b35476d7e29b6dfebfb9f1cc32d67304ab10ccad8faf405a5b1b051da2e6a_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 426,
      "largeImageURL": "https://pixabay.com/get/g0e6ff8b6d272b97f8a094ff975ebec3e315c34c453ef4aa2f35fd09dba499bf179a5f762e4566f859469668bd3ec96917033ee59d0278a9e3132b4a5900281a9_1280.jpg",
      "imageWidth": 5760,
      "imageHeight": 3840,
      "imageSize": 5987170,
      "views": 343243,
      "downloads": 195335,
      "collections": 653,
      "likes": 426,
      "comments": 84,
      "user_id": 670330,
      "user": "markusspiske",
      "userImageURL": "https://cdn.pixabay.com/user/2016/07/06/12-50-00-288_250x250.jpg"
    }
  ]
}
""";