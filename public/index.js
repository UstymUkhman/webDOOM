'use strict';

(function () {
  var doomCanvas = null;
  var fullscreenButton = null;

  window.Module = {
    monitorRunDependencies: function (toLoad) {
      this.dependencies = Math.max(this.dependencies, toLoad);
    },

    inFullscreen: false,
    dependencies: 0,
    
    setStatus: null,
    progress: null,

    loader: null,
    canvas: null
  };

  function getCanvas () {
    doomCanvas.addEventListener('webglcontextlost', function (event) {
      alert('WebGL context lost. You need to reload the page.');
      event.preventDefault();
    }, false);

    doomCanvas.addEventListener('contextmenu', function (event) {
      event.preventDefault();
    });

    fullscreenButton.addEventListener('click', function () {
      Module.requestFullscreen(true, false);
    });

    return doomCanvas;
  }

  function getStatus (status) {
    var loading = status.match(/([^(]+)\((\d+(\.\d+)?)\/(\d+)\)/);

    if (loading) {
      var progress = loading[2] / loading[4] * 100;
      Module.progress.innerHTML = progress.toFixed(1) + '%';

      if (progress === 100) {
        setTimeout(function () {
          fullscreenButton.classList.add('visible');
          Module.loader.classList.add('completed');
          doomCanvas.classList.add('ready');
        }, 500);

        setTimeout(function () {
          Module.canvas.dispatchEvent(new Event('mousedown'));
        }, 2000);
      }
    }
  }

  function onPointerLockChange () {
    Module.inFullscreen = !Module.inFullscreen;

    if (!Module.inFullscreen) {
      doomCanvas.classList.remove('centered');
    } else {
      doomCanvas.classList.add('centered');
    }
  };

  window.addEventListener('DOMContentLoaded', function () {
    document.exitPointerLock = document.exitPointerLock || document.mozExitPointerLock || document.webkitExitPointerLock;
    document.exitFullscreen = document.exitFullscreen || document.mozCancelFullScreen || document.webkitCancelFullScreen;

    document.addEventListener('mozpointerlockchange', onPointerLockChange, false)
    document.addEventListener('pointerlockchange', onPointerLockChange, false)

    fullscreenButton = document.getElementById('fullscreen');
    Module.progress = document.getElementById('progress');
    Module.loader = document.getElementById('loader');
    doomCanvas = document.getElementById('doom');

    Module.setStatus = getStatus;
    Module.canvas = getCanvas();

    var doomScript = document.createElement('script');
    document.body.appendChild(doomScript);
    doomScript.type = 'text/javascript';
    doomScript.src = './doom1.js';
  });
})();
