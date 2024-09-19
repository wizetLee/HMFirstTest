import { SwiperContent } from './SwiperContent';

@Entry({ routeName: "Swiper" })
@Component
struct SwiperPage {
  componentName = "SwiperPage"

  //Entry 生命周期
  onPageShow(): void {
    console.log(`${this.componentName} - onPageShow`)
  }

  onPageHide(): void {
    console.log(`${this.componentName} - onPageHide`)
  }

  //Component 生命周期
  aboutToAppear(): void {
    console.log(`${this.componentName} - aboutToAppear`)
  }

  aboutToDisappear(): void {
    console.log(`${this.componentName} - aboutToDisappear`)
  }

  // aboutToReuse(params: { [key: string]: Any }): void {
  // }
  aboutToRecycle(): void {
    console.log(`${this.componentName} - aboutToRecycle`)
  }

  build() {
    Column() {
      MarketConditions().width(`100%`).height(`30%`)
    }
  }
}

/**
 * 市场行情
 */
@Component
export struct MarketConditions {
  @State index: number = 5;
  @BuilderParam child: () => void
  swiperController: SwiperController = new SwiperController()
  multitermModels: MultitermModel[] = [
    new MultitermModel("经传热股"),
    new MultitermModel("天天好股"),
    new MultitermModel("最近浏览"),
    new MultitermModel("涨跌风向"),
    new MultitermModel("主力题材"),
    new MultitermModel("行业主力净买"),
  ]
  multitermComponentController: MultitermComponentController = new MultitermComponentController()
  initializeIndex: number = 0;

  aboutToAppear(): void {
    this.initializeIndex = this.index;
    if (this.multitermModels.length > this.initializeIndex) {
      this.multitermModels[this.initializeIndex].inHighlight = true
    }
  }

  build() {
    Column() {
      Blank().layoutWeight(1)
      MultitermComponent({
        models: this.multitermModels,
        controller: this.multitermComponentController,
        onTap: (element, index) => {
          this.swiperController.changeIndex(index)
        },
      }).height(44)
      Swiper(
        this.swiperController,
      ) {
        ForEach(this.multitermModels, (element: MultitermModel, index) => {
          if (element.content == "经传热股") {
            SwiperContent({ pageIndex: index, index: this.index }).width('100%').height('100%')
          } else if (element.content == "天天好股") {
            SwiperContent({ pageIndex: index, index: this.index }).width('100%').height('100%')
          } else if (element.content == "最近浏览") {
            SwiperContent({ pageIndex: index, index: this.index }).width('100%').height('100%')
          } else if (element.content == "涨跌风向") {
            SwiperContent({ pageIndex: index, index: this.index }).width('100%').height('100%')
          } else if (element.content == "主力题材") {
            SwiperContent({ pageIndex: index, index: this.index }).width('100%').height('100%')
          } else if (element.content == "行业主力净买") {
            SwiperContent({ pageIndex: index, index: this.index }).width('100%').height('100%')
          }
        })
      }
      .loop(true)
      .autoPlay(false)
      .width('100%')
      .height(110)
      .borderRadius(4)
      .onChange((index) => {
        this.index = index;
        this.multitermComponentController.scrollTo(index)
      })
      .index(this.initializeIndex)
    }
    .padding({
      left: 16,
      right: 16,
      top: 0,
      bottom: 0
    })
    .height(44 + 72 + 4 + 72)
    .backgroundColor(Color.White).justifyContent(FlexAlign.Center)
  }
}

@Observed
class MultitermModel {
  // color: Resource
  // highlightColor: Resource
  content: string | Resource
  inHighlight: boolean
  tapEnable?: (model: MultitermModel, index: number) => boolean

  constructor(content: string | Resource,
    inHighlight: boolean = false,
    tapEnable?: (model: MultitermModel) => boolean,
    // color: Resource = Color.White,
    // highlightColor: Resource = JZColors.JZPrimary,
  ) {
    this.content = content
    this.tapEnable = tapEnable
    this.inHighlight = inHighlight
    // this.color = color
    // this.highlightColor = highlightColor
  }

  // displayColor(): Resource {
  //   return this.inHighlight ? this.highlightColor : this.color
  // }
}

@Component
struct MultitermItem {
  @ObjectLink model: MultitermModel

  build() {
    Text(this.model.content)// .foregroundColor(this.model.displayColor())
      .padding({
        left: 8,
        right: 8,
        top: 3,
        bottom: 3
      })
      .borderWidth(1)// .borderColor(this.model.displayColor())
      .borderRadius(2)
  }
}

class MultitermComponentController {
  scrollTo(index: number) {
    if (this.scrollToP) {
      this.scrollToP(index);
    }
  }

  scrollToP?: ((index: number) => void)
}

@Component
struct MultitermComponent {
  static height: number = 28
  @Require @State @Watch("didChange") models: MultitermModel[] = [];
  onTap?: (model: MultitermModel, index: number) => void
  controller?: MultitermComponentController
  private scroller: Scroller = new Scroller()

  aboutToAppear(): void {
    if (this.controller) {
      this.controller.scrollToP = (index: number) => {
        if (this.models.length > index) {
          this._onTap(this.models[index], index);
        } else {

        }
      }
    }
  }

  aboutToDisappear(): void {

  }

  didChange() {
    console.log("MultitermComponent models didChange")
  }

  private _onTap(model: MultitermModel, index: number) {
    this.models.forEach((element) => {
      if (element.inHighlight) {
        element.inHighlight = false
      }
    })
    model.inHighlight = !model.inHighlight

    {
      //FIXME: 检查当前的选项是否可见，如果不可见，则滑动到可见为止
      //this.scroller.scrollTo({xOffset: 100, yOffset: 0})
    }
  }

  build() {
    Scroll(this.scroller) {
      Row() {
        ForEach(this.models, (model: MultitermModel, index) => {
          MultitermItem({
            model: model
          }).onClick(() => {
            if (model.tapEnable) {
              if (!model.tapEnable(model, index)) {
                console.log(`MultitermComponent  不可点击 ${model}`)
                return;
              }
            }
            if (this.onTap) {
              this.onTap(model, index)
            }
          }).height('100%')
          if (index != (this.models.length - 1)) {
            Blank("12")
          }
        })
      }.height(MultitermComponent.height)
    }.scrollable(ScrollDirection.Horizontal).scrollBar(BarState.Off)
  }
}
