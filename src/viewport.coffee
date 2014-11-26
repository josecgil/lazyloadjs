class @Viewport
  constructor:->

  rectangle:->
    left=window.pageXOffset
    top=window.pageYOffset
    width=window.innerWidth
    height=window.innerHeight
    new Rectangle(left, top, width, height)
