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
        })

    }
  }

  @Styles
  normalStyles(): void {
    .backgroundColor("#0A59F7")
    .borderRadius(10)
    .borderStyle(BorderStyle.Solid)
    .borderWidth(2)
    .borderColor("#33000000")
    .width(100)
    .height(25)
    .opacity(1)
  }
}

class MyButtonModifier implements AttributeModifier<ButtonAttribute> {
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