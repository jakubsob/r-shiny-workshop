function openFullscreen(obj) {
  if (obj.requestFullscreen) {
    obj.requestFullscreen();
  } else if (obj.mozRequestFullScreen) { /* Firefox */
    obj.mozRequestFullScreen();
  } else if (obj.webkitRequestFullscreen) { /* Chrome, Safari and Opera */
    obj.webkitRequestFullscreen();
  } else if (obj.msRequestFullscreen) { /* IE/Edge */
    obj.msRequestFullscreen();
  }
}