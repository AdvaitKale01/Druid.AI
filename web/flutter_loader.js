window.addEventListener('load', function() {
    var serviceWorkerVersion = null;

    if ('serviceWorker' in navigator) {
        window.addEventListener('flutter-first-frame', function () {
            navigator.serviceWorker.register('flutter_service_worker.js');
        });
    }

    // Load the main Dart script
    var scriptTag = document.createElement('script');
    scriptTag.src = 'main.dart.js';
    scriptTag.type = 'application/javascript';
    scriptTag.onload = function() {
        // Initialize Flutter after the script is loaded
        _flutter.loader.loadEntrypoint({
            serviceWorker: {
                serviceWorkerVersion: serviceWorkerVersion,
            },
            onEntrypointLoaded: async function(engineInitializer) {
                let appRunner = await engineInitializer.initializeEngine();
                await appRunner.runApp();
            }
        });
    };
    document.body.appendChild(scriptTag);
}); 