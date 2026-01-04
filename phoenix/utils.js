// Window.setFrame() will sometimes fail when moving the window to another screen
// https://github.com/kasper/phoenix/issues/297
Window.prototype.setFrame_ = function (args) {
  let attempts = 0;
  let success = false;
  do {
    success = Window.prototype.setFrame.call(this, args);
    attempts += 1;
  } while (!success && attempts < 30);
  return success;
};

const frameEqualToFrame = (rect1, rect2) =>
  rect1.x === rect2.x &&
  rect1.y === rect2.y &&
  rect1.width === rect2.width &&
  rect1.height === rect2.height;
