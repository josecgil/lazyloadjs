@.LazyLoadNS=@.LazyLoadNS or {}

class Image

  Rectangle=LazyLoadNS.Rectangle
  Viewport=LazyLoadNS.Viewport

  constructor:(imageElement, @_loadingImage)->
    @_imageElement=imageElement

  rectangle:->
    left = @_imageElement.offsetLeft
    top = @_imageElement.offsetTop
    width = @_imageElement.width
    height = @_imageElement.height
    new Rectangle(left, top, width, height)

  isInViewPort:()->
    viewPortRectangle=new Viewport().rectangle()
    imageRectangle=@rectangle()
    if viewPortRectangle.hasCollisionWithRectangle(imageRectangle)
      return true
    false

  _isAlreadyCancelled:() ->
    return true if @_imageElement.getAttribute("cancelled") is "true"
    false

  cancel:()->
    return if @_isAlreadyCancelled()
    @_imageElement.setAttribute("cancelled","true")
    realSrc=@_imageElement.getAttribute("src")
    @_imageElement.src = @_loadingImage
    @_imageElement.setAttribute("data-src", realSrc)

  show:()->
    realSrc=@_imageElement.getAttribute("data-src")
    @_imageElement.src = realSrc
    @_imageElement.removeAttribute("data-src")
    @_imageElement.removeAttribute("data-lazy-load")
    @_imageElement.removeAttribute("cancelled")

LazyLoadNS.Image=Image