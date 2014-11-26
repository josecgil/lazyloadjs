class @Rectangle

  constructor:(@left, @top, @width, @height)->

  right:->
    @left + @width

  bottom:->
    @top + @height

  hasPointInside:(point)->
    if point.x >= @left and point.x <= @right() and point.y >= @top and point.y <= @bottom()
      return true
    false

  hasCollisionWithRectangle:(rectangle)->
    topLeftPoint=new Point(rectangle.left, rectangle.top)
    return true if @hasPointInside(topLeftPoint)

    topRightPoint=new Point(rectangle.right(), rectangle.top)
    return true if @hasPointInside(topRightPoint)

    bottomLeftPoint=new Point(rectangle.left, rectangle.bottom())
    return true if @hasPointInside(bottomLeftPoint)

    bottomRightPoint=new Point(rectangle.right(), rectangle.bottom())
    return true if @hasPointInside(bottomRightPoint)

    false

class @Point
  constructor:(@x, @y)->