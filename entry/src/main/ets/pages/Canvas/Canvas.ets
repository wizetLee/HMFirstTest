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
  private offContext: OffscreenCanvasRenderingContext2D = new OffscreenCanvasRenderingContext2D(600, 600, this.settings)

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

          // {
          //   // 线性渐变
          //   let grad: CanvasGradient =
          //     this.context.createLinearGradient(this.context.width / 4, this.context.width / 4, this.context.width / 2,
          //       this.context.width / 2)
          //this.context.createRadialGradient()
          //this.context.createConicGradient()
          //   grad.addColorStop(0.0, '#ff0000')
          //   grad.addColorStop(0.5, '#ffffff')
          //   grad.addColorStop(1.0, '#00ff00')
          //   this.context.fillStyle = grad
          //   this.context.fillRect(0, 0, this.context.width / 2, this.context.width / 2)
          //
          //
          //   // this.context.fillStyle = oldFillStyle
          //   // this.context.fillRect(0, 30, 100, 100)
          //
          //   this.context.fillRect(240, 0, 100, 100);
          // }
          // { // 矩阵变化
          //   this.pattern = this.context.createPattern(this.img, 'no-repeat')
          //   this.matrix.scaleY = 0.5
          //   this.matrix.scaleX = 0.5
          //   this.matrix.translateX = 50
          //   this.matrix.translateY = 50
          //   if (this.pattern) {
          //     this.context.fillStyle = this.pattern
          //     this.pattern.setTransform(this.matrix)
          //   }
          //   this.context.fillRect(0, 0, 480, 720)
          // }
          // { // 圆圈
          //   this.context.lineWidth = 8
          //   this.context.arc(this.context.width / 2, this.context.height / 2, 30, 0, 3.14 * 2)
          //   this.context.setLineDash([10, 20])
          //   this.context.lineDashOffset = 10.0
          //   this.context.shadowBlur = 15
          //   this.context.shadowColor = 'rgb(0,0,0)'
          //   this.context.stroke()
          // }
          { // lineCap lineMiter
            this.context.beginPath()
            this.context.shadowBlur = 0
            this.context.shadowColor = 'rgba(0,0,0,0)'
            this.context.setLineDash([20, 3])
            this.context.lineDashOffset = 0
            this.context.lineWidth = 3
            this.context.arc(this.context.width / 2, this.context.height / 2, 30, 0, Math.PI * 2)
            this.context.stroke()

            this.context.beginPath()
            this.context.shadowBlur = 0
            this.context.shadowColor = 'rgb(0,255,0)'
            this.context.setLineDash([20, 3])
            this.context.lineDashOffset = 0 // 设置画布的虚线偏移量
            this.context.lineWidth = 3
            this.context.strokeStyle = `rgba(1, 1, 255, 1)`;
            this.context.arc(this.context.width / 2 + 70, this.context.height / 2, 30, 0, Math.PI * 2)
            this.context.stroke()


            this.context.beginPath()
            this.context.lineWidth = 6
            this.context.lineJoin = 'miter'
            this.context.miterLimit = 10
            this.context.moveTo(30, 130)
            this.context.lineTo(120, 260)
            this.context.lineTo(30, 210)
            // this.context.strokeStyle = `rgba(1, 1, 255, 1)`;
            // this.context.closePath() // 形成一个封闭路径 会补全path
            this.context.stroke()
          }
          { // 叠加层级的设置
            // this.context.globalCompositeOperation = 'source-over'
          }
          // {
          //   this.context.fillStyle // 颜色 图案 渐变色
          // }
          // {  //写字， 关于！的奇葩变动
          //   let ctx = this.context
          //   ctx.font = '48px serif';
          //   ctx.textAlign = 'start'
          //   ctx.fillText("你好!", 200, 50);
          //   ctx.direction = "rtl";
          //   ctx.fillText("你好!", 200, 100);
          // }
          {
            //this.context.filter
            //this.context.drawImage()
          }

          // {
          //   this.context.setLineDash([0, 0])
          //   this.context.lineDashOffset = 0
          //   let path2Da: Path2D = new Path2D()
          //   path2Da.moveTo(25, 25)
          //   path2Da.lineTo(25, 105)
          //   path2Da.lineTo(75, 105)
          //   path2Da.lineTo(75, 25)
          //   // path2Da.closePath()
          //   this.context.strokeStyle = 'rgb(0,0,255)'
          //   this.context.stroke(path2Da)
          // }

          {

            // this.context.rect(0, 0, 100, 200)
            // this.context.stroke()
            // // this.context.clip()
            // this.context.fillStyle = "rgb(255,0,0)"
            // this.context.fillRect(0, 0, 200, 200)
          }
          // { // 重置为其默认状态，清除后台缓冲区、绘制状态栈、绘制路径和样式
          //   this.context.reset()
          // }
          // {
          //   // 创建一个图层
          //   this.context.saveLayer()
          //   // 恢复到saveLayer前的状态
          //   this.context.restore()
          // }
          // {
          //   this.context.setTransform(1,0.5, -0.5, 1, 10, 10)
          //   this.context.fillStyle = 'rgb(0,0,255)'
          //   this.context.fillRect(0, 0, 100, 100)
          //   this.context.resetTransform()
          //   this.context.fillStyle = 'rgb(255,0,0)'
          //   this.context.fillRect(0, 0, 100, 100)
          // }
          {
            // this.context.reset()
            // this.context.lineWidth = 3
            // this.context.strokeRect(30, 30, 50, 50)
            // this.context.scale(2, 2) // Scale to 200%
            // this.context.strokeRect(30, 30, 50, 50)
          }
          // { // 通过OffscreenCanvasRenderingContext2D 独立渲染出一张ImageBitmap
          //   let imageData = this.offContext.createImageData(50, 50)
          //   for (let i = 0; i < imageData.data.length; i += 4) {
          //     imageData.data[i + 0] = 0
          //     imageData.data[i + 1] = 255
          //     imageData.data[i + 2] = 0
          //     imageData.data[i + 3] = 255
          //   }
          //   this.offContext.putImageData(imageData, 50, 50)
          //   let image = this.offContext.transferToImageBitmap()
          //   this.context.transferFromImageBitmap(image)
          // }
          {
            //this.context.toDataURL()
          }
          // {
          //   this.context.save();
          //   this.context.restore()
          // }
          {

          }
        })// 绑定手势
          // .gesture(
          //   LongPressGesture({ fingers: undefined, repeat: true, duration: undefined })
          //     .onAction((event: GestureEvent) => {
          //       console.log(`gesture - LongPressGesture - onAction ${event.offsetX} ${event.offsetY}
          //       ${event.velocityX} ${event.velocityY}
          //       `)
          //     }).onActionEnd((event: GestureEvent) => {
          //     console.log(`gesture - LongPressGesture - onActionEnd`)
          //   }).onActionCancel(() => {
          //     console.log(`gesture - LongPressGesture - onActionCancel`)
          //   }),
          // )
        .gesture(
          TapGesture({ count: 1 })
            .onAction((event: GestureEvent) => {
              console.log(`gesture - TapGesture`)
            }),
        )
        .gesture(
          PanGesture().onActionStart((event: GestureEvent) => {
            if (event.fingerList.length > 0) {
              let finger = event.fingerList[0];
              console.log(`gesture - PanGesture - onActionStart finger ${finger.localX} ${finger.localY}`)
            } else {
              console.log(`gesture - PanGesture - onActionStart ${event.offsetX} ${event.offsetY}`)
            }
          }).onActionUpdate((event: GestureEvent) => {
            if (event.fingerList.length > 0) {
              let finger = event.fingerList[0];
              console.log(`gesture - PanGesture - onActionUpdate finger ${finger.localX} ${finger.localY}`)
            } else {
              console.log(`gesture - PanGesture - onActionUpdate ${event.offsetX} ${event.offsetY}`)
            }
          }).onActionEnd((event: GestureEvent) => {
            console.log(`gesture - PanGesture - onActionEnd`)
          }).onActionCancel(() => {
            console.log(`gesture - PanGesture - onActionCancel`)
          }),
        )
      // .gesture(
      //   PinchGesture()
      // )
      // .gesture(
      //   RotationGesture()
      // )
      // .gesture(
      //   SwipeGesture()
      // )
      // .gesture(
      //   GestureGroup(GestureMode.Sequence,
      //     // 各种手势
      //   )
      // )
      //绑定优先识别手势
      //.priorityGesture()
      //绑定可与子组件手势同时触发的手势。
      //.parallelGesture()
      //

    }
    .width('100%')
    .height('100%')
  }
}