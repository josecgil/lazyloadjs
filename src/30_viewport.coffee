@.LazyLoadNS=@.LazyLoadNS or {}

class Viewport

  Rectangle=LazyLoadNS.Rectangle

  constructor:->

  rectangle:->
    left=window.pageXOffset
    top=window.pageYOffset
    width=window.innerWidth
    height=window.innerHeight
    new Rectangle(left, top, width, height)

LazyLoadNS.Viewport=Viewport

