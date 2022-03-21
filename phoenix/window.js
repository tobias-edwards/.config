const frameArea = (frame, container) =>
  Object.keys(FRAMES).find((area) =>
    frameEqualToFrame(FRAMES[area](container), frame)
  );

const calcNewFrame = (direction, currentArea, screen) => {
  const currentScreen = screen.flippedVisibleFrame();
  const leftScreen = screens.leftOf(screen).flippedVisibleFrame();
  const rightScreen = screens.rightOf(screen).flippedVisibleFrame();

  switch (direction) {
    case AREA.FULL:
      return FRAMES[AREA.FULL](currentScreen);

    case AREA.LEFT:
      switch (currentArea) {
        case AREA.BOTTOM:
          return FRAMES[AREA.BOTTOM_LEFT](currentScreen);
        case AREA.BOTTOM_RIGHT:
          return FRAMES[AREA.BOTTOM](currentScreen);
        case AREA.BOTTOM_LEFT:
          return FRAMES[AREA.BOTTOM_RIGHT](leftScreen);
        case AREA.LEFT:
          return FRAMES[AREA.RIGHT](leftScreen);
        case AREA.TOP:
          return FRAMES[AREA.TOP_LEFT](currentScreen);
        case AREA.TOP_RIGHT:
          return FRAMES[AREA.TOP](currentScreen);
        case AREA.TOP_LEFT:
          return FRAMES[AREA.TOP_RIGHT](leftScreen);
        default:
          return FRAMES[AREA.LEFT](currentScreen);
      }

    case AREA.BOTTOM:
      switch (currentArea) {
        case AREA.TOP_LEFT:
          return FRAMES[AREA.LEFT](currentScreen);
        case AREA.LEFT:
          return FRAMES[AREA.BOTTOM_LEFT](currentScreen);
        case AREA.RIGHT:
          return FRAMES[AREA.BOTTOM_RIGHT](currentScreen);
        case AREA.TOP_RIGHT:
          return FRAMES[AREA.RIGHT](currentScreen);
        default:
          return FRAMES[AREA.BOTTOM](currentScreen);
      }

    case AREA.TOP:
      switch (currentArea) {
        case AREA.LEFT:
          return FRAMES[AREA.TOP_LEFT](currentScreen);
        case AREA.BOTTOM_LEFT:
          return FRAMES[AREA.LEFT](currentScreen);
        case AREA.RIGHT:
          return FRAMES[AREA.TOP_RIGHT](currentScreen);
        case AREA.BOTTOM_RIGHT:
          return FRAMES[AREA.RIGHT](currentScreen);
        default:
          return FRAMES[AREA.TOP](currentScreen);
      }

    case AREA.RIGHT:
      switch (currentArea) {
        case AREA.BOTTOM:
          return FRAMES[AREA.BOTTOM_RIGHT](currentScreen);
        case AREA.BOTTOM_LEFT:
          return FRAMES[AREA.BOTTOM](currentScreen);
        case AREA.BOTTOM_RIGHT:
          return FRAMES[AREA.BOTTOM_LEFT](rightScreen);
        case AREA.RIGHT:
          return FRAMES[AREA.LEFT](rightScreen);
        case AREA.TOP:
          return FRAMES[AREA.TOP_RIGHT](currentScreen);
        case AREA.TOP_LEFT:
          return FRAMES[AREA.TOP](currentScreen);
        case AREA.TOP_RIGHT:
          return FRAMES[AREA.TOP_LEFT](rightScreen);
        default:
          return FRAMES[AREA.RIGHT](currentScreen);
      }
  }
};

const shiftWindow = (direction) => {
  const window = Window.focused();
  if (!window) {
    Phoenix.log('Not a window');
    return;
  }

  const screen = Screen.main();
  const currentArea = frameArea(window.frame(), screen.flippedVisibleFrame());
  const newFrame = calcNewFrame(direction, currentArea, screen);
  window.setFrame_(newFrame);
};
