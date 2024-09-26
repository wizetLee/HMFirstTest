@Entry({ routeName: "MyPage" })
@Component
struct MyPage {
  componentName = "MyPage"

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


      Text("这是我").onClick((event) => {
        event.displayX
        event.displayY
        event.windowX
        event.windowY
        event.target
        event.x
        event.y
        // event.screenX // event.windowX
        // event.screenY // event.windowY
        // event.pressure
        event.timestamp
        event.preventDefault
      }).onFocus(() => {
        // 获得焦点
      }).onBlur(() => {
        // 失去焦点
      })
    }
  }
}


@Component
struct TestComponent {
  build() {
    Text("TestComponent")
  }

  //2024年 9月22日 星期日 15时05分11秒 CST 没测出来
  /// 挂载卸载事件指组件从组件树上挂载、卸载时触发的事件。
  /// 系统能力： SystemCapability.ArkUI.ArkUI.Full
  //
  // 回调的调用时机一定在组件布局渲染之前。
  // 不允许在回调中对组件树进行变更，例如启动动画，或是使用if-else变更组件树结构。
  onAttach(callback: Callback<void, void>): CommonAttribute {
    console.log("TestComponent onAttach")
    return this
  }

  /// 组件挂载至组件树时触发此回调。
  onDetach(callback: Callback<void, void>): CommonAttribute {
    console.log("TestComponent onAttach")
    return this
  }
}