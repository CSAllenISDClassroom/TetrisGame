
import Scenes
import Igis

  /*
     This class is responsible for rendering the background.
   */


class ClearScreen : RenderableEntity {
    
   
      init() {
          // Using a meaningful name can be helpful for debugging
          
          super.init(name:"ClearScreen")
      }
      
      override func setup(canvasSize:Size, canvas:Canvas) {
          let canvasRect = Rect(size:canvasSize)
          let canvasRectangle = Rectangle(rect:canvasRect,fillMode:.fill)
          let clearStyle = FillStyle(color:Color(.white))
          canvas.render(clearStyle,canvasRectangle)
      }
}

