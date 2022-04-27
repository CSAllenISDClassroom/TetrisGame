import Scenes
import Igis
  /*
     This class is responsible for the interaction Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class InteractionLayer : Layer, KeyDownHandler {
    let block = Block1()
    
   

    let background = Background()
    init() {
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Interaction")
          
          insert(entity:background,at:.front)
          insert(entity:block,at:.front)
          block.changeVelocity(velocityX:0,velocityY:4)
          // We insert our RenderableEntities in the constructor
      }
      func onKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {
          print(key)
          let blockReposition = 50
          let blockTopLeftPositionX = block.block.rect.topLeft.x
          let blockTopLeftPositionY = block.block.rect.topLeft.y
          
          if key == "ArrowLeft"{
              if blockTopLeftPositionX > 0{
                  block.move(to:Point(x:blockTopLeftPositionX - blockReposition, y:blockTopLeftPositionY))
              }
          }
          if key == "ArrowRight"{
              if blockTopLeftPositionY < 800{
                  block.move(to:Point(x:blockTopLeftPositionX + blockReposition, y:blockTopLeftPositionY))
              }
          }
      }
      
      override func preSetup(canvasSize: Size, canvas: Canvas) {
          block.move(to:Point(x: canvasSize.center.x, y: canvasSize.center.y))

          dispatcher.registerKeyDownHandler(handler: self)
      }

      override func postTeardown() {
          dispatcher.unregisterKeyDownHandler(handler: self)
      }
      
}

