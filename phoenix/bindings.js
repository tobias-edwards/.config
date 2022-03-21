const MODIFIER = ['ctrl', 'option'];

Key.on('h', MODIFIER, () => {
  shiftWindow(AREA.LEFT);
});
Key.on('j', MODIFIER, () => {
  shiftWindow(AREA.BOTTOM);
});
Key.on('k', MODIFIER, () => {
  shiftWindow(AREA.TOP);
});
Key.on('l', MODIFIER, () => {
  shiftWindow(AREA.RIGHT);
});
Key.on('return', MODIFIER, () => {
  shiftWindow(AREA.FULL);
});
