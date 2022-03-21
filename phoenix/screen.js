class Screens {
  constructor() {
    this.all = Screen.all().sort(
      (screen1, screen2) => screen1.frame().x - screen2.frame().x
    );
  }

  indexOf(screenId) {
    return this.all.findIndex((screen) => screen.identifier() === screenId);
  }

  rightOf(screen) {
    const nextIndex =
      (this.indexOf(screen.identifier()) + this.all.length - 1) %
      this.all.length;
    return this.all[nextIndex];
  }

  leftOf(screen) {
    const currentIndex = this.indexOf(screen.identifier());
    const prevIndex = (currentIndex + this.all.length + 1) % this.all.length;
    return this.all[prevIndex];
  }
}

Screens.prototype.toString = function () {
  return this.all.map((screen, i) => JSON.stringify(screen.frame())).toString();
};

const screens = new Screens();
