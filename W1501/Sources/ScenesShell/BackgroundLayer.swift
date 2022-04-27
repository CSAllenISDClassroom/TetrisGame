import Scenes

  /*
     This class is responsible for the background Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class BackgroundLayer : Layer {
    let clearscreen = ClearScreen()
      init() {

          // Using a meaningful name can be helpful for debugging
          super.init(name:"Background")
          insert(entity:clearscreen,at:.back)
          
      }
  }
