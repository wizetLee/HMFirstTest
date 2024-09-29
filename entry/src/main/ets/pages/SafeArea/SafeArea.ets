import { WindowManager } from '@kit.SpeechKit'
import { KeyboardAvoidMode } from '@kit.ArkUI'

@Entry({ routeName: "SafeAreaPage" })
@Component
struct SafeAreapage {
  componentName = "SafeAreaPage"

  //Entry 生命周期
  onPageShow(): void {
    console.log(`${this.componentName} - onPageShow`)
  }

  onPageHide(): void {
    console.log(`${this.componentName} - onPageHide`)
  }

  oldKbam?: KeyboardAvoidMode

  //Component 生命周期
  aboutToAppear(): void {
    console.log(`${this.componentName} - aboutToAppear`)


    let keyboardAvoidMode = this.getUIContext().getKeyboardAvoidMode();
    this.oldKbam = keyboardAvoidMode;
    // 设置虚拟键盘抬起时压缩页面大小为减去键盘的高度
    // this.getUIContext().setKeyboardAvoidMode(KeyboardAvoidMode.RESIZE);
    // 设置虚拟键盘抬起时把页面上抬直到露出光标, 建议使用这个模式，不影响别的组件的UI变动
    this.getUIContext().setKeyboardAvoidMode(KeyboardAvoidMode.OFFSET);

  }

  aboutToDisappear(): void {
    console.log(`${this.componentName} - aboutToDisappear`)
    if (this.oldKbam) {
      this.getUIContext().setKeyboardAvoidMode(this.oldKbam);
    }
  }

  // aboutToReuse(params: { [key: string]: Any }): void {
  // }

  aboutToRecycle(): void {
    console.log(`${this.componentName} - aboutToRecycle`)
  }

  @State text: string = ''
  controller: TextInputController = new TextInputController()


  @State width1: number = 100;
  @State height1: number = 30;

  flag: boolean = true;
  build() {
    Column() {
      this.safeAreaTest()
      // this.keyboardTest()
    }
  }

  @Builder
  safeAreaTest() {
    Row() {
      Stack() {
        Column()
          .height('100%')
          .width('100%')
          .backgroundImage($r('app.media.background'))
          .backgroundImageSize(ImageSize.Cover)
          .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])

        Column() {
          Button('Set caretPosition 1')
            .onClick(() => {
              this.controller.caretPosition(1)
            })
          TextInput({ text: this.text, placeholder: 'input your word...', controller: this.controller })
            .placeholderFont({ size: 14, weight: 400 })
            .width(320)
            .height(40)
            .offset({ y: 120 })
            .fontSize(14)
            .fontColor(Color.Black)
            .backgroundColor(Color.White)
          RelativeContainer()
            .width(120)
            .height(120)
            .backgroundColor(Color.Green)
        }
        .width('100%')
        .alignItems(HorizontalAlign.Center)
        .backgroundColor(Color.Orange)
      }
    }.height('100%')
  }

  @Builder
  keyboardTest() {
    Column() {
      Row().height("80%").width("100%").backgroundColor(Color.Gray)
      TextArea().width("100%").borderWidth(1)
      Text("I can see the bottom of the page")
        .width("100%")
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.Pink)
        .layoutWeight(1)
        .onAreaChange((oldSize, newSize) => {
          //尺寸变动
          console.log(`onAreaChange = ${newSize.width} ${newSize.height}`)
        })
    }.width('100%').height("100%")
  }
}