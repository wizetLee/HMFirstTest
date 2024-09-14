export class DataHistogramElement {
  color: Color | undefined
  desc: string | undefined
  value: number | undefined

  constructor(
    color?: Color,
    desc?: string,
    value?: number,
  ) {
    this.color = color
    this.desc = desc
    this.value = value
  }
}

export class DataHistogramModel {
  static defaultModel(): DataHistogramModel {
    return new DataHistogramModel(
      [
        new DataHistogramElement(Color.Green, "--", 0),
        new DataHistogramElement(Color.Green, "--", 0),
        new DataHistogramElement(Color.Green, "--", 0),
        new DataHistogramElement(Color.Green, "--", 0),
        new DataHistogramElement(Color.Green, "--", 0),
        new DataHistogramElement(Color.Gray, "--", 0),
        new DataHistogramElement(Color.Red, "--", 0),
        new DataHistogramElement(Color.Red, "--", 0),
        new DataHistogramElement(Color.Red, "--", 0),
        new DataHistogramElement(Color.Red, "--", 0),
        new DataHistogramElement(Color.Red, "--", 0),
      ],
      [
        new DataHistogramElement(Color.Green, "--", 0),
        new DataHistogramElement(Color.Green, "--", 0),
        new DataHistogramElement(Color.Green, "--", 0),
        new DataHistogramElement(Color.Green, "--", 0),
        new DataHistogramElement(Color.Green, "--", 0),
        new DataHistogramElement(Color.Gray, "--", 0),
        new DataHistogramElement(Color.Red, "--", 0),
        new DataHistogramElement(Color.Red, "--", 0),
        new DataHistogramElement(Color.Red, "--", 0),
        new DataHistogramElement(Color.Red, "--", 0),
        new DataHistogramElement(Color.Red, "--", 0),
      ],
      [
        new DataHistogramElement(Color.Green, "10-8", 0),
        new DataHistogramElement(Color.Gray, "8-6", 0),
        new DataHistogramElement(Color.Gray, "6-4", 0),
        new DataHistogramElement(Color.Gray, "4-2", 0),
        new DataHistogramElement(Color.Gray, "2-0", 0),
        new DataHistogramElement(Color.Gray, "平", 0),
        new DataHistogramElement(Color.Gray, "0-2", 0),
        new DataHistogramElement(Color.Gray, "2-4", 0),
        new DataHistogramElement(Color.Gray, "4-6", 0),
        new DataHistogramElement(Color.Gray, "6-8", 0),
        new DataHistogramElement(Color.Red, "8-10", 0),
      ],
      [
        new DataHistogramElement(Color.Green, "跌--家", 0),
        new DataHistogramElement(Color.Gray, "平--家", 0),
        new DataHistogramElement(Color.Red, "涨--家", 0),
      ],
      [
        new DataHistogramElement(Color.Green, "涨--家", 0),
        new DataHistogramElement(Color.Gray, "平--家", 0),
        new DataHistogramElement(Color.Red, "跌--家", 0),
      ],
    )
  }

  settings: RenderingContextSettings = new RenderingContextSettings(true)
  context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  // 柱状信息
  columnar: DataHistogramElement[] = []
  columnarTopDesc: DataHistogramElement[] = []
  columnarBottomDesc: DataHistogramElement[] = []
  // 比例信息
  scale: DataHistogramElement[] = []
  scaleDesc: DataHistogramElement[] = []
  padding?: Padding

  constructor(
    columnar: DataHistogramElement[] = [],
    columnarTopDesc: DataHistogramElement[] = [],
    columnarBottomDesc: DataHistogramElement[] = [],
    scale: DataHistogramElement[] = [],
    scaleDesc: DataHistogramElement[] = [],
    padding?: Padding
  ) {
    this.columnar = columnar
    this.columnarTopDesc = columnarTopDesc
    this.columnarBottomDesc = columnarBottomDesc
    this.scale = scale
    this.scaleDesc = scaleDesc
    this.padding = padding
  }

  draw() {
    this.context.reset()
    this.context.lineWidth = 0
    this.context.font = '11vp 500';

    let startX = 0.0
    let startY = 0.0
    let padding = this.padding
    let canvasWidth = this.context.width
    let canvasHeight = this.context.height
    if (padding) {
      if (typeof padding.left === 'number') {
        startX = startX + padding.left
      }
      if (typeof padding.top === 'number') {
        startY = startY + padding.top
      }
      if (typeof padding.right === 'number') {
        canvasWidth = canvasWidth - padding.right - startX
      }
      if (typeof padding.bottom === 'number') {
        canvasHeight = canvasHeight - padding.bottom - startY
      }
    }

    if (this.columnar.length == 0) {
      console.log("Error DataHistogram column count == 0")
      return
    } else {

    }

    let columnarWidthPerColumn = canvasWidth / this.columnar.length
    let columnarWidth = columnarWidthPerColumn * 0.5
    let columnarTopDescDrawHeight = (this.columnarTopDesc.length == 0) ? 0 : 11
    let columnarBottomDescDrawHeight = (this.columnarBottomDesc.length == 0) ? 0 : 20
    let columnarScaleDrawHeight = (this.scale.length == 0) ? 0 : 30
    let columnarScaleDescDrawHeight = (this.scaleDesc.length == 0) ? 0 : 10
    let columnarHeight = canvasHeight
      - columnarTopDescDrawHeight
      - columnarBottomDescDrawHeight
      - columnarScaleDrawHeight
      - columnarScaleDescDrawHeight;
    if (columnarHeight <= 0) {
      console.log("Error DataHistogram column columnarHeight <= 0")
      return
    }
    let drawX = startX;
    let drawY = startY;
    let maxValue = 0;
    this.columnar.forEach((element) => {
      if (element.value) {
        maxValue = Math.max(maxValue, element.value)
      }
    })
    let num: number = this.columnar.length;
    let i: number = 0;
    for (i = 0; i < num; i++) {
      drawY = startY;
      let columnTop = this.columnarTopDesc[i];
      if (columnTop) {
        drawY += columnarTopDescDrawHeight
      }
      let column = this.columnar[i];
      this.context.fillStyle = column.color ?? Color.Gray
      if (column) {
        drawY += columnarHeight
        this.context.save()
        this.context.beginPath()
        let curValue = (column.value ?? 0);
        let y = curValue / maxValue * columnarHeight
        if (maxValue <= 0) {

        } else {
          let path =
            this.drawRoundedRect(drawX + (columnarWidthPerColumn - columnarWidth) / 2
              , drawY - y
              , columnarWidth
              , Math.max(y, 2)
              , {
                topLeft: 2,
                topRight: 2,
              })
          this.context.fill(path)
        }

        if (columnTop && columnTop.desc) {
          this.context.textAlign = 'center'
          this.context.direction = 'inherit'
          this.context.textBaseline = 'bottom'
          this.context.fillText(columnTop.desc, drawX + columnarWidthPerColumn / 2, drawY - y,
            columnarWidthPerColumn)
          // let measureTextResult = this.context.measureText(columnTop.desc)
        }
      }
      let columnBottom = this.columnarBottomDesc[i];
      if (columnBottom) {
        if (columnBottom && columnBottom.desc) {
          this.context.fillText(columnBottom.desc, drawX + columnarWidthPerColumn / 2,
            drawY + columnarBottomDescDrawHeight, columnarWidthPerColumn)
        }
        drawY += columnarBottomDescDrawHeight
      }
      let scale = this.scale[i]
      if (scale) {
        drawY += columnarScaleDrawHeight
      }
      let scaleDesc = this.scaleDesc[i]
      if (scaleDesc) {
        drawY += columnarScaleDescDrawHeight
      }
      drawX += columnarWidthPerColumn
    }

    { // 绘制scale
      // startX
      // canvasWidth
      // columnarScaleDrawHeight
      let displayElement: DataHistogramElement[] =
        this.scale.filter((element) => (element.value != null && element.value != 0))
      let scaleCount = displayElement.length;
      let y = startY + columnarTopDescDrawHeight + columnarHeight + columnarBottomDescDrawHeight
      let ellipse = 10
      y = y + ((columnarScaleDrawHeight - ellipse) / 2)
      if (scaleCount <= 1) {
        let path =
          this.drawRoundedRect(startX, y, canvasWidth, ellipse, {
            topLeft: ellipse / 2,
            topRight: ellipse / 2,
            bottomLeft: ellipse / 2,
            bottomRight: ellipse / 2
          })
        this.context.fillStyle = Color.Gray
        this.context.fill(path)
      } else {
        // 画多段数据
        let spaceWidth = 3
        let topLeft = ellipse / 2
        let topRight = ellipse / 2
        let bottomLeft = ellipse / 2
        let bottomRight = ellipse / 2

        let num: number = displayElement.length;
        let i: number = 0;
        let sumOfValue = 0
        displayElement.forEach((element) => {
          sumOfValue += (element.value ?? 0)
        })
        let x = startX + topLeft
        let scaleTotalWidth = canvasWidth - ellipse - (displayElement.length - 1) * spaceWidth - spaceWidth
        for (i = 0; i < num; i++) {
          let element = displayElement[i];
          let elementDisplayWidth = (element.value ?? 0) / sumOfValue * scaleTotalWidth
          this.context.fillStyle = element.color ?? Color.Gray
          this.context.beginPath()
          if (i == 0) {
            //WARNIGN: 为什么多加一个specialWidth：因为有一个斜边在UI上，斜边全责，UI设计全责，上面的scaleTotalWidth最后的 - spaceWidth同理
            let specialWidth = spaceWidth
            this.context.moveTo(x, y);
            this.context.lineTo(x + elementDisplayWidth + specialWidth, y)
            this.context.lineTo(x + elementDisplayWidth - spaceWidth + specialWidth, y + ellipse)
            this.context.lineTo(x, y + ellipse)
            this.context.arcTo(x - bottomLeft, y + ellipse,
              x - topLeft, y + ellipse / 2,
              ellipse / 2)
            this.context.arcTo(x - topLeft, y, x, y, ellipse / 2)
            this.context.fill()
            x = x + specialWidth
            x = x + elementDisplayWidth
            x = x + spaceWidth
          } else if (i == num - 1) {
            this.context.moveTo(x, y);
            this.context.lineTo(x + elementDisplayWidth, y)
            this.context.arcTo(x + elementDisplayWidth + topRight, y,
              x + elementDisplayWidth + topRight, y + ellipse / 2,
              ellipse / 2)
            this.context.arcTo(x + elementDisplayWidth + bottomRight, y + ellipse,
              x + elementDisplayWidth, y + ellipse,
              ellipse / 2)
            this.context.lineTo(x - spaceWidth, y + ellipse)
            this.context.lineTo(x, y);
            this.context.fill()
          } else {
            this.context.moveTo(x, y);
            this.context.lineTo(x + elementDisplayWidth, y)
            this.context.lineTo(x + elementDisplayWidth - spaceWidth, y + ellipse)
            this.context.lineTo(x - spaceWidth, y + ellipse)
            this.context.lineTo(x, y);
            this.context.fill()
            x = x + elementDisplayWidth
            x = x + spaceWidth
          }
        }
      }
    }
    { // 绘最底部文字
      let y =
        startY + columnarTopDescDrawHeight + columnarHeight + columnarBottomDescDrawHeight + columnarScaleDrawHeight
      let displayElement: DataHistogramElement[] = this.scaleDesc
      // .filter((element) => (element.value != null && element.value != 0))
      if (displayElement.length > 0) {
        let first = displayElement[0]
        this.context.beginPath()
        this.context.textBaseline = 'middle'
        this.context.textAlign = "left"
        this.context.fillStyle = first.color ?? Color.Gray
        this.context.fillText(first?.desc ?? "", startX, y + columnarScaleDescDrawHeight / 2, canvasWidth)
      }
      if (displayElement.length > 0) {
        let last = displayElement[displayElement.length - 1]
        this.context.beginPath()
        this.context.textBaseline = 'middle'
        this.context.textAlign = "right"
        this.context.direction = 'rtl'
        this.context.fillStyle = last.color ?? Color.Gray
        this.context.fillText(last?.desc ?? "", startX + canvasWidth, y + columnarScaleDescDrawHeight / 2,
          canvasWidth)
      }
      //this.context.fillRect(startX, y, canvasWidth - 10, columnarScaleDescDrawHeight)
    }
  }

  private drawRoundedRect(x: number, y: number, width: number, height: number, radius: DataHistogramRadius): Path2D {
    let path: Path2D = new Path2D()
    let topLeft = (radius.topLeft ?? 0);
    let topRight = (radius.topRight ?? 0);
    let bottomLeft = (radius.bottomLeft ?? 0);
    let bottomRight = (radius.bottomRight ?? 0);
    path.moveTo(x + topLeft, y);
    path.lineTo(x + width - topRight, y);
    path.arcTo(x + width, y
      , x + width, y + height, topRight);
    path.lineTo(x + width, y + height - bottomRight);
    path.arcTo(x + width, y + height,
      x, y + height, bottomRight);
    path.lineTo(x + bottomLeft, y + height);
    path.arcTo(x, y + height, x, y, bottomLeft);
    path.lineTo(x, y + topLeft);
    path.arcTo(x, y, x + topLeft, y, topLeft);
    return path;
  }
}

class DataHistogramRadius {
  topLeft?: number
  topRight?: number
  bottomLeft?: number
  bottomRight?: number
}