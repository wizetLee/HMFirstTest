@Entry({ routeName: "ComponmentPage" })
@Component
struct ComponmentPage {
  componentName = "ComponmentPage"

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

  @State switch: boolean = true;
  @State private type: string = "type1"
  @State modifier: MyButtonModifier = new MyButtonModifier()

  build() {
    Scroll() {
      Column() {
        RelativeContainer()
          .width(100)
          .height(100)
          .backgroundColor(Color.Orange)
          .id("id_001")// 组件的唯一标识，唯一性由使用者保证。
          .reuseId("reuseID_001") // 复用标识，用于划分自定义组件的复用组。
        RelativeContainer()
          .width(100)
          .height(100)
          .backgroundColor(Color.Yellow)
          .onClick(() => {

          })

        Button("ChangeType")
          .onClick(() => {
            this.type = this.type + "_"
          })
        Button("Switch")
          .onClick(() => {
            this.switch = !this.switch
          })
        if (this.switch) {
          ReusableChildComponent({ type: this.type })
            .reuseId(this.type)
        }

        //FIXME:
        RelativeContainer()
          .width(100)
          .height(100)
          .backgroundColor(Color.Green)
          .attributeModifier({
            // applyNormalAttribute()

          })
          .stateStyles({
            normal: this.normalStyles
          })
          .foregroundColor(ColoringStrategy.INVERT)


        Button("Button")
          .attributeModifier(this.modifier)
          .onClick(() => {
            this.modifier.isDark = !this.modifier.isDark
          })// 更改组件的响应范围
          .responseRegion({
            x: 0, y: 50,
            // width: `100%`,
            // height: `100%`,
          })
        // .hitTestBehavior(HitTestMode.Default)
        // .hitTestBehavior(HitTestMode.Transparent)
        // .hitTestBehavior(HitTestMode.Block)


        // RelativeContainer() {
        //   RelativeContainer()
        //     .width(20)
        //     .height(20)
        //     .backgroundColor(Color.Orange)
        //   RelativeContainer()
        //     .width(20)
        //     .height(20)
        //     .backgroundColor(Color.Yellow)
        // }
        // .width(100)
        // .height(300)
        // .backgroundColor(Color.Pink)
        // //RelativeContainer容器内的辅助线。
        // .guideLine([
        //   {
        //     id: "",
        //     direction: Axis.Vertical,
        //     position: {
        //       start: undefined,
        //       end: undefined,
        //     }
        //   }
        // ])
        // //RelativeContainer容器内的屏障。
        // .barrier([])

        Row() {
          RelativeContainer() {
            Row() {
              Text('row1')
            }
            .justifyContent(FlexAlign.Center)
            .width(100)
            .height(100)
            .backgroundColor("#FF3333")
            .alignRules({
              top: { anchor: "__container__", align: VerticalAlign.Top },
              left: { anchor: "__container__", align: HorizontalAlign.Start },
            })
            .margin({
              left: 10,
              top: 5,
              right: 10,
              bottom: 5,
            })
            .id("row1")

            Row() {
              Text('row2')
            }
            .justifyContent(FlexAlign.Center)
            .width(100)
            .height(100)
            .backgroundColor("#FFCC00")
            .alignRules({
              // top: { anchor: "__container__", align: VerticalAlign.Top },
              top: { anchor: "row1", align: VerticalAlign.Top },
              right: { anchor: "__container__", align: HorizontalAlign.End }
            })
            .id("row2")

            Row() {
              Text('row3')
            }
            .justifyContent(FlexAlign.Center)
            .height(100)
            .backgroundColor("#FF6633")
            .alignRules({
              top: { anchor: "row1", align: VerticalAlign.Bottom },
              left: { anchor: "row1", align: HorizontalAlign.End },
              right: { anchor: "row2", align: HorizontalAlign.Start },
            })
            .id("row3")

            Row() {
              Text('row4')
            }.justifyContent(FlexAlign.Center)
            .backgroundColor("#FF9966")
            .alignRules({
              top: { anchor: "row3", align: VerticalAlign.Bottom },
              bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
              left: { anchor: "__container__", align: HorizontalAlign.Start },
              right: { anchor: "row1", align: HorizontalAlign.End }
            })
            .id("row4")

            Row() {
              Text('row5')
            }.justifyContent(FlexAlign.Center)
            .backgroundColor("#FF66FF")
            .alignRules({
              top: { anchor: "row3", align: VerticalAlign.Bottom },
              bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
              left: { anchor: "row2", align: HorizontalAlign.Start },
              right: { anchor: "__container__", align: HorizontalAlign.End }
            })
            .id("row5")
          }
          .width(300).height(300)
          .margin({ left: 50 })
          .border({ width: 2, color: "#6699FF" })
        }


        RelativeContainer() {
          Row()
            .width(100)
            .height(100)
            .backgroundColor("#FF3333")
            .alignRules({
              top: { anchor: "__container__", align: VerticalAlign.Top },
              bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
              left: { anchor: "__container__", align: HorizontalAlign.Start },
              right: { anchor: "__container__", align: HorizontalAlign.End },
              bias: {
                vertical: 0.33,
                horizontal: 0.5,
              },
            })
            .id("row1")
        }
        .width(300).height(300)
        .margin({ left: 50 })
        .border({ width: 2, color: "#6699FF" })


        RelativeContainer() {
          Row(){Text('row1')}.justifyContent(FlexAlign.Center)
          .width(100).height(100)
          .backgroundColor("#FF3333")
          .id("row1")

          Row(){Text('row2')}.justifyContent(FlexAlign.Center)
          .width(100).height(100)
          .backgroundColor("#FFCC00")
          .alignRules({
            middle: {anchor: "row1", align: HorizontalAlign.End},
            top: {anchor: "row1", align: VerticalAlign.Bottom}
          })
          .id("row2")

          Row(){Text('row3')}.justifyContent(FlexAlign.Center)
          .width(100).height(100)
          .backgroundColor("#FF6633")
          .alignRules({
            left: {anchor: "barrier1", align: HorizontalAlign.End},
            top: {anchor: "row1", align: VerticalAlign.Top}
          })
          .id("row3")

          Row(){Text('row4')}.justifyContent(FlexAlign.Center)
          .width(50).height(50)
          .backgroundColor("#FF9966")
          .alignRules({
            left: {anchor: "row1", align: HorizontalAlign.Start},
            top: {anchor: "barrier2", align: VerticalAlign.Bottom}
          })
          .id("row4")
        }
        .width(300).height(300)
        .margin({left: 50})
        .border({width:2, color: "#6699FF"})
        .barrier([{id: "barrier1", direction: BarrierDirection.RIGHT, referencedId:["row1", "row2"]},
          {id: "barrier2", direction: BarrierDirection.BOTTOM, referencedId:["row1", "row2"]}])
      }
    }
  }

  @
  Styles
  normalStyles():
    void {
    .backgroundColor
    (
      "#0A59F7"
    )
    .borderRadius
    (
      10
    )
    .borderStyle
    (
      BorderStyle
        .Solid
    )
    .borderWidth
    (
      2
    )
    .borderColor
    (
      "#33000000"
    )
    .width
    (
      100
    )
    .height
    (
      25
    )
    .opacity
    (
      1
    )
  }
}

class MyButtonModifier
implements AttributeModifier
<ButtonAttribute> {
  isDark: boolean = false

  applyNormalAttribute(instance: ButtonAttribute): void {
    if (this.isDark) {
      instance.backgroundColor(Color.Black)
    } else {
      instance.backgroundColor(Color.Red)
    }
  }
}

@Reusable
@Component
struct ReusableChildComponent {
  @State type: string = ''

  aboutToAppear() {
    console.log(`ReusableChildComponent Appear ${this.type}`)
  }

  aboutToReuse(params: ESObject) {
    console.log(`ReusableChildComponent Reuse ${this.type}`)
    this.type = params.type;
  }

  build() {
    Row() {
      Text(this.type)
        .fontSize(20)
        .margin({ left: 10 })
    }.margin({ left: 10, right: 10 })
  }
}