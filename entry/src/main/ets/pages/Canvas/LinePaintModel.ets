export class LinePaintModelParam {
  gradientEffect: boolean = true
}

export class LinePaintModel {
  /// 绘图的参数
  param: LinePaintModelParam = new LinePaintModelParam()
  /// 基准线
  baseLineValue: number | undefined
  /// 数据
  data: number[] = []
  /// 限制展示数据的量
  displayDataCount: number | undefined
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  padding?: Padding

  draw() {
    this.context.reset()
    this.context.lineWidth = 1
    this.context.strokeStyle = Color.Orange

    if (this.data.length == 0) {
      return
    }
    let values = this.data

    let max = Math.max(...this.data)
    let min = Math.min(...this.data)
    if (this.baseLineValue) {
      max = Math.max(max, this.baseLineValue)
      min = Math.min(min, this.baseLineValue)
    }
    if (max == min) {
      max = max * 1.1
      min = min * 0.9
    }

    let displayDataCount = this.displayDataCount ?? this.data.length
    if (displayDataCount == 1) {
      //FIXME: 考虑一个点的时候
      return
    }
    let width = this.context.width
    let height = this.context.height
    if (width == 0 || height == 0) {
      return
    }

    let beginX = 0.0
    let beginY = 0.0
    if (this.padding) {
      if (typeof this.padding.left === 'number') {
        width = width - this.padding.left
        beginX = beginX + this.padding.left
      }
      if (typeof this.padding.right === 'number') {
        width = width - this.padding.right
      }
      if (typeof this.padding.top === 'number') {
        beginY = beginY + this.padding.top
        height = height - this.padding.top
      }
      if (typeof this.padding.bottom === 'number') {
        height = height - this.padding.bottom
      }
    }
    let lineWidth = width / (displayDataCount - 1)

    let hPerValue = height / (max - min);

    let xOffset = beginX
    let yValue = ((max - values[0]) * hPerValue);
    let linePath = new Path2D()
    linePath.moveTo(xOffset, yValue)
    //this.context.createLinearGradient()
    // gradientPath.moveTo(xOffset, yValue);
    //反向更新import { JZColors } from '@jzdy/color'
    // import { MarketConditionsHYZLJM } from './ConditionComponent/MarketConditionHYZLJM'
    // import { MarketConditionsJZRG } from './ConditionComponent/MarketConditionJZRG'
    // import { MarketConditionsTTHG } from './ConditionComponent/MarketConditionTTHG'
    // import { MarketConditionsZDFX } from './ConditionComponent/MarketConditionZDFX'
    // import { MarketConditionsZJLL } from './ConditionComponent/MarketConditionZJLL'
    // import { MarketConditionsZLTC } from './ConditionComponent/MarketConditionZLTC'
    //
    //
    // /**
    //  * 市场行情
    //  */
    // @Component
    // export struct MarketConditions {
    //   @BuilderParam child: () => void
    //   swiperController: SwiperController = new SwiperController()
    //   multitermModels: MultitermModel[] = [
    //     new MultitermModel("经传热股"),
    //     new MultitermModel("天天好股"),
    //     new MultitermModel("最近浏览"),
    //     new MultitermModel("涨跌风向"),
    //     new MultitermModel("主力题材"),
    //     new MultitermModel("行业主力净买"),
    //   ]
    //   multitermComponentController: MultitermComponentController = new MultitermComponentController()
    //   initializeIndex: number = 0;
    //
    //   aboutToAppear(): void {
    //     this.initializeIndex = 5;
    //     if (this.multitermModels.length > this.initializeIndex) {
    //       this.multitermModels[this.initializeIndex].inHighlight = true
    //     }
    //   }
    //
    //   build() {
    //     Column() {
    //       MultitermComponent({
    //         models: this.multitermModels,
    //         controller: this.multitermComponentController,
    //         onTap: (element, index) => {
    //           this.swiperController.changeIndex(index)
    //         },
    //       }).height(44)
    //       Swiper(
    //         this.swiperController,
    //       ) {
    //         ForEach(this.multitermModels, (element: MultitermModel, index) => {
    //           if (element.content == "经传热股") {
    //             MarketConditionsJZRG().width('100%').height('100%')
    //           } else if (element.content == "天天好股") {
    //             MarketConditionsTTHG().width('100%').height('100%')
    //           } else if (element.content == "最近浏览") {
    //             MarketConditionsZJLL().width('100%').height('100%')
    //           } else if (element.content == "涨跌风向") {
    //             MarketConditionsZDFX().width('100%').height('100%')
    //           } else if (element.content == "主力题材") {
    //             MarketConditionsZLTC().width('100%').height('100%')
    //           } else if (element.content == "行业主力净买") {
    //             MarketConditionsHYZLJM().width('100%').height('100%')
    //           }
    //         })
    //       }
    //       .loop(true)
    //       .autoPlay(false)
    //       .width('100%')
    //       .borderRadius(4)
    //       .onChange((index) => {
    //         this.multitermComponentController.scrollTo(index)
    //       })
    //       .layoutWeight(1)
    //       .index(this.initializeIndex)
    //     }
    //     .padding({
    //       left: 16,
    //       right: 16,
    //       top: 0,
    //       bottom: 0
    //     })
    //     .height(44 + 72 + 4 + 72)
    //     .backgroundColor(JZColors.JZB4)
    //   }
    // }
    //
    // @Observed
    // class MultitermModel {
    //   color: Resource
    //   highlightColor: Resource
    //   content: string | Resource
    //   inHighlight: boolean
    //   tapEnable?: (model: MultitermModel, index: number) => boolean
    //
    //   constructor(content: string | Resource,
    //     inHighlight: boolean = false,
    //     tapEnable?: (model: MultitermModel) => boolean,
    //     color: Resource = JZColors.JZFontGY3,
    //     highlightColor: Resource = JZColors.JZPrimary,
    //   ) {
    //     this.content = content
    //     this.tapEnable = tapEnable
    //     this.inHighlight = inHighlight
    //     this.color = color
    //     this.highlightColor = highlightColor
    //   }
    //
    //   displayColor(): Resource {
    //     return this.inHighlight ? this.highlightColor : this.color
    //   }
    // }
    //
    // @Component
    // struct MultitermItem {
    //   @ObjectLink model: MultitermModel
    //
    //   build() {
    //     Text(this.model.content)
    //       .foregroundColor(this.model.displayColor())
    //       .padding({
    //         left: 8,
    //         right: 8,
    //         top: 3,
    //         bottom: 3
    //       })
    //       .borderWidth(1)
    //       .borderColor(this.model.displayColor())
    //       .borderRadius(2)
    //   }
    // }
    //
    // class MultitermComponentController {
    //   scrollTo(index: number) {
    //     if (this.scrollToP) {
    //       this.scrollToP(index);
    //     }
    //   }
    //
    //   scrollToP?: ((index: number) => void)
    // }
    //
    // @Component
    // struct MultitermComponent {
    //   static height: number = 28
    //   @Require @State @Watch("didChange") models: MultitermModel[] = [];
    //   onTap?: (model: MultitermModel, index: number) => void
    //   controller?: MultitermComponentController
    //   private scroller: Scroller = new Scroller()
    //
    //   aboutToAppear(): void {
    //     if (this.controller) {
    //       this.controller.scrollToP = (index: number) => {
    //         if (this.models.length > index) {
    //           this._onTap(this.models[index], index);
    //         } else {
    //
    //         }
    //       }
    //     }
    //   }
    //
    //   aboutToDisappear(): void {
    //
    //   }
    //
    //   didChange() {
    //     console.log("MultitermComponent models didChange")
    //   }
    //
    //   private _onTap(model: MultitermModel, index: number) {
    //     this.models.forEach((element) => {
    //       if (element.inHighlight) {
    //         element.inHighlight = false
    //       }
    //     })
    //     model.inHighlight = !model.inHighlight
    //
    //     {
    //       //FIXME: 检查当前的选项是否可见，如果不可见，则滑动到可见为止
    //       //this.scroller.scrollTo({xOffset: 100, yOffset: 0})
    //     }
    //   }
    //
    //   build() {
    //     Scroll(this.scroller) {
    //       Row() {
    //         ForEach(this.models, (model: MultitermModel, index) => {
    //           MultitermItem({
    //             model: model
    //           }).onClick(() => {
    //             if (model.tapEnable) {
    //               if (!model.tapEnable(model, index)) {
    //                 console.log(`MultitermComponent  不可点击 ${model}`)
    //                 return;
    //               }
    //             }
    //             if (this.onTap) {
    //               this.onTap(model, index)
    //             }
    //           }).height('100%')
    //           if (index != (this.models.length - 1)) {
    //             Blank("12")
    //           }
    //         })
    //       }.height(MultitermComponent.height)
    //     }.scrollable(ScrollDirection.Horizontal).scrollBar(BarState.Off)
    //   }
    // }
    values.forEach((element) => {
      let yOffset = beginY + (max - element) * hPerValue
      linePath.lineTo(xOffset, yOffset);
      // gradientPath.lineTo(xOffset, yOffset);
      xOffset = xOffset + lineWidth;
    })
    if (this.param.gradientEffect) {
      linePath.lineTo(xOffset, beginY + height)
      linePath.lineTo(beginX, beginY + height)
      linePath.closePath()
      let grad = this.context.createLinearGradient(beginX + width / 2, beginY + 0, width / 2, height)
      grad.addColorStop(0, '#ff0000')
      grad.addColorStop(1, '#ff0000') // 换配色
      this.context.fillStyle = grad
      this.context.fill(linePath)
    }

    if (this.baseLineValue != null) {
      let y = (max - this.baseLineValue) * hPerValue
      // 绘制一条横向虚线
      // drawDashedLine(canvas: canvas, linePaint: param.dashedPaint, paintAt: Offset(0, y), width: size.width, dashed: param.dashed, gap: param.dashedGap);
    }

    //FIXME:
    this.context.stroke(linePath)
  }
}