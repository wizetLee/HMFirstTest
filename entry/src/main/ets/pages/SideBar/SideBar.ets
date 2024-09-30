@Entry({ routeName: "SideBarPage" })
@Component
struct SideBarPage {
  componentName = "SideBarPage"

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

  normalIcon: Resource = $r("app.media.app_icon")
  selectedIcon: Resource = $r("app.media.startIcon")
  @State arr: number[] = [1, 2, 3]
  @State current: number = 1

  build() {
    SideBarContainer(SideBarContainerType.Overlay) {
      this.sideBar()
      this.content()
    }
    //.showSideBar(true)

    .showControlButton(false)
    .controlButton({})
    // .controlButton({
    //   icons: {
    //     hidden: $r('app.media.setting'),
    //     shown: $r('app.media.setting'),
    //     switching: $r('app.media.setting')
    //   }
    // })
    // .autoHide(false)
    .sideBarWidth("50%")
    .minSideBarWidth("10%")
    .maxSideBarWidth("50%")
    .minContentWidth(0) // embed的形态有用
    .onChange((value: boolean) => {
      console.info('status:' + value)
    })
    .divider({
      strokeWidth: '1vp',
      color: Color.Gray,
      startMargin: '4vp',
      endMargin: '4vp'
    })
  }

  //FIXME: ---
  @Builder
  sideBar() {
    Column() {
      ForEach(this.arr, (item: number) => {
        Column({ space: 5 }) {
          Image(this.current === item ? this.selectedIcon : this.normalIcon).width(64).height(64)
          Text("Index0" + item)
            .fontSize(25)
            .fontColor(this.current === item ? '#0A59F7' : '#999')
            .fontFamily('source-sans-pro,cursive,sans-serif')
        }
        .onClick(() => {
          this.current = item
        })
      }, (item: string) => item)
    }.width('100%')
    .justifyContent(FlexAlign.SpaceEvenly)
    // .backgroundColor('#19000000')
    .backgroundColor(Color.Orange)
  }

  @Builder
  content() {
    Column() {
      Text('SideBarContainer content text1').fontSize(25)
      Text('SideBarContainer content text2').fontSize(25)
    }
    .margin({ top: 50, left: 20, right: 30 })
  }
}