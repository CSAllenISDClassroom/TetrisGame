import Scenes
import Igis

  /*
     This class is responsible for rendering the background.
   */


class Background : RenderableEntity {
    
    
      init() {
          // Using a meaningful name can be helpful for debugging
          
          super.init(name:"Background")
      }
      func measurements(canvasSize:Size)->Rect{
          var width = canvasSize.width
          var height = canvasSize.height
          return Rect(size:Size(width:width,height:height))
      }
      override func setup(canvasSize:Size, canvas:Canvas) {
          let text = Text(location:Point(x:50, y:50), text:"\(canvasSize)")
          let rect = Rect(topLeft:Point(x:canvasSize.width/20 ,y:canvasSize.height/15), size:Size(width:canvasSize.width - canvasSize.width/10, height:canvasSize.height - canvasSize.height/5))
          let rectangle = Rectangle(rect:rect,fillMode:.stroke)
          let strokeStyle = StrokeStyle(color:Color(.green))
          canvas.render(strokeStyle, text, rectangle)
      }
}


