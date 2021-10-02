'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "9ba5f6c9b9dae047dbb3345b8008e161",
"assets/assets/images/aero1.png": "8b8836c2a6f9db61877e6778100e62d6",
"assets/assets/images/aero2.png": "ca483f36a5d84c197bef8566bafa48ed",
"assets/assets/images/bannerWindTun.jpg": "26e86182525936148a27eb2f1e60b895",
"assets/assets/images/CAD2.png": "35584788331d4ff9affc5e8235acf1e9",
"assets/assets/images/CAD3.jpg": "49651369a511bd24bd89de0326964954",
"assets/assets/images/compManuf.jpg": "1764e5227b79d03fd4979b74c6ccea3a",
"assets/assets/images/img1.jpg": "2aa29c8b1864bfac0fb04a74e2581eb0",
"assets/assets/images/img2.jpg": "c99642d9ab04673e7e27b7952e42729c",
"assets/assets/images/img3.jpg": "75fa2892bbbd15d42b057f8e57b8d05c",
"assets/assets/images/landing1.JPG": "c67166ba9c285d864d6da94bf281e808",
"assets/assets/images/logo.png": "4d653d8b4b207bd44081533af742ef68",
"assets/assets/images/manufacture2.jpg": "22197f129364408e410fed7488177142",
"assets/assets/images/oldComp.jpg": "2bad84dd831e5f23df40e757f1b9980b",
"assets/assets/images/propelect.png": "08418d4fcb6bb57d2e172bce7e8b0911",
"assets/assets/images/PropElect1.jpg": "4222fcc6a762f28f00ca977857bc615c",
"assets/assets/images/spruceFly.JPG": "88cf910f9dbc7b9c51bde8f3f319b5b7",
"assets/assets/images/struct1.png": "325f98e1a3e6819079ecac9ea847131a",
"assets/assets/images/Struct2.png": "091aad028efb54528f9a189b34b3cc56",
"assets/assets/images/teamsbackground.jpg": "15c7a6948382a50ff787ca1595f76ead",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/NOTICES": "0c1b62949b85b3e5043d686025efaa98",
"favicon.png": "4d653d8b4b207bd44081533af742ef68",
"icons/favicon.png": "4d653d8b4b207bd44081533af742ef68",
"index.html": "5446ab599aff16520dfea6258c247bf6",
"/": "5446ab599aff16520dfea6258c247bf6",
"main.dart.js": "4fcdb82c7c9f1c2ee6b0feb7685b54ef",
"manifest.json": "bb7e10c908eb2f19ad5e043d27395656",
"version.json": "4dc6a6016c42abcf11ce77dc07b15d17"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
