const AREA = {
  BOTTOM: 'bottom',
  BOTTOM_LEFT: 'bottom-left',
  BOTTOM_RIGHT: 'bottom-right',
  FULL: 'full',
  LEFT: 'left',
  RIGHT: 'right',
  TOP: 'top',
  TOP_LEFT: 'top-left',
  TOP_RIGHT: 'top-right',
};

const FRAMES = {
  [AREA.BOTTOM]: (container) => ({
    x: container.x,
    y: Math.round(container.y + container.height / 2),
    width: container.width,
    height: Math.round(container.height / 2),
  }),
  [AREA.BOTTOM_LEFT]: (container) => ({
    x: container.x,
    y: Math.round(container.y + container.height / 2),
    width: Math.round(container.width / 2),
    height: Math.round(container.height / 2),
  }),
  [AREA.BOTTOM_RIGHT]: (container) => ({
    x: Math.round(container.x + container.width / 2),
    y: Math.round(container.y + container.height / 2),
    width: Math.round(container.width / 2),
    height: Math.round(container.height / 2),
  }),
  [AREA.FULL]: (container) => container,
  [AREA.LEFT]: (container) => ({
    x: container.x,
    y: container.y,
    width: Math.round(container.width / 2),
    height: container.height,
  }),
  [AREA.RIGHT]: (container) => ({
    x: Math.round(container.x + container.width / 2),
    y: container.y,
    width: Math.round(container.width / 2),
    height: container.height,
  }),
  [AREA.TOP]: (container) => ({
    x: container.x,
    y: container.y,
    width: container.width,
    height: Math.round(container.height / 2),
  }),
  [AREA.TOP_LEFT]: (container) => ({
    x: container.x,
    y: container.y,
    width: Math.round(container.width / 2),
    height: Math.round(container.height / 2),
  }),
  [AREA.TOP_RIGHT]: (container) => ({
    x: Math.round(container.x + container.width / 2),
    y: container.y,
    width: Math.round(container.width / 2),
    height: Math.round(container.height / 2),
  }),
};
