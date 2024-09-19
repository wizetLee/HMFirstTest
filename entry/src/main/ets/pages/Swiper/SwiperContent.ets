@Component
export struct SwiperContent {
  @Require pageIndex: number = 0
  @Prop @Watch('valueChange') index: number = 0
  private intervalID: number | undefined

  aboutToAppear(): void {
    this.valueChange()
  }

  aboutToDisappear(): void {
    if (this.intervalID) {
      clearInterval(this.intervalID)
      this.intervalID = undefined;
    }
  }

  build() {
    Column() {
      Text(`${this.index}`)
    }.layoutWeight(1)
  }

  valueChange() {
    if (this.index == this.pageIndex) {
      console.log(`页面${this.pageIndex}定时器启动!!!!!`)
      if (this.intervalID) {
        clearInterval(this.intervalID)
        this.intervalID = undefined;
      }

      this.intervalID = setInterval(() => {
        console.log(`页面${this.pageIndex}定时器事件事件事件事件事件事件事件`)
      }, 3000)

    } else {
      if (this.intervalID) {
        console.log(`页面${this.pageIndex}定时器关闭XXXXX`)
        clearInterval(this.intervalID)
        this.intervalID = undefined;
      }
    }
  }
}