@Entry({ routeName: "Animation" })
@Component
struct Animation {
  componentName = "Animation"

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

  @State isAnimation: boolean = false;
  @State translateX1: number = -100;
  @State translateX2: number = -100;
  @State translateX3: number = -100;

  build() {

    Column() {
      // 设置动画部分 ---
      Row() {
        Text('30')
          .fontWeight(FontWeight.Bold)
          .fontSize(16)
          .fontColor(Color.White)
          .textAlign(TextAlign.Center)
          .borderRadius(10)
          .backgroundColor(0xF56C6C)
          .width(80)
          .height(80)
          .translate({ x: this.translateX1 })
      }
      .height('20%')

      Row() {
        Text('60')
          .fontWeight(FontWeight.Bold)
          .fontSize(16)
          .fontColor(Color.White)
          .textAlign(TextAlign.Center)
          .borderRadius(10)
          .backgroundColor(0x008B8B)
          .width(80)
          .height(80)
          .translate({ x: this.translateX3 })
          .animation({
            duration: 3000,
            iterations: 1,
            playMode: PlayMode.Normal,
            // expectedFrameRateRange: {
            //   // 设置属性动画的帧率范围
            //   expected: 60, // 设置动画的期望帧率为60hz
            //   min: 0, // 设置帧率范围
            //   max: 120, // 设置帧率范围
            // },
          })
      }
      .height('20%')

      Row() {
        Button('Start')
          .id('PropertyAnimationStart')
          .fontSize(14)
          .fontWeight(500)
          .margin({ bottom: 10, left: 5 })
          .fontColor(Color.White)
          .onClick(() => {

            this.isAnimation = !this.isAnimation;
            this.translateX3 = this.isAnimation ? 100 : -100;

            animateTo({
              duration: 3000,
              iterations: 1,
              playMode: PlayMode.Normal,
              expectedFrameRateRange: {
                // 设置显式动画的帧率范围
                expected: 30, // 设置动画的期望帧率为30hz
                min: 0, // 设置帧率范围
                max: 120, // 设置帧率范围
              },
            }, () => {
              this.translateX1 = this.isAnimation ? 100 : -100;
            })
          })
          .width('40%')
          .height(40)
          .shadow(ShadowStyle.OUTER_DEFAULT_LG)
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .shadow(ShadowStyle.OUTER_DEFAULT_SM)
      .alignItems(VerticalAlign.Bottom)
      .layoutWeight(1)
    }
    .width('100%')
    .justifyContent(FlexAlign.Center)
    .shadow(ShadowStyle.OUTER_DEFAULT_SM)
    .layoutWeight(1)
  }
}