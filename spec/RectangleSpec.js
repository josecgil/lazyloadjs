// Generated by CoffeeScript 1.8.0
(function() {
  describe("Rectangle", function() {
    var Point, Rectangle;
    beforeEach(function() {});
    afterEach(function() {});
    Rectangle = LazyLoadNS.Rectangle;
    Point = LazyLoadNS.Point;
    it("must create a correct rectangle with constructor", function() {
      var rectangle;
      rectangle = new Rectangle(0, 10, 20, 30);
      expect(rectangle.left).toBe(0);
      expect(rectangle.top).toBe(10);
      expect(rectangle.width).toBe(20);
      return expect(rectangle.height).toBe(30);
    });
    it("must calc correct right position", function() {
      var rectangle;
      rectangle = new Rectangle(10, 2000, 20, 2000);
      return expect(rectangle.right()).toBe(30);
    });
    it("must calc correct bottom position", function() {
      var rectangle;
      rectangle = new Rectangle(1000, 11, 1000, 43);
      return expect(rectangle.bottom()).toBe(54);
    });
    it("must know when a point is clearly inside him", function() {
      var rectangle;
      rectangle = new Rectangle(0, 0, 20, 20);
      return expect(rectangle.hasPointInside(new Point(10, 10))).toBeTruthy();
    });
    it("must know when a point is clearly outside him", function() {
      var rectangle;
      rectangle = new Rectangle(0, 0, 20, 20);
      return expect(rectangle.hasPointInside(new Point(30, 30))).toBeFalsy();
    });
    it("must know when a point is inside him (but in the limits)", function() {
      var rectangle;
      rectangle = new Rectangle(0, 0, 20, 20);
      return expect(rectangle.hasPointInside(new Point(20, 20))).toBeTruthy();
    });
    it("must know when a point is outside him (but in the limits)", function() {
      var rectangle;
      rectangle = new Rectangle(0, 0, 20, 20);
      return expect(rectangle.hasPointInside(new Point(21, 21))).toBeFalsy();
    });
    it("must know when a rare point in inside him", function() {
      var rectangle;
      rectangle = new Rectangle(0, 1000, 853, 641);
      return expect(rectangle.hasPointInside(new Point(8, 1220))).toBeTruthy();
    });
    it("must know when a rectangle has full collision with him", function() {
      var bigRectangle, smallRectangle;
      bigRectangle = new Rectangle(100, 100, 200, 200);
      smallRectangle = new Rectangle(150, 150, 100, 100);
      return expect(bigRectangle.hasCollisionWithRectangle(smallRectangle)).toBeTruthy();
    });
    it("must know when a rectangle has partial collision with him", function() {
      var bigRectangle, smallRectangle;
      bigRectangle = new Rectangle(100, 100, 200, 200);
      smallRectangle = new Rectangle(290, 290, 200, 200);
      return expect(bigRectangle.hasCollisionWithRectangle(smallRectangle)).toBeTruthy();
    });
    return it("must know when a rectangle has no collision with him", function() {
      var bigRectangle, smallRectangle;
      bigRectangle = new Rectangle(100, 100, 200, 200);
      smallRectangle = new Rectangle(301, 301, 100, 100);
      return expect(bigRectangle.hasCollisionWithRectangle(smallRectangle)).toBeFalsy();
    });
  });

}).call(this);
