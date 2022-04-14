import Scenes
import Igis

  /*
     This class is responsible for rendering the background.
   */


class Background : RenderableEntity {
    let text : Text
      init() {
          // Using a meaningful name can be helpful for debugging
          text = Text(location:Point(x:50, y:50), text:"Hello, World!")
          super.init(name:"Background")
      }
      override func setup(canvasSize:Size, canvas:Canvas) {
          canvas.render(text)
      }
}
