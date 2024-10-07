import { SymbolGlyphModifier } from '@kit.ArkUI'

@Entry({ routeName: "PopUpWindow" })
@Component
struct PopUpWindow {
  componentName = "PopUpWindow"

  //Entry 生命周期
  onPageShow(): void {
    console.log(`${this.componentName} - onPageShow`)
  }

  onPageHide(): void {
    console.log(`${this.componentName} - onPageHide`)
  }

  //Component 生命周期
  aboutToAppear(): void {
    let mi: MyInterface = {
      name: "",
      age: 10,
    }
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

  @State showBindPopUp: boolean = false;

  build() {
    Column() {
      this.popUpView()
      this.menu()
      this.menu2()
    }
  }

  @Builder
  MenuBuilder() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      Text('Test menu item 1')
        .fontSize(20)
        .width(100)
        .height(50)
        .textAlign(TextAlign.Center)
      Divider().height(10)
      Text('Test menu item 2')
        .fontSize(20)
        .width(100)
        .height(50)
        .textAlign(TextAlign.Center)
    }.width(100)
  }

  /// 自定义菜单
  @Builder
  menu2() {
    RelativeContainer() {
    }
    .width(100)
    .height(100)
    .backgroundColor(Color.Orange)
    .bindMenu(this.MenuBuilder)
    .bindContextMenu(this.contextMenuBuilder,
      ResponseType.LongPress,
      {
        preview: this.MyPreview,              //WARNING: 效果有点卡顿
        // preview: MenuPreviewMode.IMAGE,
        previewAnimationOptions:
        {
          scale: [0.8, 1.0],
          hoverScale: [1.0, 0.95], // 一镜到底的效果，设置后卡顿的问题好转
        },

      }
    )
  }

  @Builder
  MyPreview() {
    Column() {
      // Image($r('app.media.saber'))
      //   .width(200)
      //   .height(200)
      RelativeContainer()
        .width(200)
        .height(200)
        .backgroundColor(Color.Orange)
    }
  }

  @Builder contextMenuBuilder() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text('Options')
      Divider().strokeWidth(2).margin(5).color('#F0F0F0')
      Text('Hide')
      Divider().strokeWidth(2).margin(5).color('#F0F0F0')
      Text('Exit')
    }
    .width(200)
  }

  @Builder
  menu() {
    RelativeContainer() {
      
    }
    .width(100)
    .height(100)
    .backgroundColor(Color.Orange)
    .bindMenu(
      [
        {
          value: "menu element 1",
          // icon: // 菜单标题图标

          enabled: true,
          action: () => {
            console.log(`menu element action`)
          },
          symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_photo')).fontSize('24vp'), // 设置菜单项图标
        }
      ],
      {
        title: "menu title",
        showInSubWindow: undefined,
        aboutToAppear: () => {

        },
        aboutToDisappear: () => {

        },
        onAppear: () => {
          console.log(`onAppear`)
        },
        onDisappear: () => {
          console.log(`onDisappear`)
        },
        // transition
        // offset
        // placement
        enableArrow: true,
        //FIXME: 如何处理
        // preview:
        // previewAnimationOptions:

        backgroundColor: Color.Yellow,
        borderRadius: 1,
      }

    )
  }

  @Builder
  popUpView() {
    RelativeContainer() {

    }
    .width(100)
    .height(100)
    .backgroundColor(Color.Orange)
    .bindPopup(
      this.showBindPopUp // popup弹窗必须等待页面全部构建完成才能展示，因此show不能在页面构建中设置为true，否则会导致popup弹窗显示位置及形状错误。
      ,
      {
        message: "啊🤔",
        messageOptions: {
          textColor: Color.Orange,
          font: {
            size: '14vp',
            style: FontStyle.Italic,
            weight: FontWeight.Bolder
          }
        },
        // placement: Placement.Top,
        primaryButton: {
          value: "primaryButton value",
          action: () => {
            console.log(`primaryButton action`)
            // this.showBindPopUp = false;
          }
        },
        secondaryButton: {
          value: "secondaryButton value",
          action: () => {
            console.log(`secondaryButton action`)
          }
        },
        // arrowOffset: 100, // 箭头的偏移量
        // targetSpace: 100,
        // offset: {
        //   x: 100,
        //   y: 100,
        // },
        popupColor: Color.Pink,
        // autoCancel: false,
        // width: 200, // 弹窗宽度
        // showInSubWindow: true,
        // arrowHeight: 50,
        // arrowWidth
        radius: 0,
        arrowPointPosition: ArrowPointPosition.CENTER,
        //backgroundBlurStyle: BlurStyle.Thin,
        //transition: new TransitionEffect( // 自定义设置popup弹窗显示和退出的动画效果。 FIXME: 还不会

        transition: TransitionEffect.asymmetric(
          TransitionEffect.OPACITY.animation({ duration: 1000, curve: Curve.Ease }).combine(
            TransitionEffect.translate({ x: 50, y: 50 })),
          TransitionEffect.IDENTITY),
        onStateChange: (event) => {
          console.log(`pop up state change ${event.isVisible}`)
          if (event.isVisible) {
            this.showBindPopUp = false;
          }
        },
        onWillDismiss:
        (dismissPopupAction) => {
          let reaseon = dismissPopupAction.reason.toString() // 1 : TOUCH_OUTSIDE
          dismissPopupAction.dismiss();
          return true
        }
      } // 配置弹出弹窗的参数
      ,
    )
    .onClick(() => {
      this.showBindPopUp = true;
    })
  }
}


interface MyInterface {

  offset?: Position;
  name: string,
  age: number,
}