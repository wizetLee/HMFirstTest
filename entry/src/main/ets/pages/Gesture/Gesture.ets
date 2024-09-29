import { LengthMetrics, LengthMetricsUnit } from '@kit.ArkUI'

@Component
@Entry({ routeName: "GesturePage" })
struct GesturePage {
  componentName = "GesturePage"

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
      Flex({
        direction: FlexDirection.Row,
        justifyContent: FlexAlign.End,
        alignItems: ItemAlign.End,
        space: {
          main: LengthMetrics.vp(10),
          cross: LengthMetrics.vp(10),
        }
      }) {
        RelativeContainer()
          .width(100)
          .height(100)
          .backgroundColor(Color.Yellow)

        RelativeContainer()
          .width(200)
          .height(200)
          .backgroundColor(Color.Blue)
      }

      RelativeContainer()
        .width(10)
        .height(100)//	提供系统内置手势与响应链上其他组件的手势设置并行关系的回调事件，当该组件做触摸碰撞测试时，会触发用户定义的回调来形成手势并行关系。
        .shouldBuiltInRecognizerParallelWith((current: GestureRecognizer, others: Array<GestureRecognizer>) => {
          current.getTag() // 当前手势识别器的tag。
          current.getType() //
          let info = current.getEventTargetInfo();
          info.getId()//

          return current;
        })


      RelativeContainer()
        .width(`70%`)
        .height(`50%`)
        .backgroundColor(Color.Blue)// .gesture( // 没有滑动更新数值的回调，不适合处理
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
              //event.repeat

              console.log(`gesture - TapGesture`)
              if (event.fingerList.length > 0) {
                let finger = event.fingerList[0];
                console.log(`gesture - TapGesture - onAction finger ${finger.localX} ${finger.localY}`)
              }
            }),
        )
        .gesture(
          PanGesture().onActionStart((event: GestureEvent) => {
            // event.offsetX
            // event.offsetY
            // event.velocityX
            // event.velocityY
            // event.velocity
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
      //     .onActionStart((event: GestureEvent) => {
      //       event.pinchCenterX
      //       event.pinchCenterY
      //       event.scale
      //     })
      //     .onActionUpdate((event: GestureEvent) => {
      //     })
      //     .onActionEnd((event: GestureEvent) => {
      //
      //     })
      //     .onActionCancel(() => {
      //
      //     })
      // )
      // .gesture(
      //   RotationGesture()
      //     .onActionStart((event: GestureEvent) => {
      //       event.angle
      //     })
      //     .onActionUpdate((event: GestureEvent) => {
      //     })
      //     .onActionEnd((event: GestureEvent) => {
      //
      //     })
      //     .onActionCancel(() => {
      //
      //     })
      // )

      // .gesture(
      //   SwipeGesture()
      //     .onAction((event: GestureEvent) => {
      //       event.angle
      //       event.speed
      //     })
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


    }.backgroundColor(Color.Orange).width(`100%`).height(`100%`)
    .justifyContent(FlexAlign.Center)
  }
}