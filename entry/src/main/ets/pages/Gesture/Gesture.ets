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

      RelativeContainer()
        .width(`100%`)
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
              console.log(`gesture - TapGesture`)
              if (event.fingerList.length > 0) {
                let finger = event.fingerList[0];
                console.log(`gesture - TapGesture - onAction finger ${finger.localX} ${finger.localY}`)
              }
            }),
        )
        .gesture(
          PanGesture().onActionStart((event: GestureEvent) => {
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
      // )
      // .gesture(
      //   RotationGesture()
      // )
      // .gesture(
      //   SwipeGesture()
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