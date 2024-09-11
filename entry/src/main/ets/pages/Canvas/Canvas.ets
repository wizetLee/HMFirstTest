import { LengthMetricsUnit } from '@kit.ArkUI'

@Entry({ routeName: "Canvas" })
@Component
struct CanvasPage {
  private settings: RenderingContextSettings = new RenderingContextSettings(true) // 抗锯齿启动！，还可以自定义像素单位，但最好别乱整
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)

  // 用于矩阵变化
  private img: ImageBitmap = new ImageBitmap("resources/base/media/background.png")
  private matrix: Matrix2D = new Matrix2D()
  private pattern: CanvasPattern | null = null


  //

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      // 图片是获取成功的
      // Image('resources/base/media/background.png')
      //   .width(200)

      Canvas(this.context)
        .width('100%')
        .height('100%')
        .backgroundColor('#ffff00')
        .onReady(() => {
          // 获取画布的尺寸
          // console.log(`画布尺寸 : ${this.context.width} ${this.context.height}`)
          //
          // this.context.lineWidth = 10;
          //
          // let oldFillStyle = this.context.fillStyle
          //
          // // 线性渐变
          // let grad: CanvasGradient =
          //   this.context.createLinearGradient(this.context.width / 4, this.context.width / 4, this.context.width / 2,
          //     this.context.width / 2)
          // grad.addColorStop(0.0, '#ff0000')
          // grad.addColorStop(0.5, '#ffffff')
          // grad.addColorStop(1.0, '#00ff00')
          // this.context.fillStyle = grad
          // this.context.fillRect(0, 0, this.context.width / 2, this.context.width / 2)
          //
          //
          // // this.context.fillStyle = oldFillStyle
          // // this.context.fillRect(0, 30, 100, 100)
          //
          // this.context.fillRect(240, 0, 100, 100);
          //
          //
          // // 矩阵变化
          // // {
          // //   this.pattern = this.context.createPattern(this.img, 'no-repeat')
          // //   this.matrix.scaleY = 0.5
          // //   this.matrix.scaleX = 0.5
          // //   this.matrix.translateX = 50
          // //   this.matrix.translateY = 50
          // //   if (this.pattern) {
          // //     this.context.fillStyle = this.pattern
          // //     this.pattern.setTransform(this.matrix)
          // //   }
          // //   this.context.fillRect(0, 0, 480, 720)
          // // }
          //
          //
          //
          // this.context.lineWidth = 5
          // this.context.strokeStyle = `rgb(1, 1, 255)`;
          // this.context.strokeRect(25, 25, 85, 105)
          //



          this.context.lineWidth = 8
          this.context.arc(this.context.width / 2, this.context.height / 2, 30, 0, 3.14 * 2)
          this.context.setLineDash([10,20])
          this.context.lineDashOffset = 10.0
          this.context.shadowBlur = 15
          this.context.shadowColor = 'rgb(0,0,0)'
          this.context.stroke()


          // this.context.globalCompositeOperation = 'source-over'
          this.context.beginPath()
          this.context.shadowBlur = 0
          this.context.arc(this.context.width / 2, this.context.height / 2, 30, 0, 3.14 * 2)
          this.context.setLineDash([])
          this.context.lineWidth = 4
          this.context.lineJoin = 'miter'
          this.context.miterLimit = 10
          this.context.moveTo(30, 30)
          this.context.lineTo(120, 60)
          this.context.lineTo(30, 110)
          this.context.strokeStyle = `rgba(1, 1, 255, 1)`;
          this.context.stroke()
          this.context.closePath()






          this.context.font = '30vp sans-serif'
          this.context.fillText("Hello vp", 20, 100)// 默认的自提就是vp

          this.context.fillStyle // 颜色 图案 渐变色

          {
            let ctx = this.context
            ctx.font = '48px serif';
            ctx.textAlign = 'start'
            ctx.fillText("Hi ltr!", 200, 50);
            ctx.direction = "rtl";
            ctx.fillText("Hi rtl!", 200, 100);
          }
          {
            
          }

        })
        .onClick((event) => {
          console.log(`onClick event ${event}`)
        })
        .onDragMove((event, extraParma) => {
          //FIXME:
          console.log(`onDragMove event ${event}`)
          console.log(`onDragMove extraPrama ${extraParma}`)
        })
    }
    .width('100%')
    .height('100%')
  }
}