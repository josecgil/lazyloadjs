class @Image

  constructor:(imageElement, @_loadingImage)->
    @_imageElement=$(imageElement)

  isInViewPort:()->
    element = @_imageElement.get(0)
    viewPortRectangle=new Viewport().rectangle()
    imageRectangle=new Rectangle(element.offsetLeft, element.offsetTop, element.width, element.height)
    if viewPortRectangle.hasCollisionWithRectangle(imageRectangle)
      return true
    false

  _isAlreadyCancelled:() ->
    imgIsCancelled=@_imageElement.data("cancelled")
    return imgIsCancelled

  cancel:()->
    return if @_isAlreadyCancelled()
    @_imageElement.data("cancelled",true)
    realSrc=@_imageElement.attr("src")
    @_imageElement.get(0).src = @_loadingImage
    @_imageElement.attr("data-src", realSrc)

  show:()->
    realSrc=@_imageElement.attr("data-src")
    @_imageElement.get(0).src = realSrc
    @_imageElement.removeAttr("data-src")