class Screens {
  constructor() {
    this.arrange();
  }

  arrange() {
    this.horizontalArragement = Screen.all().toSorted(
      (screen1, screen2) => screen1.frame().x - screen2.frame().x,
    );
    this.verticalArragement = Screen.all().toSorted(
      (screen1, screen2) => screen1.frame().y - screen2.frame().y,
    );
  }

  horizontalIndexOf(screenId) {
    return this.horizontalArragement.findIndex(
      (screen) => screen.identifier() === screenId,
    );
  }

  verticalIndexOf(screenId) {
    return this.verticalArragement.findIndex(
      (screen) => screen.identifier() === screenId,
    );
  }

  topOf(screen) {
    const currentIndex = this.verticalIndexOf(screen.identifier());
    const prevIndex =
      currentIndex === 0
        ? this.verticalArragement.length - 1
        : currentIndex - 1;

    return this.verticalArragement[prevIndex];
  }

  bottomOf(screen) {
    const currentIndex = this.verticalIndexOf(screen.identifier());
    const nextIndex =
      currentIndex + 1 === this.verticalArragement.length
        ? 0
        : currentIndex + 1;

    return this.verticalArragement[nextIndex];
  }

  rightOf(screen) {
    const currentIndex = this.horizontalIndexOf(screen.identifier());
    const nextIndex =
      currentIndex + 1 === this.horizontalArragement.length
        ? 0
        : currentIndex + 1;

    return this.horizontalArragement[nextIndex];
  }

  leftOf(screen) {
    const currentIndex = this.horizontalIndexOf(screen.identifier());
    const prevIndex =
      currentIndex === 0
        ? this.horizontalArragement.length - 1
        : currentIndex - 1;

    return this.horizontalArragement[prevIndex];
  }
}

Screens.prototype.toString = function () {
  return this.horizontalArragement
    .map((screen) => JSON.stringify(screen.frame()))
    .toString();
};

const screens = new Screens();
Phoenix.log(screens);

Event.on("screensDidChange", () => {
  screens.arrange();
});
