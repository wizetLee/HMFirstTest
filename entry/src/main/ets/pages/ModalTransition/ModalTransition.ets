// import { curves } from '@kit.ArkUI'
import { LengthMetrics } from '@kit.ArkUI';

//
// @Entry({ routeName: "ModalTransitionPage" })
// @Component
// struct ModalTransitionPage {
//   componentName = "ModalTransitionPage"
//
//   //Entry 生命周期
//   onPageShow(): void {
//     console.log(`${this.componentName} - onPageShow`)
//   }
//
//   onPageHide(): void {
//     console.log(`${this.componentName} - onPageHide`)
//   }
//
//   //Component 生命周期
//   aboutToAppear(): void {
//     console.log(`${this.componentName} - aboutToAppear`)
//   }
//
//   aboutToDisappear(): void {
//     console.log(`${this.componentName} - aboutToDisappear`)
//   }
//
//   // aboutToReuse(params: { [key: string]: Any }): void {
//   // }
//
//   aboutToRecycle(): void {
//     console.log(`${this.componentName} - aboutToRecycle`)
//   }
//
//   @State @Watch("isShow1Change") isShow: boolean = false
//   @State @Watch("isShow2Change") isShow2: boolean = false
//   @State isScale1: number = 1;
//   @State isScale2: number = 1;
//
//   isShow1Change() {
//     this.isShow ? this.isScale1 = 0.95 : this.isScale1 = 1
//   }
//
//   isShow2Change() {
//     this.isShow2 ? this.isScale2 = 0.95 : this.isScale2 = 1
//   }
//
//   @Builder
//   myBuilder2() {
//     Column() {
//       Button("close modal 2")
//         .margin(10)
//         .fontSize(20)
//         .onClick(() => {
//           this.isShow2 = false;
//         })
//     }
//     .width('100%')
//     .height('100%')
//   }
//
//   @Builder
//   myBuilder() {
//     Column() {
//       Button("transition modal 2")
//         .margin(10)
//         .fontSize(20)
//         .onClick(() => {
//           this.isShow2 = true;
//         }).bindContentCover(this.isShow2, this.myBuilder2(), {
//         modalTransition: ModalTransition.NONE,
//         // transition
//         backgroundColor: Color.Orange,
//         onWillAppear: () => {
//           console.log("BindContentCover onWillAppear.")
//         },
//         onAppear: () => {
//           console.log("BindContentCover onAppear.")
//         },
//         onWillDisappear: () => {
//           console.log("BindContentCover onWillDisappear.")
//         },
//         onDisappear: () => {
//           console.log("BindContentCover onDisappear.")
//         }
//       })
//
//       Button("close modal 1")
//         .margin(10)
//         .fontSize(20)
//         .onClick(() => {
//           this.isShow = false;
//         })
//     }
//     .width('100%')
//     .height('100%')
//     .justifyContent(FlexAlign.Center)
//     .scale({ x: this.isScale2, y: this.isScale2 })
//     .animation({ curve: curves.springMotion() })
//   }
//
//   build() {
//     Column() {
//       Button("transition modal 1")
//         .onClick(() => {
//           this.isShow = true
//         })
//         .fontSize(20)
//         .margin(10)
//         .bindContentCover(this.isShow, this.myBuilder(), {
//           modalTransition: ModalTransition.DEFAULT,
//           backgroundColor: Color.Pink,
//           onWillAppear: () => {
//             console.log("BindContentCover onWillAppear.")
//           },
//           onAppear: () => {
//             console.log("BindContentCover onAppear.")
//           },
//           onWillDisappear: () => {
//             console.log("BindContentCover onWillDisappear.")
//           },
//           onDisappear: () => {
//             console.log("BindContentCover onDisappear.")
//           }
//         })
//     }
//     .justifyContent(FlexAlign.Center)
//     .backgroundColor("#ff49c8ab")
//     .width('100%')
//     .height('100%')
//     .scale({ x: this.isScale1, y: this.isScale1 })
//     .animation({ curve: curves.springMotion() })
//   }
// }



// xxx.ets
@Entry
@Component
struct SheetTransitionExample {
  @State isShow:boolean = false
  @State sheetHeight:number = 300;

  aboutToAppear(): void {
    // 代码关闭弹窗
    // setTimeout(() => {
    //   this.isShow = false;
    // }, 5000)
  }

  @Builder myBuilder() {
    Column() {
      Button("change height")
        .margin(10)
        .fontSize(20)
        .onClick(()=>{
          this.sheetHeight = 500;
        })

      Button("Set Illegal height")
        .margin(10)
        .fontSize(20)
        .onClick(()=>{
          this.sheetHeight = -1;
        })

      Button("close modal 1")
        .margin(10)
        .fontSize(20)
        .onClick(()=>{
          this.isShow = false;
        })
    }
    .width('100%')
    .height('100%')
  }

  build() {
    Column() {
      Button("transition modal 1")
        .onClick(() => {
          this.isShow = true
        })
        .fontSize(20)
        .margin(10)
        .bindSheet($$this.isShow, this.myBuilder(), {
          // height: this.sheetHeight,
          detents: [200, SheetSize.MEDIUM, SheetSize.LARGE, ],
          // scrollSizeMode: ScrollSizeMode.CONTINUOUS,
          // scrollSizeMode: ScrollSizeMode.FOLLOW_DETENT,
          // mode: SheetMode.OVERLAY,
          // title: {
          //   title: "sheet title",
          //   subtitle: "sheet subtitle"
          // },
          showClose: true,
          dragBar: true,
          // preferType: SheetType.BOTTOM,
          // blurStyle: BlurStyle.Regular,
          // maskColor: Color.Orange,
          enableOutsideInteractive: false,
          // backgroundColor: Color.Green,
          // onWillAppear: () => {console.log("BindSheet onWillAppear.")},
          // onAppear: () => {console.log("BindSheet onAppear.")},
          // onWillDisappear: () => {console.log("BindSheet onWillDisappear.")},
          // onDisappear: () => {console.log("BindSheet onDisappear.")},
          // onHeightDidChange: (height) => {
          //   console.log(`height did change ${height}`)
          // },
          // borderWidth: 10,
          // borderColor: Color.Yellow,
          borderStyle: {top: BorderStyle.Dashed, left: BorderStyle.Dotted, right: BorderStyle.Solid},
          borderWidth: { top: LengthMetrics.vp(10), start: LengthMetrics.vp(10), end: LengthMetrics.vp(20) },
          borderColor: { top: Color.Pink, start: Color.Blue, end: Color.Yellow },
          width: "80%",
          shouldDismiss: (sheetDismiss) => {
            // 当用户执行下拉关闭/back事件/点击蒙层关闭/关闭按钮关闭交互操作时
            // 自己判断什么情况下关闭

            // sheetDismiss.dismiss();
          },
          onWillSpringBackWhenDismiss: ((SpringBackAction: SpringBackAction) => {
            //没有注册springBack, 下拉半模态页面无回弹行为
            SpringBackAction.springBack()
          }),
        })
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}