import Scenes
import Igis

  /*
     This class is responsible for rendering the background.
   */


class Block1 : RenderableEntity {
    let block = Rectangle(rect:Rect(topLeft:Point(x:150 ,y:150), size:Size(width:100, height:100)),fillMode:.fillAndStroke)
    let strokeStyle = StrokeStyle(color:Color(.green))
    let fillStyle = FillStyle(color:Color(.blue))
    let lineWidth = LineWidth(width:5)

    var velocityX:Int
    var velocityY:Int

    init() {
        // Using a meaningful name can be helpful for debugging
        velocityX = 0 
        velocityY = 0
        
        
        super.init(name:"Block1")
    }
    
    func changeVelocity(velocityX:Int, velocityY:Int) {
        self.velocityX = velocityX
        self.velocityY = velocityY
    }
    
    

    func move(to point:Point) {
        block.rect.topLeft = point
    }

    
    
    override func calculate(canvasSize: Size) {
        block.rect.topLeft += Point(x: velocityX, y: velocityY)
        
        let canvasBoundingRect = Rect(size:canvasSize)

        let ballBoundingRect = Rect(topLeft:Point(x:block.rect.topLeft.x - 25, y:block.rect.topLeft.y - 25),size:Size(width:block.rect.size.width+50,height:block.rect.size.height+50))

        let tooFarLeft = ballBoundingRect.topLeft.x < canvasBoundingRect.topLeft.x
        let tooFarRight = ballBoundingRect.topLeft.x + ballBoundingRect.size.width > canvasBoundingRect.topLeft.x + canvasBoundingRect.size.width
        
        let tooFarUp = ballBoundingRect.topLeft.y < canvasBoundingRect.topLeft.y
        let tooFarDown = ballBoundingRect.topLeft.y + ballBoundingRect.size.height > canvasBoundingRect.topLeft.y + canvasBoundingRect.size.height
        
        if tooFarLeft || tooFarRight {
            velocityX = -velocityX
        }
        if tooFarUp || tooFarDown {
            velocityY = -velocityY
        }
        
    }

    override func render(canvas:Canvas) {
        canvas.render(strokeStyle,fillStyle,lineWidth,block)
    }
    
}
